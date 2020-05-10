FROM alpine:3.11

RUN apk add --update linux-headers gcc g++ \
    musl-dev busybox cmake make libtool gdb yasm \
    vim python python3 git openssh llvm bash wget \
    && rm -rf /var/cache/apk/* \
    && pip3 install --upgrade pip \
    && pip3 install keystone-engine
    && pip3 install unicorn
    && pip3 install capstone
    && pip3 install ropper
    && wget https://github.com/hugsy/gef/raw/master/gef.py && mv gef.py $HOME/.gdbinit-gef.py && echo "source $HOME/.gdbinit-gef.py" > "$HOME/.gdbinit"

COPY foo.asm asm.c /root/
WORKDIR /root

