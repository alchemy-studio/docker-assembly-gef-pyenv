FROM alpine
RUN apk add --update vim yasm gcc g++ gdb git llvm cmake python python3 linux-headers \
  && rm -rf /var/cache/apk/*

$ pip3 install --upgrade pip


/ # UNICORN_QEMU_FLAGS="--python=/usr/bin/python" pip3 install unicorn