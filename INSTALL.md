## Arch Linux

pycangjie has not been included in official repository yet, but only in AUR.
If it works for you and you like it, please don't hesitate to vote it on
[upvote it](https://aur.archlinux.org/packages/pycangjie/).
So you can install it with `yaourt`:

```
$ yaourt pycangjie
```

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

## Gentoo

Pycangjie is included in the Gentoo repositories. It is currently masked.
You will need to add "dev-python/cangjie" to your /etc/portage/package.accept_keywords 
or use autounmask. Once unmasked install as root with :

```
$ emerge dev-python/cangjie
```

## Ubuntu 14.04

pycangjie is included in the default Ubuntu repositories, **starting with the
14.04 release**, so you can install it with `apt-get`:

```
$ sudo apt-get install python3-pycangjie
```

## NixOS

pycangjie is included in the default NixOS channel, **starting with the
14.02 release**, so you can install it with `nix-env`:

```
$ nix-env --install pycangjie
```

## Build from the sources

### Dependencies

To build these bindings, you will need the following:

* Python >= 3.2
* Cython >= 0.17
* a C compiler and library (we recommend GCC and the GNU C library)
* the libcangjie library and development headers

### Install from a release tarball

Download a release tarball from
[the download section](http://cangjians.github.io/downloads/pycangjie/) of
our website.

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
