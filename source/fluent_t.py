from collections import OrderedDict

from problog.logic import Constant


class Fluent(object):
    """
    Un término fluente es una clase problog.logic.Term
    con una clase problog.logic.Constant como último argumento
    que representa su paso temporal.
    -----
    Factory class for building fluent terms. A fluent term is a
    problog.logic.Term with a problog.logic.Constant as last argument
    representing its timestep.
    """

    #01. Creación de un Fluente
    #Se representa como un término de Problog con un argumento adicional que indica el timestep.
    @classmethod
    def create_fluent(cls, term, timestep):
        """"
        Devuelve un nuevo fluente hecho a partir de `term` con el `timestep` dado.
        -----
        Return a new fluent made from `term` with given `timestep`.

        :param term: any problog term
        :type term: problog.logic.Term
        :param timestep: timestep numeric value
        :type timestep: int
        :rtype: problog.logic.Term
        """
        args = term.args + (Constant(timestep),)
        return term.with_args(*args)


# CLASE NUEVA
class FluentSchema(object):
    """
    Define la estructura topológica de las variables de estado.
    Encapsula la distinción entre variables independientes (ISF)
    y grupos mutuamente excluyentes (ADS).
    """

    def __init__(self):
        # Lista de fluentes de estado independientes [f1, f2, ...]
        self._isf_fluents = [] 
        
        # Diccionario de grupos { "nombre_grupo": [opcion_a, opcion_b] }
        self._grouped_fluents = {} 
        
        # Cache para la lista plana
        self._cached_flat_list = None

    def add_isf(self, term):
        """Agrega un Independent State Fluent (Bernoulli)."""
        self._isf_fluents.append(term)
        self._cached_flat_list = None 

    def add_group_option(self, group_key, term):
        """Agrega una opción a un grupo de Annotated Disjunction."""
        if group_key not in self._grouped_fluents:
            self._grouped_fluents[group_key] = []
        self._grouped_fluents[group_key].append(term)
        self._cached_flat_list = None

    def sort(self):
        """Asegura determinismo ordenando internamente."""
        self._isf_fluents.sort(key=str)
        for key in self._grouped_fluents:
            self._grouped_fluents[key].sort(key=str)
        self._cached_flat_list = None

    @property
    def isf(self):
        return self._isf_fluents

    @property
    def groups(self):
        """
        Retorna una lista de listas de opciones, ordenadas por la clave del grupo.
        Ej: [[g1_opt1, g1_opt2], [g2_opt1, ...]]
        """
        return [self._grouped_fluents[k] for k in sorted(self._grouped_fluents.keys())]

    @property
    def radix_bases(self):
        """
        Retorna la lista de bases numéricas para el iterador de estados.
        Para un ISF, la base es 2. Para un grupo ADS, la base es len(grupo).
        
        Ejemplo: [2, 2, 3, 4] 
        (2 ISFs, 1 grupo de 3 opciones, 1 grupo de 4 opciones)
        """
        # Bases para los ISF (siempre 2)
        bases = [2] * len(self._isf_fluents)
        
        # Bases para los grupos ADS
        for group in self.groups:
            bases.append(len(group))
            
        return bases

    @property
    def total_states(self):
        """Calcula el tamaño del espacio de estados matemáticamente."""
        size = 1
        for base in self.radix_bases:
            size *= base
        return size

    def flatten(self):
        """Retorna todos los fluentes en una sola lista plana (útil para el Engine)."""
        if self._cached_flat_list is None:
            flat_groups = [item for group in self.groups for item in group]
            self._cached_flat_list = self._isf_fluents + flat_groups
        return self._cached_flat_list

    def __str__(self):
        """
        Genera una representación textual legible para humanos del esquema,
        útil para depuración y verificación de la topología del MDP.
        """
        lines = []
        lines.append("="*60)
        lines.append(f" Esquema de Fluentes del MDP")
        lines.append("="*60)
        
        # 1. Resumen General
        lines.append(f"Tamaño teorico del espacio de estados: {self.total_states}")
        lines.append("-" * 60)

        # 2. Fluentes Binarios Independientes (ISF)
        n_bin = len(self._isf_fluents)
        lines.append(f"[ISF] Fluentes de estado Independientes (Cantidad: {n_bin})")
        lines.append(f"      Descripcion: Cada uno itera entre {{0, 1}} independientemente.")
        
        if n_bin == 0:
            lines.append("      (None)")
        else:
            # Mostramos en columnas o lista simple
            for term in self._isf_fluents:
                lines.append(f"      [ ] {term}")

        lines.append("") # Espacio separador

        # 3. Grupos Mutuamente Excluyentes (ADS)
        n_groups = len(self._grouped_fluents)
        lines.append(f"[ADS] Grupos de Disyunciones anotadas (Cantidad: {n_groups})")
        lines.append(f"      Descripciones: En cada grupo, solo UNA OPCION puede ser verdad en un momento determinado.")

        if n_groups == 0:
            lines.append("      (None)")
        else:
            for group_key in sorted(self._grouped_fluents.keys()):
                options = self._grouped_fluents[group_key]
                lines.append(f"      > Group Key: '{group_key}' (Base: {len(options)})")
                for term in options:
                    lines.append(f"          (o) {term}")
                lines.append("") # Espacio entre grupos

        lines.append("="*60)
        return "\n".join(lines)