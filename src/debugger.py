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
        """
        Ensure that the debug directory exists.
        """
        if not os.path.exists(cls.DEBUG_DIR):
            os.makedirs(cls.DEBUG_DIR)

    @classmethod
    def save_instructions_table(cls, db, filename="instructions_table.txt"):
        """
        Save the ClauseDB instruction table to a file for inspection.

        :param db: ProbLog clause database
        :type db: problog.engine.ClauseDB
        :param filename: output filename
        :type filename: str
        """
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
                    node_representation = str(node)
                    f.write("{:<6} | {}\n".format(index, node_representation))

        except IOError as e:
            print("[ERROR] Failed to write debug file: {}".format(e))

    @classmethod
    def save_schema(cls, schema, filename="schema_dump.txt"):
        """
        Save the FluentSchema representation to a file.

        :param schema: fluent schema
        :type schema: FluentSchema
        :param filename: output filename
        :type filename: str
        """
        cls.ensure_debug_dir()
        filepath = os.path.join(cls.DEBUG_DIR, filename)

        try:
            with open(filepath, 'w', encoding='utf-8') as f:
                f.write(str(schema))
        except IOError as e:
            print("[ERROR] Failed to save schema: {}".format(e))

    @classmethod
    def inspect_by_index(cls, db):
        """
        Inspect ClauseDB nodes by iterating through all indices.

        :param db: ProbLog clause database
        :type db: problog.engine.ClauseDB
        """
        total = len(db)
        print("Total nodes reported by len(): {}".format(total))

        print("--- INDEX-BY-INDEX INSPECTION ---")
        for i in range(total):
            try:
                node = db.get_node(i)
                node_type = type(node).__name__
                print("[{}] Type: {} | Content: {}".format(i, node_type, node))
            except Exception as e:
                print("[{}] ACCESS ERROR: {}".format(i, e))

    @classmethod
    def export_transition_model(cls, mdp, filename="transition_matrices.txt"):
        """
        Exporta las probabilidades de transición P(s'|s,a) en formato de 
        matrices cuadradas |S|x|S| para cada acción.
        """
        cls.ensure_debug_dir()
        filepath = os.path.join(cls.DEBUG_DIR, filename)

        from src.fluent import StateSpace, ActionSpace
        states = list(StateSpace(mdp.state_schema))
        actions = list(ActionSpace(mdp.actions()))

        # Funciones auxiliares para limpiar la sintaxis lógica (ej. s(class1, 0) -> class1)
        def clean_state_name(s_dict):
            for k, v in s_dict.items():
                if v == 1:
                    # Extrae 'class1' de 's(class1, 0)'
                    return str(k).split(',')[0].replace('s(', '')
            return "unknown"

        def clean_action_name(a_dict):
            for k, v in a_dict.items():
                if v == 1:
                    return str(k)
            return "unknown"

        state_names = [clean_state_name(s) for s in states]

        try:
            with open(filepath, 'w', encoding='utf-8') as f:
                f.write("============================================================\n")
                f.write(" Matrices de Transición P(s'|s, a) por Acción\n")
                f.write("============================================================\n\n")

                for action in actions:
                    act_name = clean_action_name(action)
                    f.write(f"--- Matriz de Transición para la Acción: [{act_name}] ---\n")
                    
                    matrix = []
                    for state in states:
                        # Obtenemos probabilidades brutas del motor
                        raw_probs = mdp.transition(state, action)
                        
                        # Mapeamos término limpio a probabilidad
                        prob_map = {}
                        for term, prob in raw_probs:
                            clean_term = str(term).split(',')[0].replace('s(', '')
                            prob_map[clean_term] = prob
                        
                        # Construimos la fila en el orden exacto de 'state_names'
                        row = [prob_map.get(sn, 0.0) for sn in state_names]
                        matrix.append(row)
                    
                    # Usamos pandas para un formateo tabular impecable
                    df = pd.DataFrame(matrix, index=state_names, columns=state_names)
                    f.write(df.to_string(float_format="{:.2f}".format))
                    f.write("\n\n")

 
        except IOError as e:
            print(f"[ERROR] Fallo al escribir el archivo: {e}")


    @classmethod
    def export_reward_model(cls, mdp, filename="reward_matrix.txt"):
        """
        Exporta las recompensas inmediatas esperadas en una matriz de |S|x|A|.
        """
        cls.ensure_debug_dir()
        filepath = os.path.join(cls.DEBUG_DIR, filename)

        from src.fluent import StateSpace, ActionSpace
        states = list(StateSpace(mdp.state_schema))
        actions = list(ActionSpace(mdp.actions()))

        def clean_state_name(s_dict):
            for k, v in s_dict.items():
                if v == 1:
                    return str(k).split(',')[0].replace('s(', '')
            return "unknown"

        def clean_action_name(a_dict):
            for k, v in a_dict.items():
                if v == 1:
                    return str(k)
            return "unknown"

        row_names = [clean_state_name(s) for s in states]
        col_names = [clean_action_name(a) for a in actions]

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
            print(f"[ERROR] Fallo al escribir el archivo: {e}")

    @classmethod
    def export_q_table(cls, mdp, q_table, filename="q_values_table.txt"):
        """
        Exporta la función de valor de acción óptima q*(s,a) en una matriz de |S|x|A|.
        Permite validar empíricamente la convergencia de la Ecuación de Optimidad de Bellman.
        """
        cls.ensure_debug_dir()
        filepath = os.path.join(cls.DEBUG_DIR, filename)

        from src.fluent import StateSpace, ActionSpace
        states = list(StateSpace(mdp.state_schema))
        actions = list(ActionSpace(mdp.actions()))

        def clean_state_name(state_items):
            """
            Extrae el nombre del estado basándose en los fluentes activos.
            Recibe una lista de tuplas ((Termino, 1/0), ...)
            """
            active_terms = []
            for term, val in state_items:
                if val == 1:
                    # Convierte marketed(denis, 0) -> marketed(denis)
                    clean_term = str(term).rsplit(',', 1)[0]
                    active_terms.append(clean_term)
            
            # Si ningún fluente está en 1 (ej. estado base booleano), retorna 'none'
            if not active_terms:
                return "Base_State(0)"
                
            # Une múltiples fluentes activos (ej. si hay más de 1 ADS)
            return " + ".join(active_terms)

        def clean_action_name(a_dict):
            for k, v in a_dict.items():
                if v == 1:
                    return str(k)
            return "unknown_action"

        row_names = [clean_state_name(tuple(s.items())) for s in states]
        col_names = [clean_action_name(a) for a in actions]

        try:
            matrix = []
            for i, state in enumerate(states):
                row = []
                state_key = tuple(state.items())
                for j, action in enumerate(actions):
                    action_name = clean_action_name(action)
                    
                    # Recuperamos el valor Q del diccionario
                    q_val = q_table.get((state_key, action_name), 0.0)
                    row.append(q_val)
                matrix.append(row)

            # Para evitar duplicados en los índices si los nombres son largos
            df = pd.DataFrame(matrix, index=row_names, columns=col_names)

            with open(filepath, 'w', encoding='utf-8') as f:
                f.write("============================================================\n")
                f.write(" Tabla Q Óptima q*(s, a) tras Convergencia\n")
                f.write("============================================================\n\n")
                
                # Configuramos Pandas para alinear a la izquierda los nombres
                pd.set_option('display.colheader_justify', 'center')
                f.write(df.to_string(float_format="{:.3f}".format, justify='left'))
                f.write("\n")

         
        except IOError as e:
            print(f"[ERROR] Fallo al escribir el archivo: {e}")

    @classmethod
    def export_value_history(cls, mdp, v_history, filename="v_convergence_history.txt"):
        """
        Exporta el historial de convergencia de la función de valor V_k(s).
        Permite visualizar la propagación de la recompensa a través de las iteraciones.
        """
        cls.ensure_debug_dir()
        filepath = os.path.join(cls.DEBUG_DIR, filename)

        from src.fluent import StateSpace
        states = list(StateSpace(mdp.state_schema))

        def clean_state_name(s_dict):
            for k, v in s_dict.items():
                if v == 1:
                    return str(k).split(',')[0].replace('s(', '')
            return "unknown"

        col_names = [clean_state_name(s) for s in states]

        try:
            matrix = []
            row_labels = []
            
            # Ordenamos las iteraciones cronológicamente
            for iteration in sorted(v_history.keys()):
                row_labels.append(f"k={iteration}")
                v_dict = v_history[iteration]
                
                # Construimos la fila asegurando el orden correcto de los estados (índice 0 a |S|-1)
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
            print(f"[ERROR] Fallo al escribir el archivo: {e}")


class CPTAnalyzer:
    def __init__(self, mdp):
        self.mdp = mdp
        # Indices para búsqueda rápida de factores por nombre
        self.state_factors = self._index_factors(mdp.state_schema.factors)
        self.action_factors = self._get_action_factors()

    def _index_factors(self, factors):
        """Organiza los factores por el nombre de su predicado (functor)."""
        index = {}
        for group in factors:
            # Asumimos que todos los términos del grupo comparten functor (ej: dado(1), dado(2)...)
            name = group[0].functor
            index[name] = group
        return index

    def _get_action_factors(self):
        """
        Recupera las acciones y las agrupa como un factor único o múltiples
        dependiendo de cómo estén definidas en MDP-ProbLog.
        """
       
        actions = self.mdp.actions()
        if not actions:
            return {}
    
        # Estrategia: Agrupar por functor
        groups = {}
        for act in actions:
            name = act.functor
            if name not in groups:
                groups[name] = []
            groups[name].append(act)
        return groups

    def _get_domain_and_type(self, name):
        """Busca el dominio de una variable y determina si es estado o acción."""
        if name in self.state_factors:
            return self.state_factors[name], 'state'
        if name in self.action_factors:
            return self.action_factors[name], 'action'
        
        # Caso especial: Si el usuario pone el nombre de una acción específica (ej: 'tirar')
        # y esa acción es un átomo sin argumentos (aridad 0), la buscamos directamente.
        for act_name, terms in self.action_factors.items():
            for term in terms:
                if str(term) == name:
                    return [term], 'action_atom'
                    
        raise ValueError(f"La variable '{name}' no se encuentra en el esquema de Estados ni de Acciones.")

