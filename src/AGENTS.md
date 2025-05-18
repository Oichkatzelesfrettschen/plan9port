# Source Tree Guide

## Overview
The `src` directory holds the core source code for Plan 9 from Bell Labs. It is organized into libraries and commands.

- `cmd/` contains hundreds of subdirectories, each implementing a command-line utility or graphical program from Plan 9.
- `lib*` directories implement libraries used by the commands and by external projects.
- `mkfile` at the top level orchestrates building all libraries and commands using the Plan 9 `mk` tool.

## Building
1. Run `mk install` in this directory after the top level `./INSTALL` script has built `mk`.
2. Each subdirectory generally contains its own `mkfile` defining build rules.
3. Libraries install headers under `include/` and static archives in `\$PLAN9/lib`.

## Notes for Future Agents
- Many commands are self-contained C programs. Explore `cmd/<tool>/` to understand individual utilities.
- Libraries follow the naming convention `lib*`. For example, `lib9` provides the standard Plan 9 C library replacements for Unix.
- Avoid modifying original Plan 9 code without preserving portability.

