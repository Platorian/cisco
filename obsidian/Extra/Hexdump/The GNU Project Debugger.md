# GDB Installation

To install `gdb` you can use the appropriate package manager depending on your distribution.

Arch
```sh 
sudo pacman -S gdb
```

Kali
```sh
sudo apt install gdb
```

## Basic Commands

start gdb and skip initial text
```sh
gdb -q ./vulnerable
```

list out functions in binary
```sh
info functions
```

disassemble function to read assembly code
```sh
disassemble main
```

```sh
disass main
```

change assembly syntax
- intel
```sh
set disassembly intel
```

- at
```sh
set disassembly at
```

show source code and assembly code
```sh
disassemble /s main
```

work with Text User Interface (TUI)
```sh
tui enable
```

```sh
tui layout src
```

```sh
tui layout asm
```

```sh
tui layout split
```

when working with TUI, to refresh screen
```sh
Ctrl+l
```

## Documentation

Get information about a command
```sh
help <command>
```

Search help menus of each command using regex
```sh
apropos <regex>
```

## Breakpoints and Control Flow

set breakpoints
```sh
b main
```

```sh
b vulnerable
```

```sh
b *0x565561b0
```

```sh
b *vulnerable+35
```

list breakpoints
```sh
info breakpoints
```

```sh
info break
```

```sh
i b
```

run program
```sh
run
```

```sh
run value
```

```sh
run valueeeeeeeeee
```

continue the execution of the program after hitting a breakpoint
- next asm instruction
```sh
ni
```

- next source instruction
```sh
n
```

- step asm instruction
```sh
si
```
- hit enter to repeat the last command 

- step source instruction
```sh
s
```

- continue
```sh
c
```

remove breakpoint
```sh
clear
```

```sh
del 2
```

## Registers and Memory

show registers
```sh
info registers
```

```sh
i r
```

show value inside register
```sh
print $rax
```

show value inside register in hex
```sh
print /x $rax
```

you can reference a value saved in a register with the syntax
```sh
$<register_name>
```

show stack trace
```sh
bt
```

show local variables in stack traces
```sh
bt full
```

show stack trace with local variables of all threads
```sh
thread apply all bt
```

when something bad happens, can tell you backtrace of the stack
```sh
where
```

print current frame
```sh
frame
```

move one frame up
```sh
up
```

move one frame down
```sh
down
```

list out memory regions
```sh
info files
```

examine memory
```sh
x/32wx $esp
```

```sh
x/<units><size of unit><format of unit> <location>
```

format types
```sh
o -> octal
x -> hexadecimale
u -> unsigned base-10 decimal
t -> binary
i -> instruction
s -> string
```

format size
```sh
b -> single byte
h -> two bytes (halfword)
w -> four bytes (word)
g -> eight bytes (giant)
```

## Extensions

Over the years GDB has been extended with different extensions. These extensions change the way in which GDB works by enriching it with more features and commands.

Example of popular extensions:

- PEDA - Python Exploit Development Assistance for GDB
    - <https://github.com/longld/peda>

- Pwndbg - Exploit Development and Reverse Engineering with GDB Made Easy
    - <https://github.com/pwndbg/pwndbg>
    - <https://pwndbg.re/>


To install `pwngdb` you can execute the following
```sh
git clone https://github.com/pwndbg/pwndbg
```

```sh
cd pwndbg
```

```sh
./setup.sh
```

This will change the GDB configuration file to start off `pwngdb` every time we call `gdb`.
```sh
leo@ctf:~/bin/pwndbg$ cat ~/.gdbinit
```

```sh
source /home/leo/bin/pwndbg/gdbinit.py
```

---
## References 

GDB is an extremely complex tool with a lot of documentation. Only by using it you will understand the feature that you need.

Some useful references:
  - https://stackoverflow.com/questions/1471226/most-tricky-useful-commands-for-gdb-debugger
  - https://users.ece.utexas.edu/~adnan/gdb-refcard.pdf
  - https://visualgdb.com/gdbreference/commands/frame
  - https://interrupt.memfault.com/blog/advanced-gdb

--- 

## GDB Info from other sources

Compile program with stripped value
```sh
gcc -o main main.c -s
```

Check file 
```sh
file main
```

Check words
```sh
wc -c main
```

Compile program so in can be debugged with **GDB**
```sh
gcc -o main main.c -g
```
- adds debug information but makes the code slightly larger

Start GDB and change layout
```sh
gdb main
```

```sh
lay next
```
- hit enter to cycle layouts

Add breakpoint at function main
```sh
break main
```

Start program 
```sh
run
```

Jump to next line in C
```sh
next
```

Jump to next line in assembly 
```sh
nexti
```
- nexti - next instruction 

Step into code, for example `puts`
```sh
step
```

Step over if you don't want to see what's inside the call to `puts`
```sh
next
```

Refresh screen if layout is not correctly showing
```sh
ref
```
- ref - refresh

If you have a `scanf` function you'd have to type it into GDB.

Try using this sample code with an error
```c
#include <stdio.h>

int main(int argc, char **argv)
{
	int d = 2;
	printf("Welcome to a program with a bug\n");
	scanf("%d", d);
	printf("You gave me: %d", d);

	return 0;
}
```

After inputting a number like the program requests, GDB will try to tell you what is wrong with error statements.

Examine memory
```sh
x/i $pc 
```

What is the register state
```sh
info registers
```

In intel a `%` is a dereference, for example: `%rdx`. 

Fixing the error
```sh
#include <stdio.h>

int main(int argc, char **argv)
{
	int d = 2;
	printf("Welcome to a program with a bug\n");
	scanf("%d", &d);
	printf("You gave me: %d", d);

	return 0;
}
```
- Added the `&` to scanf function which adds the input value to the variable

scanf() needs to modify values of a and b and but they are not local to scanf(). So in order to reflect changes in the variable a and b of the main function, we need to pass addresses of them. We cannot simply pass them by value.
