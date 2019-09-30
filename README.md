

## 使用方法

```bash
$ docker run -it weli/docker-assembly-gef-pyenv bash
```

## 使用privileged mode运行容器

在容器当中使用`gdb`调试代码需要使用`privileged mode`：

```bash
$ docker run -it --privileged weli/docker-assembly-gef-pyenv bash
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

## 调试汇编代码

```bash
$ pwd
/root
```

```bash
$ ls
foo      foo.asm  foo.lst  foo.o
```

```bash
$ gdb -q foo
Reading symbols from foo...
(gdb) list
1	global _start
2	_start:
3	  mov eax, 1
4	  mov ebx, 5
5	  int 0x80
6
(gdb) b 5
Breakpoint 1 at 0x40100a: file foo.asm, line 5.
(gdb) run
Starting program: /root/foo

Breakpoint 1, _start () at foo.asm:5
5	  int 0x80
(gdb)
```

## 参考文档


- [搭建一个汇编开发学习用的容器](http://weinan.io/2019/05/08/asm.html)
- [gdb在docker容器里面的使用](http://weinan.io/2019/05/04/asm.html)
- [搭建c和assembly混编的编译环境](http://weinan.io/2019/03/30/c.html)
