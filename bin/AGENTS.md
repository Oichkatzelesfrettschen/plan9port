# Binary Scripts Guide

## Overview
The `bin` directory contains shell scripts and wrappers that emulate Plan 9 command behavior on Unix.
Many scripts prefix Plan 9 programs with `9` to avoid clashes with native Unix tools.

Example scripts include `9c` (Plan 9 C compiler front end) and `9l` (Plan 9 linker wrapper).

## Usage Notes
- Scripts expect `PLAN9` environment variable pointing to the installed tree.
- Most scripts simply invoke the corresponding program in `\$PLAN9/bin` after adjusting the environment or arguments.

## Development Tips
- Keep scripts POSIX sh compatible.
- Maintain consistency with upstream Plan 9 command interfaces.

