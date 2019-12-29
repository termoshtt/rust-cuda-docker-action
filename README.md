# rust-cuda docker action

Runs `cargo test` on CUDA installed systems **WITHOUT** GPU. This action is suitable for
 
- PTX validation (using `nvcc`)
- CUDA API testing on host-side

Supported platforms
--------------------

|CUDA | Ubuntu 18.04 | Ubuntu 16.04 | RedHat UBI8 | RedHat UBI7 | CentOS 7 | CentOS 6 |
|:---:|:------------:|:------------:|:-----------:|:-----------:|:--------:|:--------:|
|10.2 | ✔️            |  ✔️           |             |             |  ✔️       |  ✔️       |
|10.1 | ✔️            |  ✔️           |             |             |  ✔️       |  ✔️       |
|10.0 | ✔️            |  ✔️           | -           | -           |  ✔️       |  ✔️       |
|9.2  | ✔️            |  ✔️           | -           | -           |  ✔️       |  ✔️       |
|9.1  | -            |  ✔️           | -           | -           |  ✔️       |  ✔️       |
|9.0  | -            |  ✔️           | -           | -           |  ✔️       |  ✔️       |
|8.0  | -            |  ✔️           | -           | -           |  ✔️       |  ✔️       |

- https://gitlab.com/nvidia/container-images/cuda/blob/master/doc/supported-tags.md
- https://gitlab.com/nvidia/container-images/cuda/blob/master/doc/unsupported-tags.md

Usage
------

```
on: [push]

jobs:
  ubuntu1804-cuda10_2:
    runs-on: ubuntu-latest
    name: cargo test on ubuntu18.04 with CUDA 10.2
    steps:
    - uses: actions/checkout@v1
    - name: cargo test
      id: test
      uses: termoshtt/rust-cuda-docker-action@ubuntu1804-cuda10_2
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
