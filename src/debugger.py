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
        de base mixta. Adaptado para procesar objetos lógicos 'Term' nativos.
        """
        cls.ensure_debug_dir()
        filepath = os.path.join(cls.DEBUG_DIR, filename)

        from src.fluent import StateSpace, ActionSpace
        state_space = StateSpace(mdp.state_schema)
        states = list(state_space)
        actions = list(ActionSpace(mdp.actions()))

        state_names = [cls._format_state_name(s) for s in states]
        
        # Calculamos los desplazamientos (strides) para el mapeo matricial
        factors = mdp.state_schema.factors
        bases = [len(f) for f in factors]
        strides = [1] * len(bases)
        if len(bases) > 0:
            for i in range(len(bases) - 2, -1, -1):
                strides[i] = strides[i+1] * bases[i+1]

        try:
            with open(filepath, 'w', encoding='utf-8') as f:
                f.write("============================================================\n")
                f.write(" Matrices de Transición P(s'|s, a) por Acción\n")
                f.write("============================================================\n\n")

                for action in actions:
                    act_name = cls._format_action_name(action)
                    f.write(f"--- Matriz de Transición para la Acción: [{act_name}] ---\n")
                    
                    matrix = []
                    for current_state in states:
                        row = [0.0] * len(states)
                        structured_transitions = mdp.structured_transition(current_state, action)
                        
                        def _calculate_destinations(groups, current_idx=0, joint_prob=1.0, k=0):
                            if k == len(groups):
                                return [(current_idx, joint_prob)]
                                
                            destinations = []
                            base_factor = factors[k]
                            
                            # Caso 1: BSF (Fluente Booleano de longitud 1)
                            if len(base_factor) == 1:
                                if not groups[k]:
                                    p_true = 0.0
                                else:
                                    # groups[k] contiene [(Term, prob)]
                                    term_obj, p_true = groups[k][0]
                                    
                                p_false = 1.0 - p_true
                                if p_false > 1e-6: # Rama False (índice 0)
                                    destinations.extend(_calculate_destinations(groups, current_idx + (0 * strides[k]), joint_prob * p_false, k + 1))
                                if p_true > 1e-6:  # Rama True (índice 1)
                                    destinations.extend(_calculate_destinations(groups, current_idx + (1 * strides[k]), joint_prob * p_true, k + 1))
                            
                            # Caso 2: ADS (Fluente Multivaluado de longitud > 1)
                            else:
                                for term_obj, prob in groups[k]:
                                    # Limpiamos el término entrante (ej. 'pos(b, 1)' -> 'pos(b)')
                                    term_clean = cls._format_state_name({term_obj: 1})
                                    option_idx = 0
                                    
                                    # Buscamos su índice en el factor base (ej. iterando 'pos(a, 0)', 'pos(b, 0)'...)
                                    for i, base_term in enumerate(base_factor):
                                        if cls._format_state_name({base_term: 1}) == term_clean:
                                            option_idx = i
                                            break
                                            
                                    next_idx = current_idx + (option_idx * strides[k])
                                    destinations.extend(_calculate_destinations(groups, next_idx, joint_prob * prob, k + 1))
                                    
                            return destinations

                        dest_probs = _calculate_destinations(structured_transitions)
                        for dest_idx, prob in dest_probs:
                            if dest_idx < len(row):
                                row[dest_idx] += prob
                                
                        matrix.append(row)
                    
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