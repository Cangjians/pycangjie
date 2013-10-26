---
layout: default
title: pycangjie documentation - Exceptions
name: projects
project: pycangjie
sub: doc
---

## Exceptions

pycangjie defines a set of exceptions mapping to the error codes returned by
the libcangjie functions.

Functions which are supposed to get you a list of characters will raise
`CangjieNoCharsError` when no characters correspond to your query.

If the libcangjie database could not be opened for some reason, then
`CangjieDBOpenError` is raised.

If an error happens when querying the database, the method will raise
`CangjieDBError`.

When memory could not be allocated, the method will raise
`CangjieMemoryError`.

Finally, methods will raise `CangjieInvalidInputError` when they are passed
an invalid input.

All exceptions are defined in the `cangjie.errors` module.
