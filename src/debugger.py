import os
from datetime import datetime

class MDPDebugger(object):
    """
    Clase utilitaria para inspección, logging y depuración del
    funcionamiento interno de MDP-ProbLog.
    """
    
    DEBUG_DIR = 'src/debug'

    @classmethod
    def _ensure_debug_dir(cls):
        """Asegura que exista el directorio de debug."""
        if not os.path.exists(cls.DEBUG_DIR):
            os.makedirs(cls.DEBUG_DIR)
            print(f"[DEBUG] Directorio '{cls.DEBUG_DIR}' creado.")

    @classmethod
    def save_instructions_table(cls, db, filename="instructions_table.txt"):
        """
        Vuelca el contenido de la ClauseDB (Tabla de instrucciones) a un archivo.

        :param db: Instancia de problog.engine.ClauseDB (self._engine._db)
        :param filename: Nombre del archivo de salida
        """
        cls._ensure_debug_dir()
        
        filepath = os.path.join(cls.DEBUG_DIR, filename)
        
        try:
            with open(filepath, 'w', encoding='utf-8') as f:
                # Encabezado del archivo
                timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
                f.write(f"=== MDP-ProbLog Instructions Table ===\n")
                f.write(f"Timestamp: {timestamp}\n")
                f.write(f"Total Nodes: {len(db)}\n")
                f.write("="*60 + "\n\n")
                f.write(f"{'ID':<6} | {'Instruction / Content'}\n")
                f.write("-" * 60 + "\n")

                # Iterar sobre los nodos de la base de datos lógica
                # ProbLog ClauseDB es iterable y devuelve los nodos en orden
                for idx, node in enumerate(db.iter_raw()):
                    # str(node) devuelve la representación en Prolog del nodo
                    node_repr = str(node)
                    f.write(f"{idx:<6} | {node_repr}\n")
            
            print(f"[DEBUG] Tabla de instrucciones guardada exitosamente en: {filepath}")
            
        except IOError as e:
            print(f"[ERROR] No se pudo escribir el archivo de debug: {e}")

    @classmethod
    def log_schema(cls, schema, filename="schema_dump.txt"):
        """
        Guarda la representación del FluentSchema en un archivo.
        """
        cls._ensure_debug_dir()
        filepath = os.path.join(cls.DEBUG_DIR, filename)
        
        try:
            with open(filepath, 'w', encoding='utf-8') as f:
                f.write(str(schema))
            print(f"[DEBUG] Esquema de fluentes guardado en: {filepath}")
        except IOError as e:
            print(f"[ERROR] Fallo al guardar esquema: {e}")

    @classmethod
    def inspect_by_index(self, db):
        total = len(db)
        print(f"Longitud reportada por len(): {total}")
        
        print("--- INSPECCIÓN INDICE POR INDICE ---")
        # Iteramos manualmente por rango numérico, no por iterador de objeto
        for i in range(total):
            try:
                node = db.get_node(i)
                node_type = type(node).__name__
                print(f"[{i}] Tipo: {node_type} | Contenido: {node}")
            except Exception as e:
                print(f"[{i}] ERROR DE ACCESO: {e}")