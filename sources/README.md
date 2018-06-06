# x86 Assembly code using GNU ld

References:  
https://www.imada.sdu.dk/~kslarsen/Courses/dm18-2007-spring/Litteratur/IntelnATT.htm
https://en.wikipedia.org/wiki/X86_assembly_language
http://cs.lmu.edu/~ray/notes/gasexamples/
http://cs.lmu.edu/~ray/notes/x86assembly/
https://www3.nd.edu/~dthain/courses/cse40243/fall2015/intel-intro.html
https://cs.baylor.edu/~donahoo/tools/gdb/tutorial.html
http://visualgdb.com/gdbreference/commands/info_registers

## Assemble and debug session

After making either **hello.s** or **myhello.s**, run **gdb**.

Set a breakpoint at the first line of assembly code:    
**b 1**  
Start execution of the debug session:  
**run**  
It will break at the breakpoint. Now single step:      
**step**  
Examine registers:    
**i r**  

Complete session shown below:  

````
user@WS20:~/asm$
user@WS20:~/asm$ make clean
rm -f hello
rm -f hello.o
rm -f myhello
rm -f myhello.o
user@WS20:~/asm$ make myhello
as   -o myhello.o myhello.s
gcc -c -g myhello.s
ld myhello.o -o myhello

user@WS20:~/asm$ gdb myhello
GNU gdb (Debian 7.12-6) 7.12.0.20161007-git
Copyright (C) 2016 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "x86_64-linux-gnu".
Type "show configuration" for configuration details.
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>.
Find the GDB manual and other documentation resources online at:
<http://www.gnu.org/software/gdb/documentation/>.
For help, type "help".
Type "apropos word" to search for commands related to "word"...
Reading symbols from myhello...done.
(gdb) b 1
Breakpoint 1 at 0x4000b0: file myhello.s, line 1.
(gdb) run
Starting program: /home/user/asm/myhello

Breakpoint 1, _start () at myhello.s:5
5               nop
(gdb) step
6               mov     $5, %rax
(gdb)
7               nop
(gdb)
8               mov     x, %rbx
(gdb)
9               nop
(gdb) i r
rax            0x5      5
rbx            0x3      3
rcx            0x0      0
rdx            0x0      0
rsi            0x0      0
rdi            0x0      0
rbp            0x0      0x0
rsp            0x7ffffffee2b0   0x7ffffffee2b0
r8             0x0      0
r9             0x0      0
r10            0x0      0
r11            0x0      0
r12            0x0      0
r13            0x0      0
r14            0x0      0
r15            0x0      0
rip            0x4000c1 0x4000c1 <_start+17>
eflags         0x202    [ IF ]
cs             0x33     51
ss             0x2b     43
ds             0x0      0
es             0x0      0
fs             0x0      0
gs             0x0      0
(gdb)
````
