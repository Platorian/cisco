The **_Social-Engineer Toolkit (SET)_** is a tool developed by David Kennedy. This tool can be used to launch numerous social engineering attacks and can be integrated with third-party tools and frameworks such as Metasploit. SET is installed by default in Kali Linux and Parrot Security. However, you can install it on other flavors of Linux as well as on macOS. You can download SET from [_https://github.com/trustedsec/social-engineer-toolkit_](https://github.com/trustedsec/social-engineer-toolkit).

**Select the following steps to see a demonstration of how to easily create a spear phishing email using SET.**

**Step 1**. Launch SET by using the **_setoolkit_** command. You see the menu shown in Figure 4-2.

**Figure 4-2** - SET Main Menu

![[Pasted image 20240621112237.png]]

**Step 2**. Select **1) Social-Engineering Attacks** from the menu to start the social engineering attack. You now see the screen shown in Figure 4-3.

**Figure 4-3** - Social Engineering Attack Menu in SET

![[Pasted image 20240621112307.png]]

**Step 3**. Select **1) Spear-Phishing Attack Vectors** from the menu to start the spear-phishing attack. You see the screen shown in Figure 4-4.

**Figure 4-4** - Spear-Phishing Attack Menu

![[Pasted image 20240621112325.png]]

**Step 4**. To create a file format payload automatically, select **2) Create a FileFormat Payload**. You see the screen shown in Figure 4-5.

**Figure 4-5** - Creating a FileFormat Payload

![[Pasted image 20240621112339.png]]

**Step 5**. Select **13) Adobe PDF Embedded EXE Social Engineering** as the file format exploit to use. (The default is the PDF embedded EXE.) You see the screen shown in Figure 4-6.

**Figure 4-6** - Adobe PDF Embedded EXE Social Engineering

![[Pasted image 20240621112402.png]]

**Step 6.** To have SET generate a normal PDF with embedded EXE and use a built-in blank PDF file for the attack, select **2) Use built-in BLANK PDF for attack**. You see the screen shown in Figure 4-7.

SET gives you the option to spawn a command shell on the victim machine after a successful exploitation. It also allows you to perform other post-exploitation activities, such as spawning a Meterpreter shell, Windows reverse VNC DLL, reverse TCP shell, Windows Shell Bind_TCP, and Windows Meterpreter Reverse HTTPS. Meterpreter is a post-exploitation tool that is part of the Metasploit framework. In Module 5, “Exploiting Wired and Wireless Networks,” you will learn more about the various tools that can be used in penetration testing.

**Figure 4-7** - Configuring SET to Spawn a Windows Reverse TCP Shell on the Victim

![[Pasted image 20240621112413.png]]

**Step 7**. To use the Windows reverse TCP shell, select **1) Windows Reverse TCP Shell**. You see the screen shown in Figure 4-8.

**Figure 4-8** - Generating the Payload in SET

![[Pasted image 20240621112424.png]]

**Step 8**. When SET asks you to enter the IP address or the URL for the payload listener, select the IP address of your attacking system (**192.168.88.225** in this example), which is the default option since it automatically detects your IP address. The default port is 443, but you can change it to another port that is not in use in your attacking system. In this example, TCP port **1337** is used. After the payload is generated, the screen shown in Figure 4-9 appears.

**Step 9**. When SET asks if you want to rename the payload, select **2. Rename the file, I want to be cool**. and enter **chapter2.pdf** as the new name for the PDF file.

**Figure 4-9** - Renaming the Payload

![[Pasted image 20240621112435.png]]

**Step 10**. Select **1. E-Mail Attack Single Email Address**. The screen in Figure 4-10 appears.

**Figure 4-10** - Using a One-Time Email Template in SET

![[Pasted image 20240621112446.png]]

**Step 11**. When SET asks if you want to use a predefined email template or create a one-time email template, select **2. One-Time Use Email Template.**

**Step 12**. Follow along as SET guides you through the steps to create the one-time email message and enter the subject of the email.

**Step 13**. When SET asks if you want to send the message as an HTML message or in plaintext, select the default, **plaintext**.

**Step 14**. Enter the body of the message by typing or pasting in the text from Example 4-2, earlier in this module (see Figure 4-11).

**Figure 4-11** - Sending the Email in SET

![[Pasted image 20240621112458.png]]

**Step 15**. Enter the recipient email address and specify whether you want to use a Gmail account or use your own email server or an open mail relay.

**Step 16**. Enter the “from” email address (the spoofed sender’s email address) and the “from name” the user will see.

**Step 17**. If you selected to use your own email server or open relay, enter the open-relay username and password (if applicable) when asked to do so.

**Step 18**. Enter the SMTP email server address and the port number. (The default port is 25.) When asked if you want to flag this email as a high-priority message, make a selection. The email is then sent to the victim.

**Step 19**. When asked if you want to set up a listener for the reverse TCP connection from the compromised system, make a selection.

