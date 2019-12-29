FROM nvidia/cuda:CUDA_VERSION-devel-centosCENTOS_VERSION
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y --default-toolchain stable
ENV PATH /root/.cargo/bin:$PATH
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
