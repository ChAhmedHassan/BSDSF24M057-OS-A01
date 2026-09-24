# OS Assignment 01 Report: libmyutils

**Name:** Ch Ahmed Hassan


**Roll No:** BSDSF24M057

---

## Feature 1: Project Scaffolding

**Summary:** The project was created with the folders `include`, `src`, `lib`, `bin`, `obj` and `man/man3`, plus `Makefile` and `REPORT.md`, and pushed to the `main` branch of the GitHub repository `BSDSF24M057-OS-A01`. Empty folders are kept in Git using `.gitkeep` files.

---

## Feature 2: Multi-file Build

### Q1. What is the difference between the Makefile rule for building an executable directly from source files and the rules for linking against a library?

**Ans:** In the multi-file build, one rule compiles all the .c files and links them into the executable in a single step. In the library builds, the source files are first compiled into object files (.o), the object files are packed into a library, and the executable is then linked against that library using -L (library folder) and -l (library name).

### Q2. What is the difference between a simple Git tag and an annotated tag?

**Ans:** A simple (lightweight) tag is only a name pointing to a commit. An annotated tag (git tag -a) is a full Git object that stores the tagger's name, date and a message, and it can be signed. Annotated tags are preferred for releases.

### Q3. What is a GitHub release and why are binaries attached to it?

**Ans:** A GitHub release is a packaged version of the project linked to a tag. Compiled files such as bin/client are attached so users can download and run them without compiling, and so they are not stored in the source repository.

---

## Feature 3: Static Library

### Q1. How does the Makefile differ when creating a static library?

**Ans:** The source files are compiled with -c into object files, then `ar rcs` packs them into lib/libmyutils.a, and the executable is linked with -Llib -lmyutils.

### Q2. What do ar and ranlib do?

**Ans:** `ar` creates an archive (.a) that bundles the object files together. `ranlib` adds an index of the symbols in the archive so the linker can find functions quickly. (`ar rcs` already creates this index, but ranlib does it explicitly.)

### Q3. What did nm show about the library and executable?

**Ans:** `nm lib/libmyutils.a` lists the functions (such as mystrlen and count_words) marked T, meaning they are defined in the code section. In `nm bin/client_static` the same functions appear, which shows the library code was copied into the executable.

---

## Feature 4: Dynamic Library

### Q1. What is Position-Independent Code (-fPIC) and why is it needed?

**Ans:** PIC is machine code that works at any memory address because it does not use fixed absolute addresses. A shared library can be loaded at a different address in each program, so it must be compiled with -fPIC.

### Q2. What is the size difference between the static and dynamic executables?

**Ans:** client_static is 17K and client_dynamic is 16K. The dynamic one is slightly smaller because the library code stays in libmyutils.so. The difference is small here because the library only has a few small functions.

### Q3. What is LD_LIBRARY_PATH and what does the dynamic loader do?

**Ans:** LD_LIBRARY_PATH is an environment variable that lists extra folders where the dynamic loader searches for shared libraries. When client_dynamic starts, the loader finds and loads libmyutils.so. Without the path, it failed with "cannot open shared object file". After exporting LD_LIBRARY_PATH=$PWD/lib, it ran correctly.

---

## Feature 5: Documentation & Installation

**Summary:** Two man pages (`mystrfunctions.3` and `myfilefunctions.3`) were written in groff format and stored in `man/man3/`. They can be previewed with `man -l man/man3/mystrfunctions.3`. The Makefile has an `install` target that copies the executable to `/usr/local/bin/client`, the library to `/usr/local/lib`, and the man pages to `/usr/local/share/man/man3`. After `sudo make install`, `client` runs from any folder and `man mystrfunctions` shows the documentation.
