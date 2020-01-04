FROM nvidia/cuda:10.0-devel-ubuntu16.04

COPY cuda.conf /etc/ld.so.conf.d
RUN ldconfig

RUN apt-get update \
 && apt-get install -y curl \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
ENV PATH /root/.cargo/bin:$PATH

RUN cargo install ptx-linker

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
