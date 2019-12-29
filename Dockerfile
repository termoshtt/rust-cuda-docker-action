FROM nvidia/cuda:10.0-devel-centos6

COPY cuda.conf /etc/ld.so.conf.d
RUN ldconfig

RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
ENV PATH /root/.cargo/bin:$PATH

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
