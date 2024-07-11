```php
sudo nmap -p- -A -Pn 10.10.198.119 
Starting Nmap 7.94SVN ( https://nmap.org ) at 2024-07-11 09:37 BST
Nmap scan report for 10.10.198.119
Host is up (0.020s latency).
Not shown: 65533 filtered tcp ports (no-response)
PORT     STATE SERVICE       VERSION
80/tcp   open  http          Microsoft HTTPAPI httpd 2.0 (SSDP/UPnP)
| http-robots.txt: 4 disallowed entries 
|_/bin/ /config/ /umbraco/ /umbraco_client/
|_http-title: Anthem.com - Welcome to our blog
3389/tcp open  ms-wbt-server Microsoft Terminal Services
| rdp-ntlm-info: 
|   Target_Name: WIN-LU09299160F
|   NetBIOS_Domain_Name: WIN-LU09299160F
|   NetBIOS_Computer_Name: WIN-LU09299160F
|   DNS_Domain_Name: WIN-LU09299160F
|   DNS_Computer_Name: WIN-LU09299160F
|   Product_Version: 10.0.17763
|_  System_Time: 2024-07-11T08:40:58+00:00
| ssl-cert: Subject: commonName=WIN-LU09299160F
| Not valid before: 2024-07-10T08:27:32
|_Not valid after:  2025-01-09T08:27:32
|_ssl-date: 2024-07-11T08:41:04+00:00; +2s from scanner time.
Warning: OSScan results may be unreliable because we could not find at least 1 open and 1 closed port
OS fingerprint not ideal because: Missing a closed TCP port so results incomplete
No OS matches for host
Network Distance: 2 hops
Service Info: OS: Windows; CPE: cpe:/o:microsoft:windows

Host script results:
|_clock-skew: mean: 1s, deviation: 0s, median: 0s

TRACEROUTE (using port 80/tcp)
HOP RTT      ADDRESS
1   17.56 ms 10.9.0.1
2   17.69 ms 10.10.198.119

OS and Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 219.65 seconds

```

