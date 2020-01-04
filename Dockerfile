FROM nvidia/cuda:10.2-devel-centos7

COPY cuda.conf /etc/ld.so.conf.d
RUN ldconfig

RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
ENV PATH /root/.cargo/bin:$PATH

RUN cargo install ptx-linker

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
