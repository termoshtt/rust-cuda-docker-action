FROM nvidia/cuda:CUDA_VERSION-devel-ubuntuUBUNTU_VERSION
ENV LD_LIBRARY_PATH ""
RUN rm /etc/ld.so.conf.d/nvidia.conf \
 && ldconfig
RUN apt-get update \
 && apt-get install -y curl \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
