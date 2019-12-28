#!/bin/bash
set -eu

source $HOME/.cargo/env

echo ::set-output name=nvcc-version::$(nvcc --version)
echo ::set-output name=rustc-version::$(rustc --version)

WORKDIR=${1:-$(pwd)}
cd ${WORKDIR}

cargo test -v
