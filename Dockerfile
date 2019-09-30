FROM alpine
RUN apk add --update vim yasm gcc g++ gdb git llvm cmake python python3 linux-headers bash\
  && rm -rf /var/cache/apk/*
COPY foo.asm /root/


# c和assembly的混编
RUN apk add cmake make gcc libtool musl-dev && rm -rf /var/cache/apk/*
COPY asm.c /root/
