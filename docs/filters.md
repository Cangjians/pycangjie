---
layout: default
title: pycangjie documentation - Output filtering
name: projects
project: pycangjie
sub: doc
---

## Output filtering

Often when using pycangjie you will get lists of characters (for example,
which characters correspond to the code "d*d" ?).

It is possible to filter these lists so you only get the characters you are
interested in.

The following filters are defined in the `cangjie.filters` module:

* Use `BIG5` if you are interested in the characters which are part of the
  Big 5 charset.
* Use `HKSCS` if you want the characters which are part of the Hong Kong
  Supplemental Character Set.
* Use `PUNCTUATION` to get the punctuation characters.
* Use `CHINESE` if you want all Chinese characters.
* Use `ZHUYIN` in order to get the characters part of Taiwan's Zhuyin/Bopomofo
  alphabet.
* Use `KANJI` for the Japanese Kanji characters.
* Use `KATAKANA` and you'll get the Japanese Katakana characters.
* Use `HIRAGANA` if the Japanese Hiragana matter to you.
* Finally, use `SYMBOLS` to get access to lots of miscellaneous symbols.

Note that these are bit flags. If you want more than one, just OR them
together.

For example, if you want the Big 5 and HKSCS characters, use:

```python
import cangjie

cangjie.filters.BIG5 | cangjie.filters.HKSCS
```
