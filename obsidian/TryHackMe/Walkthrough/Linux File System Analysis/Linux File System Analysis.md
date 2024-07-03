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



_Extract the metadata from the `reverse.elf` file. What is the file's MIME type?_



_Run the `stat` command against the `/etc/hosts` file on the compromised web server. What is the full **Modify Timestamp (mtime)** value?_

