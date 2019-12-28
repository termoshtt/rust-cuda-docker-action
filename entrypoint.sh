#!/bin/bash

echo ::set-output name=rustc-version::$(rustc --version)

cargo test -v
