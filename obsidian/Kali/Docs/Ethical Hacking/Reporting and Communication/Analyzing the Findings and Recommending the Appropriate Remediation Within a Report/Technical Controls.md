**_Technical controls_** make use of technology to reduce vulnerabilities. The following are examples of technical controls that can be recommended as mitigations and remediation of the vulnerabilities found during a pen test. Select each technical control for more information.

![[Pasted image 20240619072731.png]]

System hardening involves applying security best practices, patches, and other configurations to remediate or mitigate the vulnerabilities found in systems and applications. The system hardening process includes closing unnecessary open ports and services, removing unnecessary software, and disabling unused ports.

![[Pasted image 20240619072855.png]]

In Module 6, “Exploiting Application-Based Vulnerabilities,” you learned that SQL injection is best prevented through the use of parameterized queries. You also learned about several other input validation vulnerabilities. The use of input validation (sanitizing user input) best practices is recommended to mitigate and prevent vulnerabilities such as cross-site scripting, cross-site request forgery, SQL injection, command injection, XML external entities, and other vulnerabilities explained in Module 6. OWASP provides several cheat sheets and detailed guidance on how to prevent these vulnerabilities; see [_https://cheatsheetseries.owasp.org/cheatsheets/Input_Validation_Cheat_Sheet.html_](https://cheatsheetseries.owasp.org/cheatsheets/Input_Validation_Cheat_Sheet.html) and [_https://cheatsheetseries.owasp.org/cheatsheets/Query_Parameterization_Cheat_Sheet.html_](https://cheatsheetseries.owasp.org/cheatsheets/Query_Parameterization_Cheat_Sheet.html).

![[Pasted image 20240619072930.png]]

Multifactor authentication (MFA) is authentication that requires two or more factors. Multilayer authentication requires that two or more of the same type of factors be presented. Data classification, regulatory requirements, the impact of unauthorized access, and the likelihood of a threat being exercised should all be considered when you’re deciding on the level of authentication required. The more factors, the more robust the authentication process. In response to password insecurity, many organizations have deployed multifactor authentication options to their users. With multifactor authentication, accounts are protected by something you know (password) and something you have (one-time verification code provided to you). Even gamers have been protecting their accounts using MFA for years.

**TIP** Let’s take a look at this in practice: Jeannette inserts her bank card into an ATM and enters her PIN. What examples of multifactor authentication has she exhibited? An ATM provides a good example of MFA because it requires both “something you have” (your ATM card) and “something you know” (your PIN). Another possible factor in MFA is “something you are,” which can be based on biometrics such as fingerprints, retinal patterns, and hand geometry. Yet another factor is “somewhere you are,” such as authenticating to a specific network in a specific geographic area or boundary using geofencing or GPS.

![[Pasted image 20240619073218.png]]

You should always encrypt passwords, tokens, API credentials, and similar authentication data.

![[Pasted image 20240619073241.png]]

It is important to protect operating system (for example, Linux, Windows, iOS, Android) processes and make sure an attacker has not created or manipulated any processes in the underlying system.

![[Pasted image 20240619073317.png]]

Patch management is the process of distributing, installing, and applying software updates. A patch management policy lists guidelines for proper management of vulnerabilities and includes phases such as testing, deploying, and documenting the security patches applied to your organization.

![[Pasted image 20240619073416.png]]

It is important to have and use a process for retiring an encryption key and replacing it by generating a new cryptographic key. Rotating keys at regular intervals allows you to reduce the attack surface and meet industry standards and compliance.

![[Pasted image 20240619073501.png]]

It is important to enroll, generate, manage, and revoke digital certificates in a secure manner.

![[Pasted image 20240619073524.png]]

You can take advantage of a number of tools and techniques to manage authentication credentials (secrets). These secrets include passwords, API keys, and tokens used in applications, services, and specialized systems. Employing a good secrets management solution enables you to eliminate hard-coded credentials, enforce password best practices (or eliminate passwords with other types of authentication), perform credential use monitoring, and extend secrets management to third parties in a secure manner. Examples of secrets management solutions offered by cloud providers include AWS Secrets Manager ([_https://aws.amazon.com/secrets-manager_](https://aws.amazon.com/secrets-manager)) and Google Cloud Secret Manager ([_https://cloud.google.com/secret-manager_](https://cloud.google.com/secret-manager)).

![[Pasted image 20240619073623.png]]

Segmenting a network may involve using a combination of technologies such as firewalls, VLANs, access control lists in routers, and other techniques. For decades, servers were assigned subnets and VLANs. Sounds pretty simple, right? Well, it introduced a lot of complexities because application segmentation and policies were physically restricted to the boundaries of the VLAN within the same data center (or even in the campus). In virtual environments, the problem became bigger. Today applications can move around between servers to balance loads for performance or high availability upon failures. They can also move between different data centers and even different cloud environments.

