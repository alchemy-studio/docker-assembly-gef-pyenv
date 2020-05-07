# 汇编语言学习容器

## 使用这个容器的学习笔记

* [汇编学习笔记](https://gist.github.com/liweinan/fe2a6dff56e86c781669d54ea5a90692)


## 相关的blog

* [docker的gef容器](https://weinan.io/2019/05/30/gef.html)

## 注意事项

`GEF`已经安装进容器：

![](https://raw.githubusercontent.com/liweinan/docker-assembly-gef-pyenv/master/AB58EEC9-B879-421F-9E93-FA22A2843D4A.png)

* [GitHub - hugsy/gef: GEF - GDB Enhanced Features for exploit devs & reversers](https://github.com/hugsy/gef)
* 参考文档： [docker的gef容器 | 阿男的小窝](http://weinan.io/2019/05/30/gef.html)

## 使用方法

```bash
$ docker run -it weli/docker-assembly-gef-pyenv bash
```

* 参考文档： [搭建一个汇编开发学习用的容器](http://weinan.io/2019/05/08/asm.html)

## 使用privileged mode运行容器

在容器当中使用`gdb`调试代码需要使用`privileged mode`：

```bash
$ docker run -it --privileged weli/docker-assembly-gef-pyenv bash
```

* 参考文档： [gdb在docker容器里面的使用](http://weinan.io/2019/05/04/asm.html)

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
$ ld -o foo foo.o
$ ls foo
foo
```

```bash
$ ./foo
$ echo $?
5
```

## 调试汇编代码

注意：在容器当中使用gdb调试代码需要使用`privileged mode`，参见上文。

```bash
$ pwd
/root
```

```bash
$ ls
foo      foo.asm  foo.lst  foo.o
```

```bash
bash-5.0# gdb -q foo
GEF for linux ready, type `gef' to start, `gef config' to configure
80 commands loaded for GDB 8.3 using Python engine 3.7
Reading symbols from foo...
gef➤  list
1	global _start
2	_start:
3	  mov eax, 1
4	  mov ebx, 5
5	  int 0x80
6
gef➤
```

截图：

![](https://raw.githubusercontent.com/liweinan/docker-assembly-gef-pyenv/master/DC5D6565-4429-46DF-AECD-8108895A85EF.png)

## c和assembly的混编

```bash
$ pwd
/root
```

```bash
$ ls asm.c
asm.c
```

```bash
$ cat asm.c
#include <stdio.h>
int main(void)
{
        int foo = 10, bar = 15;
        __asm__ __volatile__("addl  %%ebx,%%eax"
                             :"=a"(foo)
                             :"a"(foo), "b"(bar)
                             );
        printf("foo+bar=%d\n", foo);
        return 0;
}
```

```bash
$ cc -g asm.c -o asm
$ ls asm
asm
```

```bash
$ ./asm
foo+bar=25
```

## 代码例子

* https://github.com/liweinan/htaoe
* https://gist.github.com/liweinan/fe2a6dff56e86c781669d54ea5a90692

## 参考文档

* [搭建c和assembly混编的编译环境](http://weinan.io/2019/03/30/c.html)



