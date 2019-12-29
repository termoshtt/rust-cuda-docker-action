#!/bin/bash
set -xue

for tag in $(git submodule | cut -f 3 -d " "); do
  cd $tag
    git fetch
    git reset origin/$tag --hard
  cd -
done
