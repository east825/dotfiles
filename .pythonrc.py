try:
    from jedi.utils import setup_readline
    setup_readline()
    # del setup_readline
except ImportError:
    # Fallback to the stdlib readline completer if it is installed.
    # Taken from http://docs.python.org/2/library/rlcompleter.html
    # print("Jedi is not available")
    # Installed by default in Python >= 3.4
    try:
        import readline
        import rlcompleter
        readline.parse_and_bind("tab: complete")
        del readline, rlcompleter
    except ImportError:
        # print("Readline is not available")
        pass

# Import some frequently used modules
import os
import sys
import re
