Attackers use various techniques to compromise mobile devices. Select each of these common mobile device attacks for more information.

**Reverse Engineering***

The process of analyzing the compiled mobile app to extract information about its source code could be used to understand the underlying architecture of a mobile application and potentially manipulate the mobile device. Attackers use reverse engineering techniques to compromise the mobile device operating system (for example, Android, Apple iOS) and root or jailbreak mobile devices.

**NOTE** OWASP has different “crack-me” exercises that help you practice reverse engineering of Android and iOS applications. See [_https://github.com/OWASP/owasp-mstg/tree/master/Crackmes_](https://github.com/OWASP/owasp-mstg/tree/master/Crackmes).

**Sandbox Analysis***

iOS and Android apps are isolated from each other via sandbox environments. Sandboxes in mobile devices are a mandatory access control mechanism describing the resources that a mobile app can and can’t access. Android and iOS provide different interprocess communication (IPC) options for mobile applications to communicate with the underlying operating system. An attacker could perform detailed analysis of the sandbox implementation in a mobile device to potentially bypass the access control mechanisms implemented by Google (Android) or Apple (iOS), as well as mobile app developers.

**Spamming***

Unsolicited messages are a problem with email and with text messages and other mobile messaging applications as well. In Module 4, you learned about SMS phishing attacks, which continue to be some of the most common attacks against mobile users. In such an attack, a user may be presented with links that could redirect to malicious sites to steal sensitive information or install malware.

The following are some of the most prevalent vulnerabilities affecting mobile devices. Select each for more information.

![[Pasted image 20240617103232.png]]

A best practice is to save as little sensitive data as possible in a mobile device’s permanent local storage. However, at least some user data must be stored on most mobile devices. Both Android and iOS provide secure storage APIs that allow mobile app developers to use the cryptographic hardware available on the mobile platform. If these resources are used correctly, sensitive data and files can be secured via hardware-based strong encryption. However, mobile app developers often do not use these secure storage APIs successfully, and an attacker could leverage these vulnerabilities. For example, the iOS Keychain is designed to securely store sensitive information, such as encryption keys and session tokens. It uses an SQLite database that can be accessed through the Keychain APIs only. An attacker could use static analysis or reverse engineering to see how applications create keys and store them in the Keychain.

![[Pasted image 20240617103253.png]]

Often mobile users “unlock” a mobile device by providing a valid PIN (passcode) or password or by using biometric authentication, such as fingerprint scanning or face recognition. Android and iOS provide different methods for integrating local authentication into mobile applications. Vulnerabilities in these integrations could lead to sensitive data exposure and full compromise of the mobile device. Attacks such as the objection biometric bypass attack can be used to bypass local authentication in iOS and Android devices. OWASP provides guidance on how to test iOS local authentication at [_https://github.com/OWASP/owasp-mstg/blob/master/Document/0x06f-Testing-Local-Authentication.md_](https://github.com/OWASP/owasp-mstg/blob/master/Document/0x06f-Testing-Local-Authentication.md).

![[Pasted image 20240617103325.png]]

Attackers use certificate pinning to associate a mobile app with a particular digital certificate of a server. The purpose is to avoid accepting any certificate signed by a trusted certificate authority (CA). The idea is to force the mobile app to store the server certificate or public key and subsequently establish connections only to the trusted/known server (referred to as “pinning” the server). The goal of certificate pinning is to reduce the attack surface by removing the trust in external CAs. There have been many incidents in which CAs have been compromised or tricked into issuing certificates to impostors. Attackers have tried to bypass certificate pinning by jailbreaking mobile devices and using utilities such as SSL Kill Switch 2 (see [_https://github.com/nabla-c0d3/ssl-kill-switch2_](https://github.com/nabla-c0d3/ssl-kill-switch2)) or Burp Suite Mobile Assistant app or by using binary patching and replacing the digital certificate.

![[Pasted image 20240617103353.png]]

Attackers may leverage known vulnerabilities against the underlying mobile operating system, or dependency vulnerabilities (that is, vulnerabilities in dependencies of a mobile application). Patching fragmentation is one of the biggest challenges in Android-based implementations. Android fragmentation is the term applied to the numerous Android versions that are supported or not supported by different mobile devices. Keep in mind that Android is not only used in mobile devices but also in IoT environments. Some mobile platforms or IoT devices may not support a version of Android that has addressed known security vulnerabilities. Attackers can leverage these compatibility issues and limitations to exploit such vulnerabilities.

![[Pasted image 20240617103418.png]]

Application developers must practice the least privilege concept. That is, they should not allow mobile applications to run as root and should give them only the access they need to perform their tasks.

![[Pasted image 20240617103442.png]]

An attacker can use legitimate transactions and flows of an application in a way that results in a negative behavior or outcome. Most common business logic problems are different from the typical security vulnerabilities in applications (such as XSS, CSRF, and SQL injection). A challenge with business logic flaws is that they can’t typically be found by using scanners or any other similar tools.

---

In Module 10, “Tools and Code Analysis,” you will learn details about many tools used in pen testing engagements. At this point, let’s look at some of the tools most commonly used to perform security research and test the security posture of mobile devices. Select each of the following tool for more information.

### Burp Suite

n Module 10, you will learn about proxies and web application security tools such as Burp Suite. Burp Suite can also be used to test mobile applications and determine how they communicate with web services and APIs. You can download Burp Suite from [_https://portswigger.net/burp_](https://portswigger.net/burp).

### Drozer

This Android testing platform and framework provides access to numerous exploits that can be used to attack Android platforms. You can download Drozer from [_https://labs.withsecure.com/tools/drozer_](https://labs.withsecure.com/tools/drozer).

### Needle

This open-source framework is used to test the security of iOS applications. You can download needle from [_https://github.com/WithSecureLabs/needle_](https://github.com/WithSecureLabs/needle).

### Mobile Security Framework (MobSF)

MobSF is an automated mobile application and malware analysis framework. You can download it from [_https://github.com/MobSF/Mobile-Security-Framework-MobSF_](https://github.com/MobSF/Mobile-Security-Framework-MobSF).

### Postman

Postman is used to test and develop APIs. You can obtain information and download it from [_h_](https://github.com/OWASP/owasp-mstg/blob/master/Document/0x06f-Testing-Local-Authentication.md)[_ttps://www.postman.com_](http://www.postman.com).

### Ettercap

This tool is used to perform on-path attacks. You can download Ettercap from [_https://www.ettercap-project.org_](https://www.ettercap-project.org). An alternative tool to Ettercap, called Bettercap, is available at [_https://www.bettercap.org_](https://www.bettercap.org).

### Frida

Frida is a dynamic instrumentation toolkit for security researchers and reverse engineers. You can download it from [_https://frida.re_](https://frida.re).

### Objection

This runtime mobile platform and app exploration toolkit uses Frida behind the scenes. You can use Objection to bypass certificate pinning, dump keychains, perform memory analysis, and launch other mobile attacks. You can download Objection from [_https://github.com/sensepost/objection_](https://github.com/sensepost/objection).

### Android SDK Tools

You can use Android SDK tools to analyze and obtain detailed information about the Android environment. You can download Android Studio, which is the primary Android SDK provided by Google, from [_https://developer.android.com/studio_](https://developer.android.com/studio).

### ApkX

This tool enables you to decompile Android application package (APK) files. You can download it from [_https://github.com/b-mueller/apkx_](https://github.com/b-mueller/apkx).

### APK Studio

ou can use this tool to reverse engineer Android applications. You can download APK Studio from [_https://github.com/vaibhavpandeyvpz/apkstudio_](https://github.com/vaibhavpandeyvpz/apkstudio).

---

Practice - Mobile Device Vulnerabilities

**Q.** You are drafting a set of recommendations to give Pixel Paradise for guidance as they design and code their planned mobile gaming app. You are writing about the principle of least privilege. Why should the mobile application developers use this principle as they develop the mobile application?

**A.** Mobile application developers must practice the least privilege concept. That is, mobile applications should not be able to run as root and should be only given the access necessary to performing required tasks.

---

Practice - Attacking Mobile Devices

**Q.** Pixel Paradise relies heavily on mobile devices both for its gaming users and for its employees. Therefore, you need to be able to identify tools that are commonly used to perform security research and tools used to test the security posture of mobile devices. Match each of the following tool to its description.

**A.** 
![[Pasted image 20240617114204.png]]










