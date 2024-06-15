```
gobuster dir -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -u <IP address/URL> -t 250 -b ""404,403 -x sh,pl,txt,php,asp,jsp,aspx,py,do,html
```

- -b ***-*** Status code exclusion
- -x ***-*** Extensions
- -t ***-*** Threads


