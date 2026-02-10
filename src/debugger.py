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