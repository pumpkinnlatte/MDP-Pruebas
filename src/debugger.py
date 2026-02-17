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
