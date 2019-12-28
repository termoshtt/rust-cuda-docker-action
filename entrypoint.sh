#!/bin/bash
set -exu

rustup default stable

echo ::set-output name=rustc-version::$(rustc --version)

WORKDIR=${1:-$(pwd)}
cd ${WORKDIR}

cargo test -v
