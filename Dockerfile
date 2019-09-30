FROM alpine
RUN apk add --update vim yasm gcc g++ gdb git llvm cmake python python3 linux-headers bash\
  && rm -rf /var/cache/apk/*
COPY foo.asm /root/
