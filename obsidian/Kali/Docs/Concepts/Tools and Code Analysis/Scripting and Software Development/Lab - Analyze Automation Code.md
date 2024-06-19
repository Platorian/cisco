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



