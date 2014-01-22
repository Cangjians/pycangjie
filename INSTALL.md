## Debian Unstable / Sid

pycangjie is included in the default Debian repositories, so you can just
install it with `apt-get`, as the root user:

```
# apt-get install python3-pycangjie
```

## Fedora

pycangjie is included in the default Fedora repositories, so you can just
install it with `yum`:
```
$ sudo yum install python3-cangjie
```

## Ubuntu 14.04

pycangjie is included in the default Ubuntu repositories, **starting with the
14.04 release**, so you can install it with `apt-get`:

```
$ sudo apt-get install python3-pycangjie
```

## Build from the sources

### Dependencies

To build these bindings, you will need the following:

* Python >= 3.2
* Cython >= 0.17
* a C compiler and library (we recommend GCC and the GNU C library)
* the libcangjie library and development headers

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
