

## 使用方法

```bash
$ docker run -it weli/docker-assembly-gef-pyenv bash
```

## 使用privileged mode运行容器

```bash
$ docker run -it --privileged  weli/docker-assembly-gef-pyenv bash
```

## 编译汇编代码

```bash
$ pwd
/root
```

```bash
$ ls
foo.asm
```

``` bash
$ cat foo.asm
global _start
_start:
  mov eax, 1
  mov ebx, 5
  int 0x80
```

```bash
$ yasm -f elf64 -g dwarf2 -l foo.lst foo.asm
```

```bash
$ ls
foo.asm  foo.lst  foo.o
```

```bash
$ ./foo
$ echo $?
5
```

## 参考文档


- [搭建一个汇编开发学习用的容器](http://weinan.io/2019/05/08/asm.html)
- [gdb在docker容器里面的使用](http://weinan.io/2019/05/04/asm.html)
- [搭建c和assembly混编的编译环境](http://weinan.io/2019/03/30/c.html)



∎
