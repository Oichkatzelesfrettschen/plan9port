#!/usr/bin/env python3
"""Recursively list all mkfiles in the repository.

Usage:
    python3 list_mkfiles.py [root]
If no root is supplied the current working directory is used.
"""

from pathlib import Path
import sys

# Determine root directory from arguments.
root = Path(sys.argv[1]) if len(sys.argv) > 1 else Path('.')

# Iterate through the filesystem looking for files literally named 'mkfile'.
for mk in root.rglob('mkfile'):
    print(mk)
