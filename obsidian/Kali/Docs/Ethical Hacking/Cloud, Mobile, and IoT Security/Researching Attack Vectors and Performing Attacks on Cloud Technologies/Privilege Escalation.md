**_Privilege escalation_** is the act of exploiting a bug or design flaw in a software or firmware application to gain access to resources that normally would have been protected from an application or a user. This results in a user gaining additional privileges beyond what the application developer originally intended (for example, a regular user gaining administrative control or a particular user being able to read another user’s email without authorization).

The original developer does not intend for the attacker to gain higher levels of access but probably doesn’t enforce a need-to-know policy properly and/or hasn’t validated the code of the application appropriately. Attackers take advantage of this to gain access to protected areas of operating systems or to applications (for example, reading another user’s email without authorization). Buffer overflows are used on Windows computers to elevate privileges as well. To bypass digital rights management (DRM) on games and music, attackers use a method known as _jailbreaking_, which is another type of privilege escalation, most commonly found on Apple iOS-based mobile devices. Malware also attempts to exploit privilege escalation vulnerabilities, if any exist on the system. Privilege escalation can also be attempted on network devices. Generally, the fix for this is simply to update the device and to check for updates on a regular basis.

The following are a couple different types of privilege escalation:

![[Pasted image 20240617081904.png]]

This type of privilege escalation, also called privilege elevation, occurs when a lower-privileged user accesses functions reserved for higher-privileged users (for example, a standard user accessing functions of an administrator). To protect against this situation, you should update the network device firmware. In the case of an operating system, it should again be updated. The use of some type of access control system – for example, User Account Control (UAC)–is also advisable.

![[Pasted image 20240617081918.png]]

This type of privilege escalation occurs when a normal user accesses functions or content reserved for other normal users (for example, one user reading another’s email). This can be done through hacking or by a person walking over to someone else’s computer and simply reading their email. Always have your users lock their computer (or log off) when they are not physically at their desk.

