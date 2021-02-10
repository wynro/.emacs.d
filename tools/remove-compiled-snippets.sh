#!/bin/bash
# Author: Guillermo Robles
#
# Remove all the compiled snippets in the directory

FILENAME='.yas-compiled-snippets.el'

(cd snippets/ &&
     find . -name "${FILENAME}" -exec rm {} \;
)
