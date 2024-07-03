Scenario

To offer a hands-on approach to performing a live investigation, we have been tasked by _Penguin Corp_ to perform file system and OS analysis on a Linux-based web server during a suspected breach. This investigation's urgency stems from identifying a potential file upload vulnerability within the web server, creating a path for remote attackers to execute arbitrary commands (remote code execution) and gain unauthorised access.

By analysing the artefacts left over and reconstructing the timeline of events through file system analysis, we intend to provide Penguin Corp with a clear understanding of the extent and nature of the compromise.

Connecting to the System

First, click **Start Machine** to start the VM attached to this task. After deploying the machine, it will start in a split-view window, and you will be automatically connected as the **investigator** user. If the split view window does not automatically appear, click the “**Show Split View**” button at the top of this room.

Alternatively, you may access it via SSH using the AttackBox or your VPN connection. The credentials can be found below:

| **Username** | investigator  |
| ------------ | ------------- |
| **Password** | TryHackMe123! |

---
### Investigation Setup

Securing the Environment

While we perform live forensic analysis on this system, it is important to note that in this assumed scenario, we have already acquired all necessary backups and have isolated the system from the network to prevent further compromise or tampering.

As this is a potentially compromised host, it is a good idea to ensure we are using known good binaries and libraries to conduct our information gathering and analysis. Often, this can be done by mounting a USB or drive containing binaries from a clean Debian-based installation. This has been simulated on the attached VM by copying the _/bin_, _/sbin_, _/lib_, and _/lib64_ folders from a clean installation into the _/mnt/usb_ mount on the affected system.

**Note:** The following steps should be performed after establishing an SSH connection to the _target_ machine, _not on the AttackBox_.

This effort aims to mitigate the risk of inadvertently executing malicious code or compromised utilities on systems. Suppose an attacker gains privileged access to a system. In that case, they may replace or alter existing utilities with malicious binaries or libraries that could cause further harm when run by an unsuspecting investigator. By using a trusted source, it enhances the reliability and integrity of our investigation.

We can modify our `PATH` and `LD_LIBRARY_PATH` (shared libraries) environment variables to use these trusted binaries:

![[Pasted image 20240703030929.png]]

_After updating the `PATH` and `LD_LIBRARY_PATH` environment variables, run the command `check-env`. What is the flag that is returned in the output?_

```php
export PATH=/mnt/usb/bin:/mnt/usb/sbin
```

```php
export LD_LIBRARY_PATH=/mnt/usb/lib:/mnt/usb/lib64
```

**THM{5514ec4f1ce82f63867806d3cd95dbd8}**

![[Pasted image 20240703031545.png]]

---

### Files, Permissions, and Timestamps

##### Identifying the Foothold

During our initial briefing with _Penguin Corp_, we learned that _Penguin Corp's_ web server is susceptible to a file upload vulnerability, leading to an attacker gaining root access to the system. To start our investigation, we need to be able to explore the system's files effectively.

To identify clues that the file upload feature was exploited, we should focus our search on the web directories and review the uploaded files on the server. First, navigate to the web directory at `/var/www/html/` and run `ls -al` to list out the web files and directories:

![[Pasted image 20240703031705.png]]

From the directory structure, it appears that the `/uploads` directory will contain what we're hunting for. Let's list out the files in the uploads directory:

![[Pasted image 20240703031730.png]]

Upon examination of the `/uploads` directory, it is evident that many files with seemingly random names, including JPEG images, are present. Additionally, note that these files are all owned by the _www-data_ user. To focus on potential non-image files, we can use the `grep` command to filter out JPEG files:

![[Pasted image 20240703031752.png]]

The `-v` option in the grep command negates the pattern, displaying files that do not have the ".jpeg" extension. This allows us to identify and prioritise files with different extensions, such as PHP, that may require further investigation.

Viewing the contents of this interesting `.phtml` file suggests evidence of a malicious web shell (a file on a web server that allows system command execution), confirming our assumptions:

![[Pasted image 20240703031818.png]]

From the above analysis, it appears the attacker uploaded a `.phtml` document to execute PHP code on the server. Due to the unsafe `system()` call in the PHP code, this file allows the execution of arbitrary commands on the system remotely. The attacker likely exploited this to establish a more stable connection from the web server to their system.

After identifying the uploaded file that led to the foothold, it is now a good idea to look into the web server logs to correlate the request and gain more insights into the attack. Web server logs, such as Apache or Nginx logs, can provide valuable information about the attacker's activities, request patterns, and origin. This type of log analysis will be covered within _Linux Log Analysis (coming soon)_.

##### Ownership and Permissions

File ownership and permissions are critical aspects of system security. As we identified previously, the attacker achieved remote code execution on the server by uploading a malicious web shell. We also determined that the _www-data_ user owned the file, which typically represents the user account associated with the web server process. As such, we should investigate additional activity and files owned by _www-data_ to determine what the attacker may have done with their newfound access.

Attackers often target directories with write permissions to upload malicious files. Common writable directories include:

- **/tmp**: The temporary directory is writable by all users, making it a common choice.
- **/var/tmp**: Another temporary directory commonly with world write permissions.
- **/dev/shm**: The shared memory file system, which is also normally writable by all users.

It's a good idea to run the `ls -al` command to list files in these directories and investigate any suspicious files or changes. We can also leverage the `find` command to quickly identify files that match our criteria. For example:

![[Pasted image 20240703031840.png]]

The above command returns and lists all files the _www-data_ user owns, starting from the root directory. We are also directing the output of the command into the `less` command, which allows us to scroll and paginate the output, as there will likely be many entries. To exit out of the `less` command, press the `Q` key.

In the output of the command, we notice several benign entries. However, one that sticks out is `reverse.elf` listed in the `/var/www/html/assets/` directory. By listing out the file in more detail (`ls -l /var/www/html/assets/reverse.elf`), we can see that the file permissions indicate that this file is executable by all users as characterised by the `x` bit:

![[Pasted image 20240703031908.png]]

Before we investigate the `reverse.elf` file further, there are several other useful `find` commands that can be used to pull particular files during an investigation:

|   |   |
|---|---|
|`find / -group GROUPNAME 2>/dev/null`|Retrieve a list of files and directories owned by a specific group.|
|`find / -perm -o+w 2>/dev/null`|Retrieve a list of all world-writable files and directories.|
|`find / -type f -cmin -5 2>/dev/null`|Retrieve a list of files created or changed within the last five minutes.|

Notice that each command is followed by `2>/dev/null` to clean up the output by suppressing any error messages that might occur due to permissions.

##### Metadata

Metadata refers to the embedded information that describes files, which provides insights into a file's characteristics, origins, and attributes. It can include various types of information, such as file creation dates, author details, composition, and file types.

When performing live analysis on a system, metadata can be highly useful in determining the origin and modification timestamps and, in some cases, author details of specific files.

_Exiftool_ is a Perl-based command-line utility with extensive capabilities for extracting and altering metadata from files by parsing their headers and embedded metadata structures.

For example, we can analyse the metadata of the suspicious `reverse.elf` file by running the following command:

![[Pasted image 20240703031937.png]]

As seen in the above output, _ExifTool_ tells us more details about this file, such as its type, size, permissions, architecture, and even modification and access timestamps.

##### Analysing Checksums

Checksums are unique values generated from data using cryptographic hash functions (such as MD5 or SHA-256). These functions produce fixed-size strings of characters representing the data so that even a minor change in the data will result in a significantly different checksum.

Checksums are often used for data integrity verification, ensuring that data has not been altered or corrupted. For an incident responder, they can also be used to identify malicious files and executables based on known signatures.

We can leverage two useful checksum utilities to inspect the hashes of the `reverse.elf` file we identified previously. We can run both `md5sum` and `sha256sum` on the file to output its hash:

![[Pasted image 20240703031956.png]]

Once we have obtained the hash values, we can submit them to a malware detection service like [_VirusTotal_](https://www.virustotal.com/gui/home/upload) for further analysis. Upon doing so, we will find evidence of various vendors flagging this file as a Meterpreter reverse shell payload. This quick analysis suggests that the attacker placed and executed the `reverse.elf` file using their initial RCE to achieve an interactive reverse shell connection to the web server.

##### Timestamps

Timestamps are additional pieces of metadata associated with files or events that indicate when a particular action occurred. Timestamps are one of the most essential aspects for tracking the creation, modification, and access times of files and directories in incident response and forensic activities. These timestamps are invaluable in forensic investigations as they provide essential clues about the sequence of events and the actions performed on a system and help establish a timeline.

In Unix-based systems, three main timestamps are commonly recorded:

- **Modify Timestamp (mtime):** This timestamp reflects the last time the **contents** of a file were modified or altered. Whenever a file is written to or changed, its _mtime_ is updated.
- **Change Timestamp (ctime):** This timestamp indicates the last time a file's **metadata** was changed. Metadata includes attributes like permissions, ownership, or the filename itself. Whenever any metadata associated with a file changes, its _ctime_ is updated.
- **Access Timestamp (atime):** This timestamp indicates the last time a file was **accessed** or read. Whenever a file is opened, its _atime_ is updated.

We can easily view the Modify Timestamp (_mtime_) of a file by running the following command:

![[Pasted image 20240703032144.png]]

To view the Change Timestamp (_ctime_) of the same file, we can run:

![[Pasted image 20240703032210.png]]

Lastly, to view the Access Timestamp (_atime_) of the file, we can run:

![[Pasted image 20240703032228.png]]

As mentioned, a file's Access Timestamp (_atime_) can be easily and inadvertently updated as we perform investigative actions. When we viewed the metadata using _ExifTool_ or analysed its checksums with _md5sum_ or _sha256sum_, we performed read actions on `reverse.elf`, thus altering its access time. This is an important concept to consider with live forensic analysis, which is why it's crucial to obtain forensically sound backups and copies of the affected system beforehand. Because of this, the _atime_ will not be a reliable metric for us.

While it's useful to recall the three commands above, we can also leverage the `stat` command to quickly see all three timestamps at once:

![[Pasted image 20240703032250.png]]

---

_To practice your skills with the `find` command, locate all the files that the user **bob** created in the past 1 minute. Once found, review its contents. What is the flag you receive?_ 

**THM{0b1313afd2136ca0faafb2daa2b430f3}**

_Extract the metadata from the `reverse.elf` file. What is the file's MIME type?_

**application/octet-stream**

_Run the `stat` command against the `/etc/hosts` file on the compromised web server. What is the full **Modify Timestamp (mtime)** value?_

**2020-10-26 21:10:44.000000000 +0000**

---
### Commands

```php
ls -la | grep -v ".jpeg"
```

```php
find / -user www-data -type f 2>/dev/null | less
```

|   |   |
|---|---|
|`find / -group GROUPNAME 2>/dev/null`|Retrieve a list of files and directories owned by a specific group.|
|`find / -perm -o+w 2>/dev/null`|Retrieve a list of all world-writable files and directories.|
|`find / -type f -cmin -5 2>/dev/null`|Retrieve a list of files created or changed within the last five minutes.|
```php
find / -group GROUPNAME 2>/dev/null
```

```php
find / -perm -o+w 2>/dev/null
```

```php
find / -type f -cmin -5 2>/dev/null
```

```php
md5sum /var/www/html/assets/reverse.elf 
sha256sum /var/www/html/assets/reverse.elf
```

```php
find / -user bob -type f -cmin -5 2>/dev/null
```


---

### Users and Groups

As we continue our investigation, we should focus on the system's users and groups. In doing so, we may uncover evidence of the attacker moving laterally or maintaining access throughout the system by exploiting additional vulnerabilities.

Identifying User Accounts

Within UNIX-like systems, the _/etc/_ directory is a central location that stores configuration files and system-wide settings. Specifically, when investigating user accounts, `/etc/passwd` is a colon-separated plaintext file that contains a list of the system's accounts and their attributes, such as the user ID (UID), group ID (GID), home directory location, and the login shell defined for the user.

Let's view the user accounts on the affected system by reading the file:

Viewing the Contents of /etc/passwd

![[Pasted image 20240703034950.png]]

Attackers can maintain access to a system by creating a backdoor user with root permissions. We can leverage the `cut` and `grep` commands to identify this type of user account backdoor quickly. The following command extracts and displays all user accounts with the user ID (UID) of 0. The presence of a user with UID 0, other than the legitimate root user account, can quickly suggest a potential backdoor account.

Filtering the Contents of /etc/passwd

![[Pasted image 20240703035025.png]]

In the above command, we first display the contents of the `/etc/passwd` file. We then take the contents and perform a `cut` action to extract only the first (username) and third (user ID) fields from each line, delimited (`-d` by the `:` character. We then use the `grep` command to extract specific entries containing `:0`, signifying a user ID of 0.

This, however, is not a foolproof method, as the backdoor account could have been created with legitimate user and group IDs. For further investigation, we can take a look at **groups**.

Identifying Groups

In Linux systems, certain groups grant specific privileges that attackers may target to escalate their privileges. Some important Linux groups that might be of interest to an attacker include:

- **sudo** or **wheel**: Members of the sudo (or wheel) group have the authority to execute commands with elevated privileges using sudo.
- **adm**: The adm group typically has read access to system log files.
- **shadow**: The shadow group is related to managing user authentication and password information. With this membership, a user can read the `/etc/shadow` file, which contains the password hashes of all users on the system.
- **disk**: Members of the disk group have almost unrestricted read and limited write access inside the system.

We can view all of the groups (and their respective group IDs) on the system by reading the `/etc/group` file:

Viewing the Contents of /etc/group

![[Pasted image 20240703035110.png]]

To determine which groups a specific user is a member of, we can run the following command:

Viewing a Specific Users' Groups

    `investigator@10.10.93.164:~$ groups investigator 
    investigator : investigator adm dialout cdrom floppy sudo audio dip video plugdev netdev lxd`
        

Alternatively, to list all of the members of a specific group, we can run the following command:

Viewing a Specific Groups' Users

           `investigator@10.10.93.164:~$ getent group adm adm:x:4:syslog,ubuntu,investigator`
        

If multiple users are in a group (as seen above), their usernames will be listed in a comma-separated format in the entry.

To list all users in the _sudo_ group, we can provide either the name "sudo" or the group ID, typically _27_.

Viewing Group Members by Group ID

           `investigator@10.10.93.164:~$ getent group 27 sudo:x:27:ubuntu,investigator`
        

User Logins and Activity

Checking user logins and activity is valuable for performing a real-time analysis of a compromised system. Fortunately, a couple of useful utilities and logs can assist us.

**last and lastb**

The `last` command is an excellent tool for examining user logins and sessions. It is used to display the history of the last logged-in users. It works by reading the `/var/log/wtmp` file, which is a file that contains every login and logout activity on the system. Similarly, `lastb` specifically tracks failed login attempts by reading the contents of `/var/log/btmp`, which can help identify login and password attacks.

last Example

![[Pasted image 20240703035305.png]]

**lastlog**

Unlike the `last` command, which provides information about all user logins, the `lastlog` command focuses on a user's most recent login activity and reads from the `/var/log/lastlog` file.

lastlog Example

![[Pasted image 20240703035331.png]]

**Failed Login Attempts**

In addition to `lastb`, there are other ways to view failed login attempts on Linux through specific log files. The `/var/log/auth.log` file (or `/var/log/secure` on some distributions like CentOS or Red Hat) contains records of authentication-related events, including both successful and failed login attempts.

**who**

The `who` command is a very straightforward command that can be used to display the users that are currently logged into the system. The output of this command can provide details such as the name of the user logged in, the terminal device used, the time that the session was established, idle activity, the process ID of the shell, and additional comments that may include details such as the initial command used to start the session.

who Example

           `investigator@10.10.93.164:~$ who 
           investigator pts/0        2024-02-13 02:29 (10.10.101.34)`
        

Sudo

The `/etc/sudoers` file is a particularly sensitive configuration file within Unix-like systems. It determines which users possess sudo privileges, enabling them to execute commands as other users, typically the root user.

As a result, it can be a target for attackers seeking persistence. For instance, if an attacker can find a way to insert their user account (or one that they control) into the sudoers file, they could grant themselves elevated privileges without requiring authentication. Alternatively, they may alter existing entries to broaden their access.

For example, a line in a sudoers file might look like this:

/etc/sudoers Example

           `user@tryhackme$ sudo cat /etc/sudoers richard   
           ALL=(ALL) /sbin/ifconfig`
        

More specifically, this line specifies:

- **richard** is the username being granted sudo privileges.
- **ALL** indicates that the privilege applies to all hosts.
- **(ALL)** specifies that the user can run the command as any user.
- `/sbin/ifconfig` is the path to the specific binary, in this case, the ifconfig utility.

With this configuration, Richard can execute `ifconfig` with elevated sudo privileges to manage network interfaces as necessary.

---
#### Commands

```php
cat /etc/passwd | cut -d: -f1,3 | grep ':0$'
```

---

_Investigate the user accounts on the system. What is the name of the backdoor account that the attacker created?  

**b4ckd00r3d**

_What is the name of the group with the group ID of **46**?

**plugdev**

_View the `/etc/sudoers` file on the compromised system. What is the full path of the binary that Jane can run as sudo?

**/usr/bin/pstree**

---

#### User Directories and Files

In the previous task, we identified a backdoor account that the attacker created and gained access to. However, we should take a step back and determine how the attacker got the privileges to create that account in the first place. To expand our investigation into the system's users and groups, we should also look into each user's personal directory, files, history, and configurations.

User Home Directories

User home directories in Linux contain personalised settings, configurations, and user-specific data. These directories are typically located under the `/home` directory and are named after the corresponding usernames on the system. Recall viewing the `/etc/passwd` file and identifying various users and their home directories.

We can list out the home directories with a simple `ls -l` command:

Listing the /home Directories

![[Pasted image 20240703042444.png]]

Hidden Files

Hidden files, identified by a leading dot in their filenames, often store sensitive configurations and information within a user's home directory. By default, we cannot list out these hidden files using `ls`. To view them, we need to provide the `-a` argument, which will include all entries starting with a dot.

To list out the hidden files within Jane's home directory, run:

Listing Jane's Hidden Files and Directories

           `investigator@10.10.93.164:~$ ls -a /home/jane 
           .  ..  .bash_history  .bash_logout  .bashrc  .cache  .profile  .ssh`
        

Some common files that would be of interest during an investigation include:

- **.bash_history**: This file contains a user's command history and can be used to show previous commands executed by the user.
- **.bashrc** and **.profile**: These are configuration files used to customise a user's Bash shell sessions and login environment, respectively.

Additionally, we can look at other files and directories of interest, like browser profiles and the `.ssh` directory.

SSH and Backdoors

The `.ssh` directory is a susceptible area containing configuration and key files related to SSH connections. The `authorized_keys` file within the directory is critical because it lists public keys allowed to connect to a user's account over SSH.

If a malicious user gains unauthorised access to a system and wants to persistently access another user's account (for example, Jane's account) by adding their public key to the `authorized_keys` file, we can potentially uncover artefacts that hint at these actions.

First, navigate to the `.ssh` directory within Jane's home folder. From here, we can run an `ls -al` to list the contained files:

Listing Jane's .ssh Directory

![[Pasted image 20240703042520.png]]

Let's view the file to see if we can identify any unintended authorised public keys:

Viewing Jane's authorized_keys Entries

           `investigator@10.10.93.164:~$ cat /home/jane/.ssh/authorized_keys  
           ssh-rsa ******************** jane@ip-10-10-25-169 
           ssh-rsa ******************** backdoor`
        

Notice that there are two entries. The first belongs to Jane, as signified by the ending comment. However, the second entry appears to be related to an entirely different keypair with the comment "backdoor". The attacker was likely able to edit this file and append their own public key, allowing them SSH access as Jane.

We can further confirm this by returning to the `stat` command. By running it on the file, we can see that it was last modified around a similar timeframe to when we confirmed the attacker gained an initial foothold on the system.

Viewing the Timestamps on the authorized_keys File

  ![[Pasted image 20240703042604.png]]

If we look back to the output of the `ls -al` command, we can identify the permission misconfiguration that made this possible:

Viewing the Permissions of the authorized_keys File

        `investigator@10.10.93.164:~$ ls -al /home/jane/.ssh/authorized_keys  
        -rw-rw-rw- 1 jane jane 1136 Feb 13 00:34 /home/jane/.ssh/authorized_keys`
        

As identified by the third `rw` permissions, this file is world-writable, which should never be the case for sensitive files. Consequently, by exploiting this misconfiguration, the attacker gained unauthorised SSH access to the system as if they were Jane.

---

#### Commands

```php
ls -l /home
```

investigator:TryHackMe123!

---

_View Jane's `.bash_history` file. What flag do you see in the output?  

**THM{f38279ab9c6af1215815e5f7bbad891b}**

_What is the hidden flag in Bob's home directory?  

**Only one of the hidden files had a size of 38, the rest 0. THM{6ed90e00e4fb7945bead8cd59e9fcd7f}**

_Run the `stat` command on Jane's `authorized_keys` file. What is the full timestamp of the most recent modification?

**2024-02-13 00:34:16.005897449 +0000**

---

### Binaries and Executables

Another area to look at within our compromised host's file system is identifying binaries and executables that the attacker may have created, altered, or exploited through permission misconfigurations.

Identifying Suspicious Binaries

We can use the `find` command on UNIX-based systems to discover all executable files within the filesystem quickly:

Listing all Executable Binaries on the System

![[Pasted image 20240703044807.png]]

The following command recursively traverses the file system starting from the root directory and lists any executable file it finds. Note that this provides a huge amount of output. As such, it's often a good idea to limit the scope of the search through additional parameters.

Once we identify an executable or binary that we want to investigate further, we can perform metadata analysis as we have done previously, performing integrity checking on it using checksums or inspecting its human-readable strings and raw content.

Strings

The `strings` command is valuable for extracting human-readable strings from binary files. These strings can sometimes include function names, variable names, and even plain text messages embedded within the binary. Analysing this information can help responders determine what the binary is used for and if there is any potential malicious activity involved. To run the strings command on a file, we need to provide the file as a single argument:

strings Example

           `user@tryhackme$ strings example.elf`
        

Debsums

Like the integrity checking we performed earlier, `debsums` is a command-line utility for Debian-based Linux systems that verifies the integrity of installed package files. `debsums` automatically compares the MD5 checksums of files installed from Debian packages against the known checksums stored in the package's metadata.

If any files have been modified or corrupted, `debsums` will report them, citing potential issues with the package's integrity. This can be useful in detecting malicious modifications and integrity issues within the system's packages. We can perform this check on the compromised system by running the following command:

Scanning Packages with debsums

           `investigator@10.10.93.164:~$ sudo debsums -e -s 
           debsums: changed file /***/******* (from sudo package)`
        

In the above command, we provide the `-e` flag to only perform a configuration file check. In addition, we provide the `-s` flag to silence any error output that may fill the screen.

Binary Permissions

SetUID (SUID) and SetGID (SGID) are special permission bits in Unix operating systems. These permission bits change the behaviour of executable files, allowing them to run with the privileges of the file owner or group rather than the privileges of the user who executes the file.

If a binary or executable on the system is misconfigured with an SUID or SGID permission set, an attacker may abuse the binary to break out of a restricted (unprivileged) shell through legitimate but unintended use of that binary. For example, if the PHP binary contained a SUID bit to run as root, it's trivial for an attacker to abuse it to run system commands through PHP's system exec functions as root.

Identifying SetUID (SUID) binaries on a Linux system involves examining the file permissions and explicitly looking for executables with the SetUID bit set. We can return to the `find` command to retrieve a list of the SetUID binaries on the system:

Listing SUID Binaries with find

![[Pasted image 20240703044845.png]]

Specifically, the above command looks for files where the user permission has the SUID bit set (`-u=s`).

Much of the output here is expected as these binaries require the SUID bit and are not vulnerable. However, two of these results stand out. Firstly, Python should never be given SUID permission, as it is trivial to escalate privileges to the owner. Additionally, any SUID binaries in the `/tmp` or `/var/tmp` directory stand out as these directories are typically writable by all users, and unauthorised creation of SUID binaries in these directories poses a notable risk.

We can investigate further by looking in Jane's bash history for any commands related to Python or bash:

Correlating SUID Abuse in bash_history

![[Pasted image 20240703044908.png]]

From the output, we've discovered evidence of Jane's user account identifying SUID binaries with the `find` command and abusing the SUID permission on the Python binary to run system commands as the root user. With this level of command execution, the attacker was able to create a copy of the `/bin/bash` binary (the Bash shell executable) and place it into the `/var/tmp` folder. Additionally, the attacker changed the owner of this file to root and added the SUID permission to it (`chmod +s`).

After making an SUID copy of `/bin/bash`, the attacker elevated to root by running `/var/tmp/bash -p`. We can further verify the `bash` binary by performing an integrity check on the original:

Integrity Checking the Suspicious SUID Binary

![[Pasted image 20240703044927.png]]

The output above shows that the two binaries are identical, further enhancing our understanding of the attacker's actions to escalate to root.

---
### Commands

```php
sudo debsums -e -s
```

```php
find / -perm -u=s -type f 2>/dev/null
```


---
_Run the `debsums` utility on the compromised host to check only configuration files. Which file came back as altered?

**/etc/sudoers**

_What is the `md5sum` of the binary that the attacker created to escalate privileges to root?

**7063c3930affe123baecd3b340f1ad2c**

---

### Rootkits

A rootkit is a type of malicious set of tools or software designed to gain administrator-level control of a system while remaining undetected by the system or user. The term "rootkit" derives from "root", the highest-level user in Unix-based systems, and "kit", which typically refers to a set of tools used to maintain this access.

Rootkits are particularly dangerous because they can hide their presence on a system and allow attackers to maintain long-term access without detection. Attackers can also use them to stage other malicious activities on the target, exfiltrate sensitive information, or command and control the compromised system remotely.

Fortunately, we can use some automated tools on UNIX-based systems to help detect and remove rootkits.

Chkrootkit

[Chkrootkit (Check Rootkit)](https://www.chkrootkit.org/) is a popular Unix-based utility used to examine the filesystem for rootkits. It operates as a simple shell script, leveraging common Linux binaries like `grep` and `strings` to scan the core system programs to identify signatures. It can use the signatures from files, directories, and processes to compare the data and identify common patterns of known rootkits. As it does not perform an in-depth analysis, it is an excellent tool for a first-pass check to identify potential compromise, but it may not catch all types of rootkits.

Additionally, modern rootkits might deliberately attempt to identify and target copies of the _chkrootkit_ program or adopt other strategies to evade its detection.

We can access the _chkrootkit_ on the compromised system using our mounted binaries. We can perform a simple check by running `chkrootkit`:

Chkrootkit Example

![[Pasted image 20240703050905.png]]

This scan will produce a large output, but it indicates the results of various checks for known rootkit-related files or patterns.

RKHunter

[RKHunter (Rootkit Hunter)](https://rkhunter.sourceforge.net/) is another helpful tool designed to detect and remove rootkits on Unix-like operating systems. It offers a more comprehensive and feature-rich rootkit detection check compared to _chkrootkit_. _RKHunter_ can compare SHA-1 hashes of core system files with known good ones in its database to search for common rootkit locations, wrong permissions, hidden files, and suspicious strings in kernel modules. It is an excellent choice for a more comprehensive assessment of the affected system.

Because rkhunter leverages a live database of known rootkit signatures, checking for database updates (`rkhunter --update`) before running in the field is crucial. Because this system is isolated, we won't be able to run a database update here, but the latest version was acquired before mounting our tools to the system.

To perform a simple scan with _rkhunter_, we can run the following command:

Rkhunter Example

 ![[Pasted image 20240703050932.png]]

This check will take some time to run but we have bypassed the user interaction prompts with the `-sk` argument. Afterwards, you will receive a system check summary detailing what was found.

---
#### Commands

```php
sudo chkrootkit
```

```php
sudo rkhunter -c -sk
```

---

_Run _chkrootkit_ on the affected system. What is the full path of the `.sh` file that was detected?  

**/var/tmp/findme.sh**

_Run _rkhunter_ on the affected system. What is the result of the `(UID 0) accounts` check?

**Warning**

