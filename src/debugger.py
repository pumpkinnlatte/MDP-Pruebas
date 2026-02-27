# This file is part of MDP-ProbLog.

# MDP-ProbLog is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# MDP-ProbLog is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with MDP-ProbLog.  If not, see <http://www.gnu.org/licenses/>.

import os
import sys
import pandas as pd
import itertools
from src.fluent import StateSpace, ActionSpace, Fluent
from datetime import datetime

class MDPDebugger(object):
    """
    Utility class for inspection, logging, and debugging of MDP-ProbLog
    internal operations.
    """

    DEBUG_DIR = 'src/debug'

    @classmethod
    def ensure_debug_dir(cls):
        """Ensure that the debug directory exists."""
        if not os.path.exists(cls.DEBUG_DIR):
            os.makedirs(cls.DEBUG_DIR)

    @staticmethod
    def _format_state_name(state_dict):
        """
        Generates a clean, readable string representation of a state dictionary.
        Safely strips the ProbLog time-step argument (e.g., ',0)' or ', 0)') 
        to output pristine names like 'pos(a)'.
        """
        active_terms = []
        # Support both dictionaries and tuples of items
        items = state_dict.items() if isinstance(state_dict, dict) else state_dict
        
        for term, val in items:
            if val == 1:
                term_str = str(term)
                # Cleaning ProbLog syntax: pos(a, 0) -> pos(a)
                if term_str.endswith(')'):
                    if ', 0)' in term_str:
                        clean_term = term_str.replace(', 0)', ')')
                    elif ',0)' in term_str:
                        clean_term = term_str.replace(',0)', ')')
                    elif '(0)' in term_str:
                        clean_term = term_str.replace('(0)', '')
                    else:
                        clean_term = term_str
                else:
                    clean_term = term_str
                active_terms.append(clean_term)
        
        if not active_terms:
            return "Base_State"
            
        return " + ".join(sorted(active_terms))

    @staticmethod
    def _format_action_name(action_dict):
        """Generates a clean string representation of an action dictionary."""
        items = action_dict.items() if isinstance(action_dict, dict) else action_dict
        for term, val in items:
            if val == 1:
                return str(term)
        return "No_Action"

    @classmethod
    def save_instructions_table(cls, db, filename="instructions_table.txt"):
        """Save the ClauseDB instruction table to a file for inspection."""
        cls.ensure_debug_dir()
        filepath = os.path.join(cls.DEBUG_DIR, filename)

        try:
            with open(filepath, 'w', encoding='utf-8') as f:
                timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
                f.write("=== MDP-ProbLog Instructions Table ===\n")
                f.write("Timestamp: {}\n".format(timestamp))
                f.write("Total Nodes: {}\n".format(len(db)))
                f.write("=" * 60 + "\n\n")
                f.write("{:<6} | {}\n".format('ID', 'Instruction / Content'))
                f.write("-" * 60 + "\n")

                for index, node in enumerate(db.iter_raw()):
                    f.write("{:<6} | {}\n".format(index, str(node)))

        except IOError as e:
            print("[ERROR] Failed to write debug file: {}".format(e))

    @classmethod
    def save_schema(cls, schema, filename="schema_dump.txt"):
        """Save the FluentSchema representation to a file."""
        cls.ensure_debug_dir()
        filepath = os.path.join(cls.DEBUG_DIR, filename)

        try:
            with open(filepath, 'w', encoding='utf-8') as f:
                f.write(str(schema))
        except IOError as e:
            print("[ERROR] Failed to save schema: {}".format(e))

    @classmethod
    def export_transition_model(cls, mdp, filename="transition_matrices.txt"):
        """
        Exporta las probabilidades de transición P(s'|s,a) usando el iterador
        de base mixta y los índices absolutos del FluentSchema.
        """
        import os
        import pandas as pd
        from src.fluent import StateSpace, ActionSpace

        cls.ensure_debug_dir()
        filepath = os.path.join(cls.DEBUG_DIR, filename)

        # 1. Instanciamos los espacios usando la nueva arquitectura
        states = StateSpace(mdp.state_schema)
        actions = ActionSpace(mdp.actions())
        
        # 2. Generar etiquetas legibles (extrayendo solo las variables activas == 1)
        state_names = []
        for s in states:
            # Filtramos el diccionario: conservamos la llave 'k' solo si su valor 'v' es 1
            active_terms = [str(k) for k, v in s.items() if v == 1]
            
            # Si su MDP tuviera múltiples factores (ej. posición y clima), los unimos lógicamente
            clean_name = " ∧ ".join(active_terms) 
            state_names.append(clean_name)
        
        # 3. Recuperar los desplazamientos posicionales directamente del esquema
        strides = mdp.state_schema.strides

        try:
            with open(filepath, 'w', encoding='utf-8') as f:
                f.write("============================================================\n")
                f.write(" Matrices de Transición P(s'|s, a) por Acción\n")
                f.write("============================================================\n\n")

                for j, action in enumerate(actions):
                    # Formatear el nombre de la acción (buscar el término con valor 1)
                    clean_action = next((str(k) for k, v in action.items() if v == 1), "Unknown")
                    f.write(f"--- Matriz de Transición para la Acción: [{clean_action}] ---\n")
                    
                    matrix = []
                    for i, state in enumerate(states):
                        cache_key = (i, j)
                        # Recuperar factores estructurados (con ramas None para ISFs)
                        transition_groups = mdp.structured_transition(state, action, cache_key)
                        
                        # Fila densa inicializada en ceros
                        row = [0.0] * len(states)

                        def _calculate_destinations(groups, k=0, current_index=0, joint_prob=1.0):
                            """
                            Traversa el árbol estocástico multiplicando probabilidades
                            y acumulando el índice absoluto del estado destino.
                            """
                            # Caso Base: Alcanzamos la última dimensión factorial
                            if k == len(groups):
                                row[current_index] += joint_prob
                                return
                                
                            factor = groups[k]
                            stride = strides[k]
                            
                            for term, prob in factor:
                                # Delegamos la resolución del índice al esquema absoluto
                                val = mdp.state_schema.get_local_index(k, term)
                                # Llamada recursiva profundizando en el árbol
                                _calculate_destinations(groups, k + 1, current_index + val * stride, joint_prob * prob)

                        # Ejecutar la recursión para la fila actual poblada de transiciones
                        _calculate_destinations(transition_groups)
                        matrix.append(row)
                    
                    # 4. Formatear y escribir la matriz densa en el archivo usando Pandas
                    df = pd.DataFrame(matrix, index=state_names, columns=state_names)
                    f.write(df.to_string(float_format="{:.2f}".format))
                    f.write("\n\n")
                    
        except IOError as e:
            print(f"[ERROR] Fallo al escribir el archivo de transición: {e}")

    @classmethod
    def export_reward_model(cls, mdp, filename="reward_matrix.txt"):
        """Exporta las recompensas inmediatas esperadas R(s, a)."""
        cls.ensure_debug_dir()
        filepath = os.path.join(cls.DEBUG_DIR, filename)

        states = list(StateSpace(mdp.state_schema))
        actions = list(ActionSpace(mdp.actions()))

        row_names = [cls._format_state_name(s) for s in states]
        col_names = [cls._format_action_name(a) for a in actions]

        try:
            matrix = []
            for state in states:
                row = []
                for action in actions:
                    reward = mdp.reward(state, action)
                    row.append(reward)
                matrix.append(row)

            df = pd.DataFrame(matrix, index=row_names, columns=col_names)

            with open(filepath, 'w', encoding='utf-8') as f:
                f.write("============================================================\n")
                f.write(" Matriz de Recompensas Inmediatas R(s, a)\n")
                f.write("============================================================\n\n")
                f.write(df.to_string(float_format="{:.2f}".format))
                f.write("\n")

        except IOError as e:
            print(f"[ERROR] Fallo al escribir el archivo de recompensa: {e}")

    @classmethod
    def export_q_table(cls, mdp, q_table, filename="q_values_table.txt"):
        """Exporta la tabla de valores de acción Q*(s,a)."""
        cls.ensure_debug_dir()
        filepath = os.path.join(cls.DEBUG_DIR, filename)

        states = list(StateSpace(mdp.state_schema))
        actions = list(ActionSpace(mdp.actions()))

        row_names = [cls._format_state_name(tuple(s.items())) for s in states]
        col_names = [cls._format_action_name(a) for a in actions]

        try:
            matrix = []
            for state in states:
                row = []
                state_key = tuple(state.items())
                for action in actions:
                    action_name = cls._format_action_name(action)
                    q_val = q_table.get((state_key, action_name), 0.0)
                    row.append(q_val)
                matrix.append(row)

            df = pd.DataFrame(matrix, index=row_names, columns=col_names)

            with open(filepath, 'w', encoding='utf-8') as f:
                f.write("============================================================\n")
                f.write(" Tabla Q Óptima q*(s, a) tras Convergencia\n")
                f.write("============================================================\n\n")
                pd.set_option('display.colheader_justify', 'center')
                f.write(df.to_string(float_format="{:.3f}".format, justify='left'))
                f.write("\n")

        except IOError as e:
            print(f"[ERROR] Fallo al escribir la tabla Q: {e}")

    @classmethod
    def export_value_history(cls, mdp, v_history, filename="v_convergence_history.txt"):
        """Exporta el historial de convergencia de Bellman V_k(s)."""
        cls.ensure_debug_dir()
        filepath = os.path.join(cls.DEBUG_DIR, filename)

        states = list(StateSpace(mdp.state_schema))
        col_names = [cls._format_state_name(s) for s in states]

        try:
            matrix = []
            row_labels = []
            
            for iteration in sorted(v_history.keys()):
                row_labels.append(f"k={iteration}")
                v_dict = v_history[iteration]
                row = [v_dict.get(i, 0.0) for i in range(len(states))]
                matrix.append(row)

            df = pd.DataFrame(matrix, index=row_labels, columns=col_names)

            with open(filepath, 'w', encoding='utf-8') as f:
                f.write("============================================================\n")
                f.write(" Historial de Convergencia de Bellman: V_k(s)\n")
                f.write("============================================================\n\n")
                f.write(df.to_string(float_format="{:.4f}".format))
                f.write("\n")

        except IOError as e:
            print(f"[ERROR] Fallo al escribir el historial de convergencia: {e}")


class CPTAnalyzer:
    def __init__(self, mdp):
        self.mdp = mdp
        self.state_factors = self._index_factors(mdp.state_schema.factors)
        self.action_factors = self._get_action_factors()

    def _index_factors(self, factors):
        index = {}
        for group in factors:
            name = group[0].functor
            index[name] = group
        return index

    def _get_action_factors(self):
        actions = self.mdp.actions()
        if not actions:
            return {}
        groups = {}
        for act in actions:
            name = act.functor
            if name not in groups:
                groups[name] = []
            groups[name].append(act)
        return groups

    def _get_domain_and_type(self, name):
        if name in self.state_factors:
            return self.state_factors[name], 'state'
        if name in self.action_factors:
            return self.action_factors[name], 'action'
        
        for act_name, terms in self.action_factors.items():
            for term in terms:
                if str(term) == name:
                    return [term], 'action_atom'
                    
        raise ValueError(f"La variable '{name}' no se encuentra en el esquema de Estados ni de Acciones.")