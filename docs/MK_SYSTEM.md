# Plan9 mk Build System Overview

This document outlines the structure of the original Plan9 `mk` build files
present in this repository.

## mkfile hierarchy

The source tree uses many `mkfile` scripts.  Each directory that produces
binaries or libraries typically contains a `mkfile`.  The top level
`src/mkfile` orchestrates the build by invoking `mk` in subdirectories.
Common variables and rules come from `src/mkhdr`.

Example pattern:

```
<mkhdr
LIB=libfoo.a
OFILES=foo.$O bar.$O
<$PLAN9/src/mksyslib
```

The `mkfile` syntax is similar to Make but uses Plan9 conventions such as `$O`
for the object suffix and `>$target` to reference build targets.

## Conversion strategy

The project maintains a minimal CMake build.  To migrate additional
directories, follow these steps:

1. Enumerate every `mkfile` using `tools/list_mkfiles.py`.
2. For each directory, create a `CMakeLists.txt` that lists source files
   and replicates the output target.
3. Add the directory with `add_subdirectory` from its parent `CMakeLists.txt`.
4. Gradually verify builds with both `mk` and CMake to ensure compatibility.

The helper script `tools/mk2cmake.py` generates a skeletal `CMakeLists.txt`
for directories containing a `mkfile`.  The generated file simply builds all
`*.c` sources as a static library.  Manual editing is usually required to
match the original `mk` rules.
