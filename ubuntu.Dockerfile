FROM nvidia/cuda:CUDA_VERSION-devel-ubuntuUBUNTU_VERSION
RUN apt-get update \
 && apt-get install -y curl \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y --default-toolchain stable
ENV PATH /root/.cargo/bin:$PATH
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
