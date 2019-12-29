#!/bin/bash
set -eu

rustup default stable

echo ::set-output name=nvcc-version::$(nvcc --version)
echo ::set-output name=rustc-version::$(rustc --version)

WORKDIR=${1:-$(pwd)}
cd ${WORKDIR}

cargo test -v
