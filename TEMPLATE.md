# rust-cuda docker action

Usage
------

```
on: [push]

jobs:
  TAG:
    runs-on: ubuntu-latest
    name: cargo test on OS OS_VERSION with CUDA CUDA_VERSION
    steps:
    - uses: actions/checkout@v1
    - name: cargo test
      id: test
      uses: termoshtt/rust-cuda-docker-action@TAG
      with:
        path: rust-cuda-test
    - name: show versions
      run: |
        echo "rustc-version = ${{ steps.test.outputs.rustc-version }}"
        echo "nvcc-version  = ${{ steps.test.outputs.nvcc-version }}"
```

### Inputs

- `with.path`
  - Path to crate directory
  - optional, default = `$PWD`

### Outputs
- `rustc-version`
  - Output of `rustc --version`
- `nvcc-version`
  - Output of `nvcc --version`