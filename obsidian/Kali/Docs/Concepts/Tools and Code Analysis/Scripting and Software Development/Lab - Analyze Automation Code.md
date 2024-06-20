**Protego Security Solutions Task**

Vulnerability scanning and information gathering can be very time consuming. As you have seen there are a number of software products available that automate these processes by using multiple tools against multiple targets. While automated scanners are great and can do a lot for us, sometimes they don’t suit our specific needs.

it is important that you work on your coding skills so that you can understand automation scripts that are written in a variety of scripting languages. You need to understand existing scripts and be able to modify them to suit our current needs. We have our own repository of automation scripts that we have developed and frequently use at Protego. You should also know enough scripting to create some of your own scripts by following examples and consulting online resources and coding forums.

In this lab, you will complete the following objectives:

- Part 1: Write a Bash script to automate an Nmap scan and store the results.
- Part 2: Differentiate between scripts written in Bash, Python, Ruby, and PowerShell.

ine numbers are added automatically in Mousepad, do not type them. They should not appear in the script itself.

1 _**#!/bin/bash**_

3. In this script, the user will enter the IP address of the target as a command line option. If no option is entered, the user will receive an error message showing the proper command syntax. Enter the **if**/**then** sequence as shown.

```bash
# Check if IP of target is entered

if [ -z "$1" ]

then

	echo "Correct usage is ./recon.sh <IP>"

    exit 1

else

       echo "Target IP $1"

fi
```

Analyzing script code is an important skill for a penetration tester. Not only will you write automation code, you will often need to determine what an existing script does. The meaning of each line of is as follows:

- Line 2 is a comment line that begins with a hash tag #. Lines starting with # are used to document the script. Comment lines are ignored by the command interpreter.
- Line 3 starts a test to determine if the input option variable **$1** exists. By default, Bash scripts accept command line options into variables numbered by their position in the command. The **-z** returns "true" if the value of **$1** is null. Bash requires a space after the first bracket **[ and a space before the last bracket ]**.
- Line 4 indicates what to do if the option variable does not exist (is null). Lines 5 and 6 are indented to indicate that they are part of the **then** clause.
- Line 5 prints a message to the screen. Bash uses the **echo** command to print what is in the double quotes to the screen.
- Line 6 will cause the script execution to stop and exit to the CLI if the condition is met.
- Line 7 indicates what to do if the if condition is false.
- Line 8 prints a message with the input value that was supplied and stored in the **$1** variable. Note that further work is required to validate that the input was actually a valid IP address. This is beyond the scope of this lab.
- Line 9 indicates that the **if**/**then** clauses are complete.

4. Save your file with the name **recon.sh**. In this example, the file is saved in the **/home/kali** directory.
5. To make a text file into an executable, it is necessary to change the Linux permissions on the file. Open a terminal window on the Kali desktop. List the directory using **ls** and verify that your script file is there and has the correct name. Enter the **chmod +x** command to add the executable permission to your file.

(kali㉿Kali)-[~]

└─$ **chmod +x recon.sh**

6. Test your script by running it first with the IP address of the target (10.6.6.23) specified.

┌──(kali㉿Kali)-[~]

└─$ **./recon.sh 10.6.6.23**

`Target IP 10.6.6.23`

7. Further test your script by running it as follows:
    1. with no input supplied after the script name
    2. with other text or an invalid IP address supplied after the script name. Note that if you are entering non-numeric text, it must be surrounded by quotation marks.

**Q.** The purpose of the script is to automate Nmap scanning using the target IP address value that is supplied to the script. What do you think will happen if the value is not a legal IP address?

**A.** It will cause an error in Nmap and the script will fail.

Now edit the script file to enter the commands that will run the Nmap scan. Use the variable **$1** to indicate the IP address of the target device you want to scan. The results of the Nmap scan will be written to a file named **scan_results.txt** in the current directory.

```bash

echo "Running Nmap…"

# Run Nmap scan on target and save results to file

nmap -sV $1 > scan_results.txt

echo "Scan complete – results written to scan_results.txt"
```

Nmap will scan for open services and their version numbers.

Save the script. Below is the **recon.sh** script so far.

```bash
#!/bin/bash

# Check if IP of target is entered

if [ -z "$1" ]

  then

    echo "Correct usage is ./recon.sh <IP>"

    exit

  else

    echo "Target IP $1"

    echo "Running Nmap…"

# Run Nmap scan on target and save results to file

    nmap -sV $1 > scan_results.txt

    echo "Scan complete – results written to scan_results.txt"

fi
```

Run it again with the target IP address supplied.

kali㉿kali)-[~]

└─$ **./recon.sh 10.6.6.23**

Target IP 10.6.6.23

Running Nmap....

Scan complete -- results written to scan_results.txt

Use the **cat** command to view the contents of the **scan_results.txt** file that you created with the script.

**What ports are open on the target?**

 21/tcp  open  ftp

 22/tcp  open  ssh

 53/tcp  open  domain

 80/tcp  open  http

 139/tcp open  netbios-ssn

 445/tcp open  microsoft-ds

---
#### Step 2

### Modify the script to enumerate shares on the target.

As seen in the previous step, the target at 10.6.6.23 has open ports that could indicate a Samba server. In this step, you will edit your script to run **enum4linux** if a Samba drive share port is open to determine any available drive shares or user accounts.

What indicates that a Samba server is running on the hosts?
**Ports 139 and 445 are open.**
1. Open the **recon.sh** file in the text editor. Add the following commands.

13 **_# If the Samba port 445 is found and open, run enum4linux._**

14 **_if grep 445 scan_results.txt | grep -iq open_**

15 **_then_**

16    **_enum4linux -U -S $1 >> scan_results.txt_**

17    **_echo "Samba found. Enumeration complete."_**

18    **_echo "Results added to scan_results.txt."_**

19    _**echo "To view the results, cat the file."**_

20 **_else_**

21    _**echo "Open SMB share ports not found."**_

22 _**fi**_

2. Analyze the additional code.

- Line 13 is a comment.
- Line 14 indicates the start of an **if/then** statement that will search in the Nmap results for open port 445. The **grep** command searches lines in the file that match the pattern “445 open.” The **grep** command searches for lines that match the pattern “445” first. Then the output is piped into a second **grep** command to search again for lines that match the pattern **open**. With the option **-i**, the **grep** command ignores the case distinctions in the search patterns. The option **-q** suppresses standard outputs.
    
- Line 15 is the "**then**" clause. This contains the command that will be executed should the **if** test return "true".
- Lines 16 - 19 are executed if the SMB file sharing port (445) is found. Line 16 runs **enum4linux** with the **-U** and **-S** options on the target host specified in **$1** and appends the results to the end of the **scan_results.txt** file. Lines 17, 18 and 19 display messages when emun4linux finished the scan and provides directions to view the results.
- Line 20 indicates that the action to take if the logical if the condition fails.
- Line 21 displays a message if the SMB file sharing port (445) is not open.
- Line 22 the **fi** signifies the end of the **if/then** clause.

What do the **-U** and **-S** options do in enum4linux?
**-U enumerates users found  
-S enumerates drive shares**

```bash
#!/bin/bash

# Check if IP of target is entered

if [ -z "$1" ]

  	then

    	echo "Correct usage is ./recon.sh <IP>"

    	exit

else

    echo "Target IP $1"

    echo "Running Nmap…"

# Run Nmap scan on target and save results to file

    nmap -sV $1 > scan_results.txt

    echo "Scan complete – results written to scan_results.txt"

fi

# If the Samba port 445 is found and open, run enum4linux.

if grep 445 scan_results.txt | grep -iq open

	then

    	enum4linux -U -S $1 >> scan_results.txt

    	echo "Samba found. Enumeration complete."

		echo "Results added to scan_results.txt."

    	echo "To view the results, cat the file."

else

		echo "Open SMB share ports not found."

fi
```

What file shares were found on the target?

**homes           Disk      All home directories**

        workfiles       Disk      Confidential Workfiles

        print$          Disk      Printer Drivers

        IPC$            IPC       IPC Service (Samba 4.9.5-Debian)

---
### Step 3: Automate Nmap from the command line.

Another way to automate Nmap is to scan a group of specific targets that are specified in an external file.

1. Create a new file in Mousepad and type in the IP addresses of the existing hosts on the 10.6.6.0/24 network. To list all the available hosts with their IP addresses, enter the command **containers** at a terminal.

Be sure the IP addresses are separated with a space or list each IP address on a separate line.

2. Save the file with the name **to_scan.txt**.
3. At the prompt, enter the command to run Nmap with the targets from the file. For the purposes of this lab, will just run a simple ping scan, but any type of scan that takes an IP address as a target can be run in this way.

┌──(kali㉿Kali)-[~]

└─$ **nmap -sn -iL to_scan.txt**

4. After a brief delay, you should see Nmap output the scan reports for each host that was specified in the **to_scan.txt** file.

**Note**: The to_scan.txt file does not require executable permissions because it is serving as a data file, not as a script file.

## Part 2: Differentiate between scripts written in Bash, Python, Ruby, and PowerShell

In this part, you will use what you learned in the previous part about writing and analyzing a Bash script to analyze pre-written scripts. Knowing what scripting language is being used in scripts that you discover while penetration testing enables you to understand the purpose of the script, and potentially be able to modify it to obtain additional information.

Use this chart that illustrates the different syntax characteristics of the scripting languages.

---

Code analysis skills are tested on penetration testing certifications. What benefit does having code analysis skills provide to penetration testers when discovering vulnerabilities?

**According to one certification creator, in order to analyze code, pen testers must be familiar with coding languages. Code analysis helps pen testers discover vulnerabilities, including code attempting to download files, launch remote access, enumerate users and/or enumerate assets. 

---

Skills Check

What is true of the code below? (Choose all that apply.)

```python
import nmap
start = 20
stop = 26
thost = '192.186.6.20’
for i in range(start,stop+1):
   results = nmap.PortScanner(thost,str(i))
   results = results['scan'][thost]['tcp'][i]['state']
   print(‘Port {i} is {results}.')
```

**This is a Python script. It imports the Python module to enable the script to use Nmap. It will scan the target 192.168.6.20 to determine the state of TCP ports 20 to 26. It will display the results for each scan.**

