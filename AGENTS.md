# Plan9port Agent Instructions

## Purpose
This repository contains Plan 9 from Bell Labs software ported to Unix. It provides a collection of command-line tools, libraries, fonts and other data needed to reproduce a Plan 9 development environment on Unix systems.

These instructions help future agents or developers explore and modify the code base.

## Getting Started
1. Read `README.md` for a short introduction.
2. Run `./INSTALL` to build and install the system. The script builds the `mk` tool first and then uses it to compile the rest of the tree.
3. After installation, the environment is rooted under the `PLAN9` directory (default `/usr/local/plan9`). Executables live in `\$PLAN9/bin`.

## Repository Layout
- `src/` – C source code for libraries and commands. See `src/AGENTS.md` for details.
- `bin/` – Shell scripts and command wrappers. See `bin/AGENTS.md`.
- `lib/` – Configuration files, resources and data used by programs. See `lib/AGENTS.md`.
- `font/`, `face/`, `mac/` – Fonts and bitmap resources.
- `man/` – Manual pages.
- `ndb/` – Example network database entries.
- `news/` – Historical news posts and update notes.

Additional directories (`dict/`, `unix/`, `proto/`, `sky/`, `tmac/`, `postscript/`, etc.) provide supporting data and utilities.

## Build Notes
- The build system uses the Plan 9 `mk` tool rather than standard Make. Most directories contain a `mkfile` that describes the build rules.
- Running `mk install` inside a directory typically builds and installs that component.
- The root `Makefile` is only a placeholder; do not rely on it for building.

## Guiding Principles
- Preserve portability across Unix-like systems.
- Keep the directory structure aligned with the original Plan 9 tree when possible.
- Use plain C and sh; avoid introducing dependencies without strong justification.

## Further Documentation
Check the `man/` directory for manual pages describing individual tools and libraries. Each program usually has an accompanying manual page accessible with the `man` command after installation.

