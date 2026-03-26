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

import sys
import logging
from enum import IntEnum

class VerbosityLevel(IntEnum):
    """
    Output verbosity levels for the system.
    
    SILENT: Zero output, exceptions only.
    SCHEMA: Emits factorized schema and convergence summary.
    TRACE: SCHEMA plus detailed ProbLog circuit evaluation logs.
    """
    SILENT = 0
    SCHEMA = 1
    TRACE = 2


class VerbosityConfig(object):
    """
    Encapsulates the verbosity level and output stream configuration.
    """
    
    def __init__(self, level=VerbosityLevel.SILENT, stream=None):
        """
        Initialize the verbosity configuration.
        
        :param level: VerbosityLevel instance or a valid integer.
        :param stream: Output stream. Defaults to sys.stderr.
        """
        self.level = VerbosityLevel(level)
        self.stream = stream if stream is not None else sys.stderr


def setup_verbosity(config):
    """
    Configures the hierarchical logging system and captures standard warnings.
    
    Maps the domain-specific VerbosityLevel to Python's standard logging levels,
    attaches a StreamHandler with the specified stream, and defines the format.
    Standard Python warnings are captured and routed through this same system.
    
    :param config: A VerbosityConfig instance dictating the desired observability.
    """
    level_mapping = {
        VerbosityLevel.SILENT: logging.ERROR,
        VerbosityLevel.SCHEMA: logging.INFO,
        VerbosityLevel.TRACE:  logging.DEBUG
    }
    
    python_log_level = level_mapping.get(config.level, logging.ERROR)
    
    # base logger for the entire package
    base_logger = logging.getLogger('mdpproblog')
    base_logger.setLevel(python_log_level)
    base_logger.propagate = False

    base_logger.handlers.clear()
    
    handler = logging.StreamHandler(stream=config.stream)
    handler.setLevel(python_log_level)
    
    # format
    formatter = logging.Formatter('[%(name)s] %(message)s')
    handler.setFormatter(formatter)
    
    base_logger.addHandler(handler)
    
    # unify warnings with our logging system
    logging.captureWarnings(True)
    warnings_logger = logging.getLogger('py.warnings')
    warnings_logger.setLevel(python_log_level)
    warnings_logger.handlers.clear()
    warnings_logger.addHandler(handler)
    warnings_logger.propagate = False