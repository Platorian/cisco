What Did I Learn in this Module?

> **Pretexting for an Approach and Impersonation**

Social engineering involves influence, interrogation, and impersonation to gain information from victims without directly asking for it. Interrogators use open-ended and closed-ended questions to understand a victim's values, viewpoints, and goals. They also pay close attention to a victim's body language and speech patterns to gather more information.

Pretexting, or impersonation, is when an attacker poses as someone else to gain access to information. Examples include impersonating a delivery person or an IT support worker. Pharming is a type of impersonation attack where a victim is redirected from a valid website to a malicious one to extract confidential information or install malware. This can be done by altering the host file on a victim's system, through DNS poisoning, or by exploiting a vulnerability in a DNS server. Malvertising is another similar attack, which involves incorporating malicious ads on trusted websites, leading users to sites hosting malware.

> **Social Engineering Attacks**

Social engineering attacks exploit human vulnerabilities to gain access to sensitive information or systems. These attacks can take many forms, including email phishing, spear phishing, whaling, vishing, SMS phishing, USB drop key attacks, and watering hole attacks. Email phishing involves sending a fraudulent email that appears legitimate, while spear phishing is a targeted phishing attack. Whaling targets high-profile business executives, while vishing is a phishing attack carried out over the phone. SMS phishing uses text messages to trick victims into divulging sensitive information. USB drop key attacks involve leaving USB sticks in strategic locations to encourage victims to plug them in. Watering hole attacks involve injecting malicious code into a website to redirect users to an attacker-controlled site. Organizations can protect themselves from these attacks by developing policies, updating security applications, scanning websites for malware, and educating users.

> **Physical Attacks**

Types of physical attacks in the context of penetration testing or red teaming include:

- **Tailgating and Piggybacking**: Unauthorized persons gain access to restricted areas by tagging along with authorized personnel. Access control vestibules and multifactor authentication can help prevent these attacks.
- **Dumpster Diving**: Scavenging through garbage and recycling containers for private information. Organizations should securely store and dispose of sensitive documents to protect against this threat.
- **Shoulder Surfing**: Obtaining confidential data by looking over a victim's shoulder or using cameras or telescopes. User awareness, training, and screen filters can help prevent these attacks.
- **Badge Cloning**: Attackers use specialized software and hardware, or social engineering techniques, to duplicate or impersonate access badges.

> **Social Engineering Tools**

Tools used in social engineering attacks include:

- **The Social-Engineer Toolkit (SET)**: Developed by David Kennedy, SET is a tool for launching social engineering attacks and integrating with third-party tools like Metasploit. It comes pre-installed in Kali Linux and Parrot Security but can also be installed on other Linux distributions and macOS. This topic outlines a step-by-step process for creating a spear-phishing email using SET, including launching the toolkit, selecting attack vectors, creating a file format payload, generating a PDF with embedded EXE, setting up a reverse TCP shell, crafting the email, and setting up a listener for a reverse TCP connection.
- **Browser Exploitation Framework (BeEF)**: This tool manipulates users by leveraging XSS vulnerabilities. It starts a web service on port 3000. Attackers can use the web console to manipulate victims of XSS attacks. BeEF can be used to perform various attacks, including social engineering attacks like sending fake notifications to a victim's browser.
- **Call Spoofing Tools**: These tools allow attackers to change the caller ID information displayed on a phone. Examples include SpoofApp, SpoofCard (which can also change voice, record calls, generate background noises, and send calls to voicemail), and Asterisk (a VoIP management tool that can impersonate caller ID).

> **Methods of Influence**

The following are key methods of influence used by social engineers:

- **Authority**: Social engineers display confidence and authority to manipulate others.
- **Scarcity and urgency**: Social engineers create a sense of urgency using scarcity, often using specific language to heighten urgency.
- **Social proof**: Social engineers exploit situations where individuals are unsure of the appropriate behavior. For example, you might see others acting or doing something in a certain way and might assume that it is appropriate. Social engineers who use social proof can often manipulate multiple people at once.
- **Likeness**: Social engineers strive to be likable, taking advantage of human vulnerabilities to influence their victims.
- **Fear**: Social engineers use fear to force victims to act quickly, avoiding or rectifying a perceived dangerous situation.

---

Reflection Questions

Social engineering is a serious problem. Some of the largest data breaches in history began with information and access gathered through social engineering attacks.

A successful social engineering attack starts with a good story. What do you think this means? What is the most common type of social engineering attack?

When thinking of cybersecurity, few people think about physical attacks. What measures are necessary to prevent physical attacks and why can they be so devastating?

There are many types of tools that can be used for social engineering and browser hacking. What is the value of the Social-Engineer Toolkit (SET) and Browser Exploitation Framework (BeEF) when conducting penetration tests?

An effective social engineer has a good understanding of human psychology and motivation. Why is this knowledge necessary?

