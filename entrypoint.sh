#!/bin/bash
set -exu

echo ::set-output name=rustc-version::$(rustc --version)

cd $1
cargo test -v
