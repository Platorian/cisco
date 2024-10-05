nmap
```php
nmap -sV -sC -T4 -Pn $IP
```

```php
Starting Nmap 7.94SVN ( https://nmap.org ) at 2024-10-03 09:43 BST
Nmap scan report for 10.10.149.154
Host is up (0.027s latency).                                                                              
Not shown: 991 closed tcp ports (conn-refused)                                                            
PORT      STATE SERVICE            VERSION                                                                
135/tcp   open  msrpc              Microsoft Windows RPC                                                  
139/tcp   open  netbios-ssn        Microsoft Windows netbios-ssn                                          
445/tcp   open  microsoft-ds       Windows 7 Professional 7601 Service Pack 1 microsoft-ds (workgroup: WORKGROUP)                                                                                                   
3389/tcp  open  ssl/ms-wbt-server?                                                                        
| rdp-ntlm-info:                                                                                          
|   Target_Name: JON-PC                                                                                   
|   NetBIOS_Domain_Name: JON-PC                                                                           
|   NetBIOS_Computer_Name: JON-PC                                                                         
|   DNS_Domain_Name: Jon-PC                                                                               
|   DNS_Computer_Name: Jon-PC                                                                             
|   Product_Version: 6.1.7601                                                                             
|_  System_Time: 2024-10-03T08:45:19+00:00                                                                
| ssl-cert: Subject: commonName=Jon-PC                                                                    
| Not valid before: 2024-10-02T08:38:04                                                                   
|_Not valid after:  2025-04-03T08:38:04                                                                   
|_ssl-date: 2024-10-03T08:45:24+00:00; +1s from scanner time.                                             
49152/tcp open  msrpc              Microsoft Windows RPC                                                  
49153/tcp open  msrpc              Microsoft Windows RPC                                                  
49154/tcp open  msrpc              Microsoft Windows RPC                                                  
49158/tcp open  msrpc              Microsoft Windows RPC                                                  
49159/tcp open  msrpc              Microsoft Windows RPC                                                  
Service Info: Host: JON-PC; OS: Windows; CPE: cpe:/o:microsoft:windows                                    

Host script results:
|_clock-skew: mean: 1h00m01s, deviation: 2h14m10s, median: 0s
| smb2-security-mode: 
|   2:1:0: 
|_    Message signing enabled but not required
| smb-security-mode: 
|   account_used: guest
|   authentication_level: user
|   challenge_response: supported
|_  message_signing: disabled (dangerous, but default)
|_nbstat: NetBIOS name: JON-PC, NetBIOS user: <unknown>, NetBIOS MAC: 02:ac:d3:a0:e6:75 (unknown)
| smb2-time: 
|   date: 2024-10-03T08:45:19
|_  start_date: 2024-10-03T08:38:02
| smb-os-discovery: 
|   OS: Windows 7 Professional 7601 Service Pack 1 (Windows 7 Professional 6.1)
|   OS CPE: cpe:/o:microsoft:windows_7::sp1:professional
|   Computer name: Jon-PC
|   NetBIOS computer name: JON-PC\x00
|   Workgroup: WORKGROUP\x00
|_  System time: 2024-10-03T03:45:19-05:00

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 90.90 seconds
```

```php
nmap -sV -script=safe -T4 -p445  $IP
```

```php
Starting Nmap 7.94SVN ( https://nmap.org ) at 2024-10-03 09:47 BST
Pre-scan script results:
| targets-asn: 
|_  targets-asn.asn is a mandatory parameter
|_http-robtex-shared-ns: *TEMPORARILY DISABLED* due to changes in Robtex's API. See https://www.robtex.com/api/
|_hostmap-robtex: *TEMPORARILY DISABLED* due to changes in Robtex's API. See https://www.robtex.com/api/
Nmap scan report for 10.10.149.154
Host is up (0.045s latency).

PORT    STATE SERVICE      VERSION
445/tcp open  microsoft-ds Windows 7 Professional 7601 Service Pack 1 microsoft-ds (workgroup: WORKGROUP)
|_smb-enum-services: ERROR: Script execution failed (use -d to debug)
Service Info: Host: JON-PC; OS: Windows; CPE: cpe:/o:microsoft:windows

Host script results:
|_clock-skew: mean: 1h39m13s, deviation: 2h53m12s, median: -46s
| smb2-capabilities: 
|   2:0:2: 
|     Distributed File System
|   2:1:0: 
|     Distributed File System
|     Leasing
|_    Multi-credit operations
| smb-mbenum: 
|   Master Browser
|     JON-PC  6.1  
|   Potential Browser
|     JON-PC  6.1  
|   Server service
|     JON-PC  6.1  
|   Windows NT/2000/XP/2003 server
|     JON-PC  6.1  
|   Workstation
|_    JON-PC  6.1  
| smb-os-discovery: 
|   OS: Windows 7 Professional 7601 Service Pack 1 (Windows 7 Professional 6.1)
|   OS CPE: cpe:/o:microsoft:windows_7::sp1:professional
|   Computer name: Jon-PC
|   NetBIOS computer name: JON-PC\x00
|   Workgroup: WORKGROUP\x00
|_  System time: 2024-10-03T03:47:07-05:00
| smb-vuln-ms17-010: 
|   VULNERABLE:
|   Remote Code Execution vulnerability in Microsoft SMBv1 servers (ms17-010)
|     State: VULNERABLE
|     IDs:  CVE:CVE-2017-0143
|     Risk factor: HIGH
|       A critical remote code execution vulnerability exists in Microsoft SMBv1
|        servers (ms17-010).
|           
|     Disclosure date: 2017-03-14
|     References:
|       https://blogs.technet.microsoft.com/msrc/2017/05/12/customer-guidance-for-wannacrypt-attacks/
|       https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-0143
|_      https://technet.microsoft.com/en-us/library/security/ms17-010.aspx
| smb-protocols: 
|   dialects: 
|     NT LM 0.12 (SMBv1) [dangerous, but default]
|     2:0:2
|_    2:1:0
| smb-security-mode: 
|   account_used: guest
|   authentication_level: user
|   challenge_response: supported
|_  message_signing: disabled (dangerous, but default)
| port-states: 
|   tcp: 
|_    open: 445
|_msrpc-enum: NT_STATUS_ACCESS_DENIED
| smb2-time: 
|   date: 2024-10-03T08:47:07
|_  start_date: 2024-10-03T08:38:02
| dns-blacklist: 
|   SPAM
|_    l2.apews.org - FAIL
|_nbstat: NetBIOS name: JON-PC, NetBIOS user: <unknown>, NetBIOS MAC: 02:ac:d3:a0:e6:75 (unknown)
|_fcrdns: FAIL (No PTR record)
| smb2-security-mode: 
|   2:1:0: 
|_    Message signing enabled but not required

Post-scan script results:
| reverse-index: 
|_  445/tcp: 10.10.149.154
Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 58.82 seconds
```

