Nmap and Rustscan

Fast scan.
```
sudo nmap -sS -F <Target> -oN results.txt
```

Service version.
```
sudo nmap -sS -sV -F <Target> -oN results.txt
```

Full scan.
```
sudo nmap -sS -F -a <Target> -oN results.txt
```

At this stage we should also run the service version through searchsploit.
```
searchsploit heartbleed
```



NSE Scripts
ls -l /usr/share/nmap/scripts | grep snmp
ls -l /usr/share/nmap/scripts | grep smb