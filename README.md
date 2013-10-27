This is a Python wrapper to libcangjie, the library implementing the Cangjie
input method.

Below is a trivial example of how to use it:

```python
import cangjie

cj = cangjie.Cangjie(cangjie.versions.CANGJIE3,
                     cangjie.filters.BIG5 | cangjie.filters.HKSCS)

for c in cj.get_characters("a*y"):
    print(c)
```

For more details, refer to the documentation, either
[online](http://cangjians.github.io/projects/pycangjie/documentation.html)
or the one shipped with this software.

Development happens [on github](https://github.com/Cangjians/pycangjie), and
stable release tarballs will be available when we reach that point.

## Legalities

pycangjie is offered under the terms of the
[GNU Lesser General Public License, either version 3 or any later version](http://www.gnu.org/licenses/lgpl.html).

We won't ask you to sign a copyright assignment or any other kind of silly and
tedious legal document, so just send us patches and/or pull requests!
