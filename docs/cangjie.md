---
layout: default
title: pycangjie documentation - The Cangjie class
name: projects
project: pycangjie
sub: doc
---

## The Cangjie class

Now this is really the interesting part: it is the actual entry point to the
library. For everything worth doing with pycangjie, you will want to get a
hold on a `Cangjie` object.

It has 2 attributes:

* `version` is an `int` representing the version (see versions.md) of the
  Cangjie input method you are interested in.

* `filter_flags` is an `int` corresponding to how you want to
  filter the output (see filters.md) of the `get_characters()` query method.

#### First step: get a Cangjie object

Given that everything comes out of it, you **must** create a `Cangjie` object
before you do anything else, for example:

```python
import cangjie

cj = cangjie.Cangjie(cangjie.versions.CANGJIE3,
                     cangjie.filters.BIG5 | cangjie.filters.HKSCS)
```

The first parameter is one of the supported versions (see versions.md), and
the third is a bitwise OR of the available output filters (see filters.md).

These will have an impact on the `get_characters()` query method.

Note that in the example above, given the output filters that have been used,
the only characters which would be returned are the ones which are part of the
Big 5 encoding and the Hong Kong Supplemental Character Set.

Output filters thus control the set of characters which will be returned, not
the ones which are filtered out.

#### Querying for characters

There are three query methods.

First, and most importantly, `get_characters()` returns a list of
characters corresponding to a given Cangjie code.

This is really what is intended by a Cangjie input method: the user types an
input code, and expects one or more characters in return.

Here is an example of usage:

```python
# cj is a Cangjie object
chars = cj.get_characters("abcd")
```

After execution of the above, `chars` will be a `list` of one or more
`CangjieChar` instances (see cangjiechar.md) corresponding to the "abcd" code
in the Cangjie version passed to the constructor of the `Cangjie` class.

Wildcards ("*") are supported inside a code. For example, the "d*d" code could
be used.

It is often desired to show the user the radical corresponding to the
characters they input, rather than (or along with) the latin letters they
actually type.

You can do that with the `get_radical()` method, used as follows:

```python
# cj is a Cangjie object
radical = cj.get_radical("d");
```

After execution, `radical` contains the radical corresponding to the "d" code.

Finally, users (especially Quick users) often want a convenient way to input
punctuation and symbols without knowing their Cangjie code.

As such, we provide the `get_characters_by_shortcode()` method, which is used
in exactly the same way as the `get_characters()` one:

```python
# cj is a Cangjie object
chars = cj.get_characters_by_shortcode(",");
```

After execution, `chars` would contain a `CangjieChar` instance for each
fullwidth / Chinese comma.

#### Validating user input

In your application, you might want to check whether the user input are valid
keys of Cangjie codes (to pass them to the `get_characters()` method), or not
(for example, to pass other characters to the `get_characters_by_shortcode()`
method).

You can do that with the `is_input_key()` method:

```python
# cj is a Cangjie object
cj.is_input_key("a"); # This is True
cj.is_input_key("@"); # This is False
```
