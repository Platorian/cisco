**Nmap Version Scan**

```
nmap -sV 172.16.20.136
```

**How to test for anonymous login in an FTP server by using Metasploit.**

```
msf > use auxiliary/scanner/ftp/anonymous
msf auxiliary(scanner/ftp/anonymous) > set RHOSTS 172.16.20.136
RHOSTS => 172.16.20.136
msf auxiliary(scanner/ftp/anonymous) > exploit
```


