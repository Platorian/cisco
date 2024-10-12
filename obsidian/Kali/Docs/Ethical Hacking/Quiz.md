Welcome to the **Ethical Hacker Self-Paced Final Exam.**  
  
There are **50 questions** in total. You must achieve **70% to pass this exam**.  
  
Items on this exam support the following networking skills.  

- Explain the importance of methodological ethical hacking and penetration testing.
- Create penetration testing preliminary documents.
- Perform information gathering and vulnerability scanning activities.
- Explain how social engineering attacks succeed.
- Explain how to exploit wired and wireless network vulnerabilities.
- Explain how to exploit application-based vulnerabilities.
- Explain how to exploit cloud, mobile, and IoT security vulnerabilities.
- Explain how to perform post exploitation activities.
- Create a penetration testing report.
- Classify pentesting tools by use case.

---

**Q.** Which are two best practices used to secure APIs? (Choose two.)

**A.** The following are several general best practices and recommendations for securing APIs:  

- Secure API services to provide HTTPS endpoints with only a strong version of TLS.
- Validate parameters in the application and sanitize incoming data from API clients.
- Explicitly scan for common attack signatures; injection attacks often betray themselves by following common patterns.
- Use strong authentication and authorization standards.
- Use reputable and standard libraries to create the APIs.
- Segment API implementation and API security into distinct tiers; doing so frees up the API developer to focus completely on the application domain.
- Identify what data should be publicly available and what information is sensitive.
- If possible, have a security expert do the API code verification.
- Make internal API documentation mandatory.
- Avoid discussing company API development (or any other application development) on a public forum.

---

**Q.** Which type of threat actors use cybercrime attacks to promote what they believe in?

**A.** Hacktivists are types of threat actors not motivated by money. Hacktivists are looking to make a point or to promote what they believe, using cybercrime as a method of attack. These types of attacks are often carried out by stealing sensitive data and then revealing it to the public to embarrass or financially affect a target.

---

**Q.** company conducted a penetration test 6 months ago. However, they have acquired new firewalls and servers to strengthen the network and increase capacity. Why would an administrator request a new penetration test?

**A.** Implementing a firewall, an IPS, anti-malware, a VPN, a web application firewall (WAF), and other modern security defenses is not enough. The validity of these defensive techniques needs to be tested regularly. As networks and systems change, the attack surface can vary as well, and when it does, the reevaluation of the security posture must be conducted by way of a penetration test.

---

**Q.** A network administrator performs a penetration test for a company that sells computer parts through an online storefront. The first step is to discover who owns the domain name that the company is using. Which penetration testing tool can be used to do this?

**A.** The **whois** command can gather information about who owns a particular domain from public records.

---

**Q.** A penetration tester wants to quickly discover all the live hosts on the 192.168.0.0/24 network. Which command can do the ping sweep using the nmap tool?

**A.** The command **nmap -sn 192.168.0.0/24** is used to do a ping sweep of the 192.168.0.0/24 network for active hosts. This basic host discovery scan can be performed to determine what devices on a network are live. Such a scan for host discovery of an entire subnet is sometimes called a ping sweep.

---

**Q.** A penetration tester runs the command **nmap -sF -p 80 192.168.1.1** against a Windows host and receives a response RST packet. What conclusion can be drawn on the status of port 80?

**A.** A TCP FIN scan is not useful when scanning Windows-based systems, as they respond with RST packets, regardless of the port state. The normal implication of an RST message would indicate a closed port. Since this is a Windows-based system, it will always respond with an RST message regardless of the port state.

---

**Q.** Which common tool is used by penetration testers to craft packets?

**A.** Scapy is a very comprehensive Python-based framework or ecosystem for packet generation. Scapy must be run with root permissions to be able to modify packets.

---

**Q.** Why should a tester use query throttling techniques when running an authorized penetration test on a live network?

**A.** To work around the issue of bandwidth limitations and vulnerability scanning, slowing down the traffic created by the scanner can help. This is often referred to as query throttling, and it can typically be achieved by modifying the options of the scanning policy. One way to do this is to reduce the number of attack threads being sent to the target simultaneously.

---

**Q.** Why would an organization hire a red team?

**A.** A read team is a group of cybersecurity experts and penetration testers hired by an organization to mimic a real threat actor by exposing vulnerabilities and risks regarding technology, people, and physical security.

---

**Q.** Match the healthcare sector term to the respective description.

**A.** 
![[Pasted image 20240621124626.png]]

---

**Q.** Which two elements are typically on the front of a credit card? (Choose two.)

**A.** The typical elements on the front of a credit card are an embedded microchip, PAN (primary account number), expiration date, and cardholder name. The typical elements on the back of a credit card are magnetic stripe and CAV2/CID/CVC2/CVV2, abbreviations for card security codes for the different payment brands.

---

**Q.** What can be used to document the testing timeline in a rules of engagement document?

**A.** Gantt charts and work breakdown structures (WBS) can be used to demonstrate and document the testing timeline, an element of a rules of engagement document. Burp Suite and OWASP ZAP are tools to intercept communications between a browser and a web server. Recon-ng is a tool for passive reconnaissance.

---

**Q.** A cybersecurity firm has been hired by an organization to perform penetration tests. The tests require a secure method of transferring data over a network. Which two protocols could be used to accomplish this task? (Choose two.)

**A.** Protocols such as Secure Copy Protocol (SCP) or Secure File Transfer Protocol (SFTP) can be used by penetration testers to transfer files securely over the network. Pretty Good Privacy (PGP) keys or Secure/Multipurpose Internet Mail Extensions (S/MIME) keys can be used for encrypted email exchanges. Hypertext Transfer Protocol Secure (HTTPS) is the secure version of HTTP that provides secure communication between web browsers and web servers.

---

**Q.** Match penetration testing methodology and standard with the respective description.

**A.** ![[Pasted image 20240622054330.png]]

---

**Q.** Which three practices are commonly adopted when setting up a penetration testing lab environment? (Choose three.)

**A.** The following is a list of requirements for a typical penetration testing environment:  

- Closed network: Ensure controlled access to and from the lab environment and restricted access to the Internet.
- Virtualized computing environment: This allows for easy deployment and recovery of devices being tested.
- Realistic environment: Using a staging testing environment should match the real environment as closely as possible.
- Health monitoring: When something crashes, ensure the ability to determine how and why it happened.
- Sufficient hardware resources: Ensure that a lack of resources does not cause false results.
- Multiple operating systems: Test or validate a finding from another system. Testing from different operating systems is always good to see if the results differ.
- Duplicate tools: A great way to validate a finding is to run the same test with a different tool to see if the results are the same.
- Practice targets: Practice the penetration tools constantly. To do this, practice on targets that are known to be vulnerable.

---

**Q.** An organization wants to test its vulnerability to an employee with network privileges accessing the network maliciously. Which type of penetration test should be used to test this vulnerability?

**A.** Gray-box penetration testing is when the test is run from within the internal network. Because most compromises start at the client and work their way throughout the network, a good approach would be a scope where the testers start inside the network and have access to a client machine. Then they could pivot throughout the network to determine the impact of a compromise. Gray-box testing is done in a partially known environment.  
In black-box penetration testing, the tester is typically provided only limited information. (Unknown-environment testing.)  
In white-box penetration testing, the tester starts with significant information about the organization and its infrastructure. (Totally known environment.)  
The blue-box penetration testing is a box containing equipment for field quality testing and screening, with visual and written instructions for the users. CYBRI developed its own penetration testing services technology, called Blue-Box, which helps businesses and experts stay on the same page when it comes to testing, security controls, and security services.

---

**Q.** Refer to the exhibit. A penetration is being prepared to run the EternalBlue exploit using Metasploit against a target with an IP address of 10.0.0.1/8 from the source PC with an IP address of 10.0.0.111/8. What two commands must be entered before the **exploit** command can be run? (Choose two.)
![[Pasted image 20240622055154.png]]


**A.** The following commands have to be entered to identify the local host and the remote host before the **exploit** command can be executed:  
msf exploit(windows/smb/ms17_010_eternalblue) > **set RHOST 10.0.0.1**  
msf exploit(windows/smb/ms17_010_eternalblue) > **set LHOST 10.0.0.111**  
msf exploit(ms17_010_eternalblue) > **exploit**

---

**Q.** A penetration tester runs the Nmap NSE script **nmap --script smtp-open-relay.nse 10.0.0.1** command on a Kali Linux PC. What is the purpose of running this script?

**A.** SMTP open relay is the term used for an email server that accepts and relays (that is, sends) emails from any user. The script **nmap --script smtp-open-relay.nse 10.0.0.1** is an Nmap NSEscript to test for open relay configurations on the target server.

---

**Q.** Refer to the exhibit. What is the penetration tester trying to achieve by running this exploit?
![[Pasted image 20240622055346.png]]

**A.** FTP Anonymous Login Verification can be done using the Metasploit script command:  
**use auxiliary/scanner/ftp/anonymous.** The output displays that the FTP server is configured for anonymous login.

---

**Q.** A penetration tester deploys a rogue AP in the target wireless infrastructure. What is the first step that has to be taken to force wireless clients to connect to the rogue AP?

**A.** An attacker can cause legitimate wireless clients to deauthenticate from legitimate wireless APs or wireless routers to try to make those clients connect to the rogue AP by reassociating.

---

**Q.** A cybersecurity student is learning about the Social-Engineer Toolkit (SET), and the student has discovered that this tool can be used to launch various social engineering attacks. Which two social engineering attacks can be launched using SET?

**A.** The Social-Engineer Toolkit (SET) is a tool that can be used to launch numerous social engineering attacks, such as infectious media generators, and create a payload and listener. Google phishing, simple hijacker, and fake flash update are social engineering attacks performed by Browser Exploitation Framework (BeEF) tool. BeEF is a tool that can manipulate users by leveraging XSX vulnerabilities.

---

**Q.** A threat actor spoofed the phone number of the director of HR and called the IT help desk with a login problem. The threat actor claims to be the director and wants the help desk to change the password. What method of influence is this cybercriminal using?

**A.** Social engineers use several motivation techniques/methods of influence. In this scenario, a social engineer explores the principle that a person tends to comply with people in positions of authority, such as doctors, lawyers, and experts in different fields. This is the authority method of influence.

---

**Q.** Which statement correctly describes a type of physical social engineering attack?

**A.** There are various types of physical attacks. Both piggybacking and tailgating can be defeated through the use of access control vestibules, and it is often used in conjunction with multifactor authentication. Turnstiles, double entry doors, and security guards can also eliminate piggybacking and tailgating. With dumpster diving, a person (threat actor) scavenges for victims' private information in garbage and recycling containers. In badge cloning attacks, specialized software, hardware, and social engineering techniques can be used to perform such attacks. With shoulder surfing, someone obtains information such as personally identifiable information, passwords, and other confidential data by looking not only over the shoulder of the victim. It is also possible to carry out this type of attack from far away using binoculars or even a telescope.

---

**Q.** What is a characteristic of a pharming attack?

**A.** Pharming is an impersonation attack in which a threat actor redirects a victim from a valid website or resource to a malicious one that could be made to appear as a valid site to the user. From there, an attempt is made to extract confidential information from the user or install malware on the system of the victim.

---

**Q.** What kind of social engineering attack can be prevented by developing policies such as updating anti-malware applications regularly and using secure virtual browsers with little connectivity to the rest of the system and the rest of the network?

**A.** A watering hole attack is a targeted attack that occurs when an attacker profiles websites that the intended victim accesses. The attacker then scans those websites for possible vulnerabilities. Organizations should therefore develop policies to prevent these attacks. Such a policy requires updating anti-malware applications regularly and using secure virtual browsers with little connectivity to the rest of the system and the rest of the network.

---

**Q.** An attacker enters the string **‘John’ or ‘1=1’** on a web form that is connected to a back-end SQL server causing the server to display all records in the database table. Which type of SQL injection attack was used in this scenario?

**A.** Since the string ‘1=1’ is always true, the search string serves as a Boolean value of TRUE, causing the database system to display all records.

---

**Q.** What are two examples of immutable queries that should be used as mitigation for SQL injection vulnerabilities? (Choose two.)

**A.** The best mitigation for SQL injection vulnerabilities is to use immutable queries, including:  

- Static queries
- Parameterized queries
- Stored procedures (if they do not generate dynamic SQL)

---

**Q.** An attacker enters the string **192.168.78.6;cat /etc/httpd/httpd.conf** on a web application hosted on a Linux server. Which type of attack occurred?

**A.** A command injection is an attack in which an attacker tries to execute OS commands that the attacker is not supposed to be able to execute on a system. In this case, the attacker tries to view the web server (httpd) configuration information.

---

**Q.** Which two misconfigured cloud authentication methods could leverage a cloud asset? (Choose two.)

**A.** Attackers can leverage misconfigured cloud assets in several ways, including the following:  

- Misconfigured identity and access management (IAM) implementations
- Federation misconfigurations

---

**Q.** Match the cloud attack to the description.

**A.** 
![[Pasted image 20240622060539.png]]

---

**Q.** What is the purpose of using the **smtp-user-enum -M VRFY -u snp -t 10.0.0.1** command in Kali Linux?

**A.** The **smtp-user-enum -M VRFY -u snp -t 10.0.0.1** command is used to verify whether the user snp exists on the smtp server 10.0.0.1.

---

**Q.** Match the mobile device security testing tool to the description.

**A.** 
![[Pasted image 20240622060711.png]]

---

**Q.** Match the mobile device attack to the description.

**A.** ![[Pasted image 20240622060820.png]]

---

**Q.** Which two Bluetooth Low Energy (BLE) statements are true? (Choose two.)

**A.** Threat actors can listen to BLE advertisements and leverage misconfigurations. You can analyze protocols such as BLE by using specialized antennas and equipment. Many devices that support BLE do not even implement BLE-layer encryption. BLE involves a three-phase process to establish a connection. BLE pairing is done at the operating system level.

---

**Q.** Match the insecure code practice to the description.

**A.** 
![[Pasted image 20240622061054.png]]

---

**Q.** Which C2 utility can be used to create multiple reverse shells?

**A.** Many different techniques and utilities can be used to create a C2. Some examples are the following: 
- socat - a C2 utility that can be used to create multiple reverse shells
- wsc2 - a Python-based C2 utility that uses WebSockets
- WMImplant - a PowerShell-based tool that leverages WMI to create a C2 channel
- TrevorC2 - a Python-based C2 utility

---

**Q.** Refer to the exhibit. The attacking system has a listener (port open), and the victim initiates a connection back to the attacking system. Which two resources can create this type of malicious activity? (Choose two.)
![[Pasted image 20240622061332.png]]

**A.** The malicious activity described in the scenario is a reverse shell. Many tools allow the creation of reverse shells from a compromised host. Some of the most popular ones are the Meterpreter module in Metasploit and Netcat. Empire is an open-source framework with PowerShell Windows and Python Linux agents that allows rapid deployment of post-exploitation modules, including keyloggers, bind shells, reverse shells, Mimikatz, and adaptable communication to evade detection.

---

**Q.** Match the PowerSploit module/script to the respective description.

**A.** ![[Pasted image 20240622061458.png]]

---

**Q.** Which two tools can create a remote connection with a compromised system? (Choose two.)

**A.** After a system is compromised, basic port scans can identify systems or services of interest that can be further attacked to compromise valuable information. Remote access protocols can be used to communicate with a compromised system. Metasploit can be used to create an RDP connection. Using the Metasploit RDP Post-Exploitation Module enables RDP. It provides options to create and configure an account as a member of the Local Administrators and Remote Desktop Users group. Sysinternals is a suite of tools that can also communicate with a compromised system. It allows administrators to control Windows-based computers from a remote terminal.

---

**Q.** Which two options are PowerSploit modules/scripts? (Choose two.)

**A.** PowerSploit is a collection of PowerShell modules that can be used for post-exploitation and other phases of an assessment. Some popular PowerSploit modules and scripts are Get-SecurityPackages (enumerates all loaded security packages) and Get-Keystrokes (logs keys pressed, time, and the active window). PowerShell can be used for post-exploitation tasks, such as getting directory listings, copying and moving files, getting a list of running processes, and performing administrative tasks. Some of the most useful PowerShell commands are GetChildItem (list directories), GetProcess (gets a process listing), and Get-HotFix (obtains a list of all installed hotfixes).

---

**Q.** Why is it important to use Common Vulnerability Scoring System (CVSS) to reference the ratings of vulnerabilities identified when preparing the final penetration testing report?

**A.** In a typical final report, the section Findings should document technical details about whether or how the system under testing and related components may be exploited based on each vulnerability found. Using industry-accepted risk ratings for each vulnerability is a good idea, such as the Common Vulnerability Scoring System (CVSS). CVSS has been adopted by many tools, vendors, and organizations. Using an industry standard such as CVSS will increase the value of the final report.

---

**Q.** A company hires a professional to perform penetration testing. The tester has identified and verified that one web application is vulnerable to SQL injection and cross-site scripting attacks. Which technical control measure should the tester recommend to the company?

**A.** Parameterized queries best prevent SQL injection. Using input validation (sanitizing user input) best practices is recommended to mitigate and prevent vulnerabilities such as cross-site scripting, cross-site request forgery, SQL injection, command injection, XML external entities, and other vulnerabilities.

---

**Q.** The IT security department of a company has developed an access policy for the datacenter. The policy specifies that the datacenter is locked between 5:30 pm through 7:45 am daily except for emergency access approved by the IT manager. What is the operational control implemented?

**A.** With the time-of-day restrictions policy, the company can restrict user access based on the time of the day.

---

**Q.** A security audit for a company recommends that the company implement multifactor authentication for the datacenter access. Which solution would achieve the goal?

**A.** Biometric controls include fingerprint scanning, retinal scanning, and face recognition. Together with a strong password, biometric control can provide effective multifactor authentication.

---

**Q.** What are three examples of the items a penetration tester must clean from systems as part of the post-engagement cleanup process? (Choose three.)

**A.** When a tester has completed all the testing phases for a penetration test, It is very important to perform the post-engagement cleanup. Having the client or system owner validate that the cleanup efforts are sufficient is also very important. This is not always easy to accomplish, but providing a comprehensive list of activities performed on any systems under test will help.  
  
Examples of the items that a tester will want to be sure to clean from systems include:  

- **Tester-created credentials**: Remove any user accounts you created to maintain persistent access or for any other post-exploitation activity.
- **Shells**: Remove shells spawned on exploited systems.
- **Tools**: Remove any tools installed or run from the systems under test.

---

**Q.** Refer to the exhibit. Which Python data structure is used?
![[Pasted image 20240622062225.png]]

**A.** A dictionary is a collection of data values that are ordered using a key/value pair.

---

**Q.** Which statement describes the concept of Bash shell in operating systems?

**A.** Bash shell is a command shell and language interpreter available for operating systems such as Linux, macOS, and Windows. It allows for interactive or non-interactive command execution.

---

**Q.** Which three tools can be used to perform passive reconnaissance? (Choose three.)

**A.** Nslookup, Host, and Dig are DNS-based tools that can be used to perform passive reconnaissance. Nmap, Zenmap, and Enum4linux are active reconnaissance tools.

---

**Q.** An attacker uses John the Ripper to crack a password file. The attacker issued the **~$ john --list=formats** command in Kali Linux. Which information is the attacker trying to find?

**A.** John the Ripper is a popular tool for offline password cracking. John the Ripper can use search patterns and password files (or wordlists) to crack passwords. It supports different cracking modes and understands many ciphertext formats. To list the supported formats, the attacker can use the **john --list=formats** command.

---

**Q.** What are two exploitation frameworks? (Choose two.)

**A.** Metasploit is a popular exploitation framework. Metasploit is installed in /usr/share/metasploit-framework by default in Kali Linux. BeEF is an exploitation framework for web application testing. Tor, Proxychains, and Encryption are tools for evasion.

---

**Q.**

**A.** 

---

**Q.**

**A.** 

---

**Q.**

**A.** 

---

**Q.**

**A.** 

---

**Q.**

**A.** 

---








