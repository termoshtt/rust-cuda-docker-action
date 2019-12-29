# rust-cuda docker action

Runs `cargo test` on CUDA installed systems **WITHOUT** GPU. This action is suitable for
 
- PTX validation (using `nvcc`)
- CUDA API testing on host-side

Supported platforms
--------------------

|CUDA | Ubuntu 18.04           | Ubuntu 16.04           | RedHat UBI8 | RedHat UBI7 | CentOS 7            | CentOS 6            |
|:---:|:----------------------:|:----------------------:|:-----------:|:-----------:|:-------------------:|:-------------------:|
|10.2 |[✔️][ubuntu1804-cuda10_2]|[✔️][ubuntu1604-cuda10_2]|             |             |[✔️][centos7-cuda10_2]|[✔️][centos6-cuda10_2]|
|10.1 |[✔️][ubuntu1804-cuda10_1]|[✔️][ubuntu1604-cuda10_1]|             |             |[✔️][centos7-cuda10_1]|[✔️][centos6-cuda10_1]|
|10.0 |[✔️][ubuntu1804-cuda10_0]|[✔️][ubuntu1604-cuda10_0]| -           | -           |[✔️][centos7-cuda10_0]|[✔️][centos6-cuda10_0]|
|9.2  |[✔️][ubuntu1804-cuda9_2] |[✔️][ubuntu1604-cuda9_2] | -           | -           |[✔️][centos7-cuda9_2] |[✔️][centos6-cuda9_2] |
|9.1  | -                      |[✔️][ubuntu1604-cuda9_1] | -           | -           |[✔️][centos7-cuda9_1] |[✔️][centos6-cuda9_1] |
|9.0  | -                      |[✔️][ubuntu1604-cuda9_0] | -           | -           |[✔️][centos7-cuda9_0] |[✔️][centos6-cuda9_0] |
|8.0  | -                      |[✔️][ubuntu1604-cuda8_0] | -           | -           |[✔️][centos7-cuda8_0] |[✔️][centos6-cuda8_0] |

[ubuntu1804-cuda10_2]: https://github.com/termoshtt/rust-cuda-docker-action/tree/ubuntu1804-cuda10_2
[ubuntu1804-cuda10_1]: https://github.com/termoshtt/rust-cuda-docker-action/tree/ubuntu1804-cuda10_1
[ubuntu1804-cuda10_0]: https://github.com/termoshtt/rust-cuda-docker-action/tree/ubuntu1804-cuda10_0
[ubuntu1804-cuda9_2]:  https://github.com/termoshtt/rust-cuda-docker-action/tree/ubuntu1804-cuda9_2

[ubuntu1604-cuda10_2]: https://github.com/termoshtt/rust-cuda-docker-action/tree/ubuntu1604-cuda10_2
[ubuntu1604-cuda10_1]: https://github.com/termoshtt/rust-cuda-docker-action/tree/ubuntu1604-cuda10_1
[ubuntu1604-cuda10_0]: https://github.com/termoshtt/rust-cuda-docker-action/tree/ubuntu1604-cuda10_0
[ubuntu1604-cuda9_2]:  https://github.com/termoshtt/rust-cuda-docker-action/tree/ubuntu1604-cuda9_2
[ubuntu1604-cuda9_1]:  https://github.com/termoshtt/rust-cuda-docker-action/tree/ubuntu1604-cuda9_1
[ubuntu1604-cuda9_0]:  https://github.com/termoshtt/rust-cuda-docker-action/tree/ubuntu1604-cuda9_0
[ubuntu1604-cuda8_0]:  https://github.com/termoshtt/rust-cuda-docker-action/tree/ubuntu1604-cuda8_0

[centos7-cuda10_2]: https://github.com/termoshtt/rust-cuda-docker-action/tree/centos7-cuda10_2
[centos7-cuda10_1]: https://github.com/termoshtt/rust-cuda-docker-action/tree/centos7-cuda10_1
[centos7-cuda10_0]: https://github.com/termoshtt/rust-cuda-docker-action/tree/centos7-cuda10_0
[centos7-cuda9_2]:  https://github.com/termoshtt/rust-cuda-docker-action/tree/centos7-cuda9_2
[centos7-cuda9_1]:  https://github.com/termoshtt/rust-cuda-docker-action/tree/centos7-cuda9_1
[centos7-cuda9_0]:  https://github.com/termoshtt/rust-cuda-docker-action/tree/centos7-cuda9_0
[centos7-cuda8_0]:  https://github.com/termoshtt/rust-cuda-docker-action/tree/centos7-cuda8_0

[centos6-cuda10_2]: https://github.com/termoshtt/rust-cuda-docker-action/tree/centos6-cuda10_2
[centos6-cuda10_1]: https://github.com/termoshtt/rust-cuda-docker-action/tree/centos6-cuda10_1
[centos6-cuda10_0]: https://github.com/termoshtt/rust-cuda-docker-action/tree/centos6-cuda10_0
[centos6-cuda9_2]:  https://github.com/termoshtt/rust-cuda-docker-action/tree/centos6-cuda9_2
[centos6-cuda9_1]:  https://github.com/termoshtt/rust-cuda-docker-action/tree/centos6-cuda9_1
[centos6-cuda9_0]:  https://github.com/termoshtt/rust-cuda-docker-action/tree/centos6-cuda9_0
[centos6-cuda8_0]:  https://github.com/termoshtt/rust-cuda-docker-action/tree/centos6-cuda8_0

- https://gitlab.com/nvidia/container-images/cuda/blob/master/doc/supported-tags.md
- https://gitlab.com/nvidia/container-images/cuda/blob/master/doc/unsupported-tags.md

Usage
------

For exmaple the following YAML add a test on Ubuntu 18.04 with CUDA 10.2

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
      uses: termoshtt/rust-cuda-docker-action@v1.0/ubuntu1804-cuda10_2
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
