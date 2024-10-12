**Protego Security Solutions**

Our job as ethical hackers is to assess the vulnerability to cyberattack that exists in our clients’ organization, networks, digital assets, and applications. In order to do this, we often use tools and methods that are available to criminal hackers.

To effectively pose as hackers, we must be familiar with hacker tactics, techniques, and procedures, including the tools that they use. You will learn about different types of cyberattacks and use hacker tools to carry out simulated attacks. Kali has some amazing tools. This will be fun!

---

Cyber attacks and exploits are occurring more and more frequently all the time. You have to understand threat actors’ tactics in order to mimic them and become a better penetration tester. This module covers the most common types of attacks and exploits. It starts by describing attacks against the weakest link, which is the human element. These attacks are called _social engineering attacks_. Social engineering has been the initial attack vector of many breaches and compromises in the past several years. In this module, you will learn about various social engineering attacks, such as phishing, vishing, pharming, spear phishing, whaling, and others. You will also learn about social engineering techniques such as elicitation, interrogation, and impersonation, as well as different motivation techniques (or _methods of influence_). You will also learn what shoulder surfing is and how attackers have used the “USB key drop” trick to fool users into installing malware and compromising their systems.

![[Pasted image 20240621110754.png]]

---

**Protego Security Solutions**

I am sure you are familiar with the idea that people are the weakest link in cybersecurity. Unfortunately, it is relatively easy to fool employees by pretending to be a known and trusted individual or by using a false story. People will give up a surprising amount of privileged information or will download malware that can cause great damage. Sometimes, it only takes one click to download malware that can affect an entire organization, causing great losses.

At Protego, if the scope of our engagement permits, we conduct social engineering attacks to assess the level of cybersecurity awareness of our customers' employees. Sometimes we will use the results of those attacks to further penetrate the network in order to illustrate to our customer the seriousness of vulnerabilities. For mitigation, we recommend comprehensive cybersecurity awareness training and periodic testing of employees' awareness through simulated social engineering attacks.

---

nfluence, interrogation, and impersonation are key components of social engineering. _Elicitation_ is the act of gaining knowledge or information from people. In most cases, an attacker gets information from a victim without directly asking for that particular information.

How an attacker _interrogates_ and interacts with a victim is crucial for the success of a social engineering campaign. An interrogator can ask good open-ended questions to learn about an individual’s viewpoints, values, and goals. The interrogator can then use any information the target revealed to continue to gather additional information or to obtain information from another victim.

It is also possible for an interrogator to use closed-ended questions to get more control of the conversation and to lead the conversation or to actually stop the conversation. Asking too many questions can cause the victim to shut down the interaction, and asking too few questions may seem awkward. Successful social engineering interrogators use a narrowing approach in their questioning to gain as much information as possible from the victim.

Interrogators pay close attention to the following:

- The victim’s posture or body language
- The color of the victim’s skin, such as the face color becoming pale or red
- The direction of the victim’s head and eyes
- Movement of the victim’s hands and feet
- The victim’s mouth and lip expressions
- The pitch and rate of the victim’s voice, as well as changes in the voice
- The victim’s words, including their length, the number of syllables, dysfunctions, and pauses

With **_pretexting_**, or **_impersonation_**, an attacker presents as someone else in order to gain access to information. In some cases, it can be very simple, such as quickly pretending to be someone else within an organization; in other cases, it can involve creating a whole new identity and then using that identity to manipulate the receipt of information. Social engineers may use pretexting to impersonate individuals in certain jobs and roles even if they do not have experience in those jobs or roles.

For example, a social engineer may impersonate a delivery person from Amazon, UPS, or FedEx or even a bicycle messenger or courier with an important message for someone in the organization. As another example, someone might impersonate an IT support worker and provide unsolicited help to a user. Impersonating IT staff can be very effective because if you ask someone if he or she has a technical problem, it is quite likely that the victim will think about it and say something like, “Yes, as a matter of fact, yesterday this weird thing happened to my computer.” Impersonating IT staff can give an attacker physical access to systems in an organization. An attacker who has physical access can use a USB stick containing custom scripts to compromise a computer in seconds. _Pharming_ is a type of impersonation attack in which a threat actor redirects a victim from a valid website or resource to a malicious one that could be made to appear as the valid site to the user. From there, an attempt is made to extract confidential information from the user or to install malware in the victim’s system. Pharming can be done by altering the host file on a victim’s system, through DNS poisoning, or by exploiting a vulnerability in a DNS server. Figure 4-1 illustrates how pharming works.

The following steps are illustrated in Figure 4-1:

**Step 1** **_._** The user (Omar) visits a legitimate website and clicks on a legitimate link.

**Step 2** **_._** Omar’s system is compromised, the host file is modified, and Omar is redirected to a malicious site that appears to be legitimate. (This could also be accomplished by compromising a DNS server or spoofing a DNS reply.)

**Step 3** **_._** Malware is downloaded and installed on Omar’s system.

An attack that is similar to pharming is called _malvertising_. Malvertising involves incorporating malicious ads on trusted websites. Users who click these ads are inadvertently redirected to sites hosting malware.

![[Pasted image 20240621110912.png]]

**TIP** To help prevent pharming attacks, it is important to keep software up to date and run regular anti-malware checks. You should also change the default passwords in network infrastructure devices (including your home router). Of course, you also need to be aware of what websites you visit and be careful about opening emails.

---

Practice - Pretexting and Impersonation

## 1.

You are creating a social engineering campaign that targets a penetration testing client for Protego. You are working on a business email compromise (BEC) in which you create a false identity that appears to be an employee of a partner company. You have spoofed the source email address and copied graphical aspects of the emails that you will send to make them look like they come from the legitimate company. Once you have established communication with the client, you will request sensitive information about the client's financial accounts. What type of attack are you creating?

**Pretexting, or impersonation, is an attack where an attacker presents as someone else to gain access to information. Sometimes, it can be very simple, such as quickly pretending to be someone else within an organization; in other cases, it can involve creating a whole new identity and then using that identity to request sensitive information.**

## 2.

You have been asked to set up an attack as part of a penetration testing engagement for Protego. It involves an attack in which you follow this process (as shown in the figure). In step 1, an employee of the client enters the URL of a frequently used website. In step 2, because you have previously compromised the employee's system and altered the hosts file with a false mapping of IP address to URL, the employee is redirected to a malicious site that you cloned from the legitimate website. In step 3, malware is downloaded and installed on the employee's system.

What type of attack have you been asked to create?

![[Pasted image 20240621111123.png]]

**Pharming is a type of impersonation attack in which a threat actor redirects a victim from a valid website or resource to a malicious one that is a clone of the valid site. This can occur due to an altered hosts file or some sort of DNS manipulation. From there, an attempt is made to extract confidential information from the user or install the malware in the victim's system.**

