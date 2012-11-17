# The stuff in core should be exposed directly here, but it seems to be
# impossible to have a __init__.so file
from _core import *

# Native extentions don't get exposed automatically
import languages
import versions
