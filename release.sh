#!/bin/bash
set -eu

for tag in $(git submodule | cut -f 3 -d " "); do
  cd $tag
    git tag ${RELEASE}/$tag
    git push --tags
  cd -
done
