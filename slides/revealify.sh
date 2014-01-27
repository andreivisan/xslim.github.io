#!/bin/bash

# pandoc -t html5 --template=template-revealjs.html \
#     --standalone --section-divs \
#   --variable theme="beige" \
#   --variable transition="linear" \
#   $1/*.md -o $1/index.html

# setopt rmstarsilent
# ./revealify.sh diagramize && rm -rf ../../public/slides/diagramize/* && cp diagramize/* ../../public/slides/diagramize

pandoc -t html5 --template=template-revealjs.html \
    --standalone --section-divs \
    -f markdown+auto_identifiers+fenced_code_blocks+mmd_title_block \
    -V logo=logo.png \
  $1/*.md -o $1/index.html