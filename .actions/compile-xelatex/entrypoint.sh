#!/bin/bash

cd /github/workspace/
ls -la
echo $*

for f in $*; do
  xelatex $f
done
