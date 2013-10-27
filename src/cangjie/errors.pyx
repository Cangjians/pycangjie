# Copyright (c) 2013 - The pycangjie authors
#
# This file is part of pycangjie, the Python bindings to libcangjie.
#
# pycangjie is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# pycangjie is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with pycangjie.  If not, see <http://www.gnu.org/licenses/>.


cimport _core


class CangjieError(Exception):
    def __init__(self, *args):
        if args:
            super(CangjieError, self).__init__(*args)

        else:
            super(CangjieError, self).__init__(self.message)


class CangjieNoCharsError(CangjieError):
    message = "No characters found"


class CangjieDBOpenError(CangjieError):
    message = "Error opening the database"


class CangjieDBError(CangjieError):
    message = "Error querying the database"


class CangjieMemoryError(CangjieError):
    message = "Not enough memory"


class CangjieInvalidInputError(CangjieError):
    message = "Invalid input"


def handle_error_code(int code, msg=None):
    if code == _core.CANGJIE_NOCHARS:
        raise CangjieNoCharsError()

    if code == _core.CANGJIE_DBOPEN:
        raise CangjieDBOpenError()

    if code == _core.CANGJIE_DBERROR:
        raise CangjieDBError()

    if code == _core.CANGJIE_NOMEM:
        raise CangjieMemoryError()

    if code == _core.CANGJIE_INVALID:
        raise CangjieInvalidInputError()

    if code != _core.CANGJIE_OK:
        raise CangjieError(msg)
