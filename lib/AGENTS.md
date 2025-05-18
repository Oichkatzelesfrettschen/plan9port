# Library Resources Guide

## Overview
The `lib` directory houses configuration files and auxiliary resources used by the Plan 9 tools.
Examples include fonts, grammar files for `grap`, and subdirectories containing language dictionaries.

Some notable components:
- `git/` holds scripts for interacting with Git.
- `fortunes` provides quotes used by the `fortune` program.

## Usage Notes
- Files in this directory are installed under `\$PLAN9/lib`.
- Scripts and programs rely on these resources being present at runtime.

## Editing Guidance
Keep changes minimal and preserve compatibility with Plan 9 programs expecting these files. Document any additions in README files within the subdirectories.

