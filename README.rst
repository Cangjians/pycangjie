This is a Python wrapper to libcangjie2, the library implementing the Cangjie
input method.

Below is a trivial example of how to use it::

    >>> import cangjie
    >>> 
    >>> cj = cangjie.Cangjie(cangjie.versions.CANGJIE3,
    ...                      cangjie.filters.BIG5 | cangjie.filters.HKSCS)
    >>> 
    >>> for c in cj.get_characters("a*y"):
    ...     print(c)
    <CangjieChar chchar='晦', code='aowy', frequency'19740'>
    <CangjieChar chchar='閼', code='anysy', frequency'5497'>
    <CangjieChar chchar='㫵', code='almy', frequency'0'>

For more details, refer to `the documentation`_.

Development happens `on github`_, and stable release tarballs will be
available when we reach that point.

.. _the documentation: Sorry, not written yet. :(
.. _on github: Sorry, not pushed yet. :(

Installation instructions can be found in the ``INSTALL.rst`` file.

Legalities
==========

pycangjie is written by the folks listed in the ``AUTHORS`` file, who
decided to offer it under the
`GNU Lesser General Public License, either version 3 or any later version`_.

We won't ask you to sign a copyright assignment or any other kind of silly and
tedious legal document, so just send us patches and/or pull requests!

.. _GNU Lesser General Public License, either version 3 or any later version_: http://www.gnu.org/licenses/lgpl.html
