# Coding Standards

This project targets the C17 standard for all C sources and C++17 for any C++ sources.

Two build systems are maintained side by side:

1. **Make** – a simple Makefile is provided at the repository root. It uses CMake under the hood to configure and build targets.
2. **CMake** – developers can invoke CMake directly for more advanced workflows.

The historical Plan 9 `mk` scripts remain for reference but new development should rely on Make or CMake.
