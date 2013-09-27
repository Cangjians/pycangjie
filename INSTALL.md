At the moment, pycangjie is not included in any operating system, so you'll
have to build it from source.

We will update these instructions as that changes.

## Build from the sources

### Dependencies

To build these bindings, you will need the following:

* Python >= 3.2
* Cython >= 0.17
* a C compiler and library (we recommend GCC and the GNU C library)
* the libcangjie2 library and development headers

### Install from a release tarball

_**Note:** There are no release tarballs at this point._

From the root folder of the unpacked tarball, do the usual Autotools dance:

```
$ ./configure
$ make
$ sudo make install
```

### Install from Git

First, you need to clone the development repository:

```
$ git clone git://github.com/Cangjians/pycangjie
```

Then, from the root folder of the Git clone, do the usual Autotools dance:

```
$ ./autogen.sh
$ make
$ sudo make install
```
