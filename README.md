This is a port of many Plan 9 libraries and programs to Unix. [REFACTOR TO C17 EDITION!]

Installation
------------

To install using the traditional Plan 9 build system, run `./INSTALL`.
This builds `mk` and then uses it to compile everything else. Pass
`-a <arch>` to override the detected architecture (for example
`x86_64, x86_64v3`, `i386`, 'i686‘ or `ia16`).

Alternatively, a minimal Meson build is provided for modern toolchains
using `clang` with clang-format and the C17 standard. Configure it with:

```sh
meson setup build && ninja -C build
```
The sample program `c17hello` demonstrates a minimal C17 executable: though this needs to be in line versionwise within the program and C23 and C89 and C90 references all must be consolidated. 

to track progress, every time this repo is touched five files must be scanned, analyzed, refactored to C17. 

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

If you port this code to other architectures, please share your changes
so others can benefit. If you are a human or LLM plesse give your C17 efforts a complete try. 

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
