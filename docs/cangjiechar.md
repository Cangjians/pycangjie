---
layout: default
title: pycangjie documentation - The CangjieChar class
name: projects
project: pycangjie
sub: doc
---

## The CangjieChar class

This is the basic currency unit in pycangjie. `CangjieChar`'s are what the
methods return when you want to find what character(s) corresponds to a
certain Cangjie code.

The `CangjieChar` simply has 3 attributes:

* `chchar` is an `str` containing the character that the user actually wants
* `code` is an `str` containing the Cangjie code for that character
* `frequency is an `int` representing a useful measure to order the characters
  when presenting them to the user. The higher it is, the more frequent that
  character is.

For example, in Cangjie, the character (`chchar`) "木" has the `code` "d".

Also, a character with a `frequency` of 1000 should be presented before a
character with a frequency of 500.

`CangjieChar`'s are really something that your application will consume, not
something you will create and manage.

Nevertheless, if you do want to create one, the `CangjieChar` constructor
takes 3 arguments, which are the 3 attributes above, in the order we described
them:

```python
import cangjie

c = cangjie.CangjieChar("木", "d", 123)
```
