This repository ports many of the original Plan 9 from Bell Labs tools to Unix systems.
See `CODING_STANDARDS.md` for the project's C17/C++17 guidelines.

Installation
------------

The recommended way to build is using the provided **Makefile** which invokes
CMake under the hood. Simply run:

```sh
make
```

This configures a `build` directory and compiles all default targets with the
C17/C++17 toolchain. The historical `./INSTALL` script and Plan&nbsp;9 `mk`
files remain for reference.

Additional notes about the `mk` build scripts and helper tools for
migrating directories to CMake reside in `docs/MK_SYSTEM.md`.

For more details, see install(1), at install.txt in this directory
and at https://9fans.github.io/plan9port/man/man1/install.html.

Documentation
-------------

See https://9fans.github.io/plan9port/man/ for more documentation.
(Documentation is also in this tree, but you need to run
a successful install first.  After that, "9 man 1 intro".)

Intro(1) contains a list of man pages that describe new features
or differences from Plan 9.

Helping out
-----------

If you'd like to help out, great!

If you port this code to other architectures, please share your changes so others can benefit.

Git
---

You can use Git to keep your local copy up-to-date as we make
changes and fix bugs.  See the git(1) man page here ("9 man git")
for details on using Git.

Status
------
[![Github Actions Build Status](https://github.com/9fans/plan9port/actions/workflows/actions.yaml/badge.svg)](https://github.com/9fans/plan9port/actions/workflows/actions.yaml)
[![Coverity Scan Build Status](https://scan.coverity.com/projects/plan-9-from-user-space/badge.svg)](https://scan.coverity.com/projects/plan-9-from-user-space)


Contact
-------

* Mailing list: https://groups.google.com/group/plan9port-dev
* Issue tracker: https://github.com/9fans/plan9port/issues
* Submitting changes: https://github.com/9fans/plan9port/pulls

* Russ Cox <rsc@swtch.com>
