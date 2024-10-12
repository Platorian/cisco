
**_Credential harvesting_** is not a new attack type, but the methodologies used by attackers have evolved throughout the years. Credential harvesting (or password harvesting) is the act of gathering and stealing valid usernames, passwords, tokens, PINs, and any other types of credentials through infrastructure breaches. In Module 4, “Social Engineering Attacks,” you learned all about phishing and spear phishing attacks. One of the most common ways that attackers perform credential harvesting is by using phishing and spear phishing emails with links that could redirect a user to a bogus site. This “fake site” could be made to look like a legitimate cloud service, such as Gmail, Office 365, or even a social media site such as Twitter, LinkedIn, Instagram, or Facebook. This is why it is so important to use multifactor authentication. However, in some cases, attackers could bypass multifactor authentication by redirecting the user to a malicious site and stealing a session cookie from the user’s browser.

Many cloud services and cloud-hosted applications use single sign-on (SSO), and others use federated authentication. Sometimes cloud-based applications allow you to log in with your Google, Apple, or Facebook credentials. Attackers could redirect users to impersonated websites that may look like legitimate Google, Apple, Facebook, or Twitter login pages. From there, the attacker could steal the victim’s username and password. Figure 7-1 shows an example of a common credential harvesting attack in which the attacker sends to the victim a spear phishing email that includes a link to a fake site (in this example, a Twitter login).

**_Figure 7-1_** _- Credential Harvesting Attack Using Social Engineering and Spear Phishing Emails_

![[Pasted image 20240617075741.png]]

In Module 4, you learned about the Social-Engineer Toolkit (SET). In the following examples, you will see how easy it is to perform a social engineering attack and instantiate a fake website (in this case, a fake Twitter login site) to perform a credential harvesting attack.

#### Step 1-2

**Step 1**. Launch SET by entering the **setoolkit** command.

**Step 2**. Select **1) Social-Engineering Attacks** from the main menu, as shown in Example 7-1.

**_Example 7-1_** - Starting the Social Engineering Attack

```
Select from the menu:   
1) Social-Engineering Attacks   
2) Penetration Testing (Fast-Track)   
3) Third Party Modules   
4) Update the Social-Engineer Toolkit   
5) Update SET configuration   
6) Help, Credits, and About  
99) Exit the Social-Engineer Toolkitset> 1
```

#### Step 3

**Step 3**. In the menu that appears (see Example 7-2), select **2)** **Website Attack Vectors**.

**_Example 7-2_** - Selecting Website Attack Vectors

```
Select from the menu:    
1) Spear-Phishing Attack Vectors    
2) Website Attack Vectors    
3) Infectious Media Generator    
4) Create a Payload and Listener    
5) Mass Mailer Attack    
6) Arduino-Based Attack Vector    
7) Wireless Access Point Attack Vector    
8) QRCode Generator Attack Vector    
9) Powershell Attack Vectors   
10) Third Party Modules   
99) Return back to the main menu.set>2 
```

#### Step 4

**Step 4**. In the menu and explanation that appear next (see Example 7-3), select **3) Credential Harvester Attack Method**.

**_Example 7-3_** - Selecting the Credential Harvester Attack Method

```
The HTA Attack method will allow you to clone a site and performpowershell injection through HTA files which can be used forWindows-based powershell exploitation through the browser.   
1) Java Applet Attack Method   
2) Metasploit Browser Exploit Method   
3) Credential Harvester Attack Method   
4) Tabnabbing Attack Method   
5) Web Jacking Attack Method   
6) Multi-Attack Web Method   
7) HTA Attack Method  
99) Return to Main Menuset:webattack>3
```

#### Step 5 

**Step 5**. In the menu that appears next (see Example 7-4), select **1) Web Templates** to use a predefined web template (Twitter). As you can see, you also have options to clone an existing website or import a custom website. In this example, you use a predefined web template.

**_Example 7-4_** - Selecting a Predefined Web Template

```
The first method will allow SET to import a list of pre-defined webapplications that it can utilize within the attack.The second method will completely clone a website of your choosingand allow you to utilize the attack vectors within the completelysame web application you were attempting to clone.The third method allows you to import your own website, note that youshould only have an index.html when using the import websitefunctionality.   
1) Web Templates   
2) Site Cloner   
3) Custom Import  
99) Return to Webattack Menuset:webattack>1
```

#### Step 6

**Step 6**. In the menu shown in Example 7-5, enter the IP address of the host that you would like to use to harvest the user credentials (in this case, **192.168.88.225**). In this example, SET has recognized the attacking system’s IP address. If this occurs for you, you can just press **Enter** to select the attacking system’s IP address.

**_Example 7-5_** - Entering the Credential Harvester’s IP Address

![[Pasted image 20240617081102.png]]

#### Step 7

**Step 7**. Select **3. Twitter**, as shown in Example 7-6.

**_Example 7-6_** - Selecting the Template for Twitter

![[Pasted image 20240617081336.png]]

You can then redirect users to this fake Twitter site by sending a spear phishing email or taking advantage of web vulnerabilities such as cross-site scripting (XSS) and cross-site request forgery (CSRF). Figure 7-2 shows the fake Twitter login page, where the user enters their credentials.

**_Figure 7-2_** _- Fake Login Page_

![[Pasted image 20240617081524.png]]

Example 7-7 shows how the attacking system harvests the user credentials. The username entered is _santosomar_, and the password is _superbadpassword_. You can also see the session token.

**_Example 7-7_** _-_ _Harvesting the User Credentials_

![[Pasted image 20240617081618.png]]

Attackers have been known to harvest cloud service provider credentials once they get into their victims’ systems. Different threat actors have extended their credential harvesting capabilities to target multiple cloud and non-cloud services in victims’ internal networks and systems after the exploitation of other vulnerabilities.

---

Practice - Credential Harvesting

**Q.** Pixel Paradise currently only requires gamers to login with a username and password. This type of login is very susceptible to phishing attacks that attempt to redirect gamers to a fake website. Which tool best helps mitigate this type of credential harvesting?

**A.** Multi-factor authentication requires a password and biometric input (fingerprint, retinal scan) or a code entered via a personal cell phone. The biometric data or the cell phone code is hard for attackers to obtain.

