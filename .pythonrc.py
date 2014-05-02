try:
    from jedi.utils import setup_readline
    setup_readline()
    del setup_readline
except ImportError:
    # Fallback to the stdlib readline completer if it is installed.
    # Taken from http://docs.python.org/2/library/rlcompleter.html
    try:
        import readline
        import rlcompleter
        readline.parse_and_bind("tab: complete")
        del readline, rlcompleter
    except ImportError:
        pass

# Import some frequently used modules
import os
import re
import sys

# Disable standard hook in Python >= 3.4
if sys.version_info >= (3, 4):
    del sys.__interactivehook__ 

