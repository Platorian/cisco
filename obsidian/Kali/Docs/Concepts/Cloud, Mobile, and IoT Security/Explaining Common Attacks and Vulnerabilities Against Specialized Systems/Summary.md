What Did I Learn in this Module?

![[Pasted image 20240617125956.png]]

Numerous organizations are transitioning to the cloud or employing hybrid models for their applications. This move usually entails a shift from capital expenditure (CapEx) to operating expenditure (OpEx). Cloud computing security, which includes protection against data theft, exfiltration, and deletion, is vital. The National Institute of Standards and Technology (NIST) established a standard set of definitions for cloud computing aspects in its SP 800-145 publication.

Benefits of using cloud-based services include distributed storage, scalability, resource pooling, access from any location, measured service, and automated management. Essential characteristics of cloud computing, as defined by NIST, are on-demand self-service, broad network access, resource pooling, rapid elasticity, and measured service.

There are different models for cloud deployment: public cloud, which is available for public use; private cloud, used solely by a client organization; community cloud, shared among several organizations; and hybrid cloud, which includes a mix of two or more clouds and on-prem services.

Cloud computing services are categorized into three basic models: Infrastructure as a Service (IaaS), where users rent infrastructure; Platform as a Service (PaaS), which provides everything except the applications; and Software as a Service (SaaS), which provides a complete packaged solution, usually accessed via a web portal or front end.

Potential attacks against cloud technologies include the following:

- **Credential Harvesting** - This is the act of gathering valid user credentials, often using tactics like phishing and creating fake websites that mirror legitimate services. Attackers use these methods to trick users into revealing their login details, even sometimes bypassing multi-factor authentication. For example, the Social-Engineer Toolkit (SET) is one tool used by attackers to create a fake website for credential harvesting. As the use of cloud services expands, credential harvesting now targets both cloud and non-cloud services, emphasizing the need for strong security measures and user awareness.
- **Privilege Escalation** - This is exploiting system vulnerabilities to gain unauthorized access or privileges within a system. It comes in two forms: vertical, where a lower-privileged user gains higher-level access, and horizontal, where a user accesses content reserved for other users. Regular system updates, use of access control systems, and user vigilance, such as locking computers when unattended, are key to preventing such breaches.
- **Account Takeover** - This is a security breach where an attacker gains unauthorized access to a user or application account, subsequently utilizing it to infiltrate more accounts and information. This can occur in a cloud environment and has distinct impacts compared to an on-premises attack, especially in terms of detection, damage assessment, and remediation strategies. Detection methods include monitoring user login locations and failed login attempts, identifying lateral phishing emails, detecting malicious connections via OAuth, SAML, or OpenID Connect, and observing abnormal file sharing and downloading behavior. Note that while location-based detection can provide clues about a possible breach, attackers may bypass these restrictions using VPNs.
- **Metadata Service Attacks** - Traditionally, software developers used hard-coded credentials to access services, which can be insecure. To mitigate this, cloud providers like AWS introduced metadata services, which offer temporary access credentials to services like AWS S3 buckets. These services also store user data for setting up new virtual machines, such as AWS EC2 instances. However, these metadata services are prime targets for attackers who can gain valid AWS credentials and sensitive information from user startup scripts. Tools like nimbostratus can help identify vulnerabilities that could lead to metadata service attacks.
- **Attacks Against Misconfigured Cloud Assets** - These include the following:
    - _IAM Implementations_: Solutions used for managing user and application authentication and authorization. If manipulated in IaaS or PaaS environments, it could be devastating for the organization using the cloud applications.
    - _Federation Misconfigurations_: Federated authentication allows for the association of a user's identity across various identity management systems. However, developers often misconfigure the protocols used (e.g., SAML, OAuth, OpenID), which attackers can exploit by replaying or modifying messages, thereby gaining unauthorized access.
    - _Object Storage_: Insecure permission configurations for cloud object storage services, like AWS S3 buckets, can lead to data breaches.
    - _Containerization Technologies_: Attacks on container-based deployments (like Docker, Rocket, LXC, and containerd) have resulted in significant data breaches. Attackers can use stolen credentials or known vulnerabilities to compromise cloud-based applications. They can also create malicious containers and post them on Docker Hub, leading to supply chain attacks.
- **Cloud Malware Injection Attacks** - Cloud deployments can fall prey to malware injection attacks, where a rogue application is inserted into various cloud environments. Once operational, this malware enables the attacker to execute additional malicious activities like data manipulation and theft.
- **Side-Channel Attacks** - Side-channel attacks exploit information from a system's implementation, such as timing, power consumption, electromagnetic leaks, and sound, to compromise the system and extract sensitive data, which is typically credentials, cryptographic keys, or other sensitive information.

This topic concluded with a brief discussion of software development kits (SDKs) and cloud development kits (CDKs). SDKs and CDKs are collections of tools aiding in application creation and cloud deployment respectively, with SDKs providing resources like compilers and debuggers, and CDKs, like AWS CDK, helping utilize cloud resources with familiar programming languages.

---

![[Pasted image 20240617130020.png]]

This topic covered the following attacks and vulnerabilities against specialized systems:

**Attacking Mobile Devices**

Methods attackers use to compromise mobile devices include reverse engineering, sandbox analysis, spamming, and exploiting the most prevalent known vulnerabilities.

In reverse engineering, attackers analyze the compiled mobile app to extract information about its source code and manipulate the mobile device. Sandbox analysis involves an attacker examining the sandbox implementation in a mobile device to potentially bypass the access control mechanisms implemented by the operating system. Spamming involves unsolicited messages, often carrying links that redirect users to malicious sites to steal sensitive information or install malware.

Several prevalent vulnerabilities affecting mobile devices include the following:

- **Insecure storage** refers to developers not successfully using secure storage APIs, allowing an attacker to exploit these vulnerabilities.
- **Passcode vulnerabilities** and biometric integrations could lead to sensitive data exposure if not implemented securely.
- **Certificate pinning** is a method where attackers force a mobile app to store a server certificate or public key, which could be exploited.
- **Usage of known vulnerable components** and over-reach of permissions by applications could also lead to attacks.
- **Execution of activities using root** should not be allowed on mobile applications.
- **Business logic vulnerabilities** are also a concern where an attacker can manipulate legitimate transactions and flows of an application to cause harm.

Several tools like Burp Suite, Drozer, needle, Mobile Security Framework (MobSF), Postman, Ettercap, Frida, Objection, Android SDK tools, ApkX, and APK Studio can be used to test the security posture of mobile devices and perform security research.

**Attacking Internet of Things (IoT) Devices**

The Internet of Things (IoT) encompasses a wide range of devices and systems across various industries. Designing and securing IoT systems is complex due to integration challenges, scalability issues, and the need for diverse skills. IoT platforms must integrate different devices, work with legacy technologies, and handle multiple vendors. Existing security efforts often focus on specific components rather than the entire system.

Analyzing IoT protocols is crucial for reconnaissance and exploitation. Common network protocols in IoT include Wi-Fi, Bluetooth, Zigbee, Z-Wave, LoraWAN, Insteon, Modbus, and Siemens S7comm. For example, Bluetooth Low Energy (BLE) is used in various IoT devices but may have vulnerabilities, such as misconfigurations and lack of encryption, which can be exploited by attackers.

Securing IoT implementations requires special considerations. IoT devices often have limited computing resources, making encryption support challenging. Denial-of-Service (DoS) attacks, data corruption, and data exfiltration are major concerns in IoT security.

Common vulnerabilities in IoT implementations include insecure defaults, plaintext communication, hard-coded configurations, and the use of outdated firmware and insecure components. Many IoT devices have default credentials and insecure configurations exposed on the internet. Encryption is often not implemented properly, leading to data leakage. Outdated software and hardware pose risks, and IoT devices often lack secure update mechanisms.

**Data Storage System Vulnerabilities**

The complexity and security vulnerabilities of Internet of Things (IoT) architectures range from endpoint devices, through intermediary devices (such as routers and switches, known as the "fog" layer), to cloud computing platforms. Misconfigurations in IoT systems can expose these devices to cyberattacks and data theft. Common issues include the use of default or hardcoded credentials, inappropriate exposure of systems to the internet, lack of user input sanitization, software and injection vulnerabilities, and revealing too much information in error messages and debug outputs. These weaknesses can lead to a range of attacks, from denial of service to unauthorized code execution.

**Management Interface Vulnerabilities**

IoT implementations are often vulnerable due to issues with management interfaces like the Intelligent Platform Management Interface (IPMI), a suite of specifications utilized by IoT systems for management and monitoring independently of the host system's core functions. This is facilitated by the IPMI's baseboard management controller (BMC) and other satellite controllers, which connect through the Intelligent Platform Management Bus/Bridge (IPMB). However, due to its direct hardware access, a compromised BMC can lead to significant security breaches, including system monitoring, rebooting, or unwanted software installation, equating to physical access to the underlying system.

**Exploiting Virtual Machines**

VMs are meant to be isolated systems, each running unique applications and operating systems, and are managed by a hypervisor. There are two types of hypervisors: Type 1, which runs directly on the system, with examples being VMware ESXi and Microsoft Hyper-V; and Type 2, which runs atop another OS, like VirtualBox and VMware Player. Despite their design, VMs have been vulnerable to various threats, including:

- _VM escape vulnerabilities_: This allows attackers to break out from one VM and access data from another VM or even the hypervisor itself.
- _Hypervisor vulnerabilities, including hyperjacking_: Hyperjacking can let an attacker seize control of the hypervisor, often through the installation of a stealthy, malicious hypervisor.
- _VM repository vulnerabilities_: Threat actors can exploit these to compromise systems and applications by uploading malicious VMs to public and private VM repositories, like VMware Marketplace or AWS Marketplace. Once deployed by unsuspecting users, these VMs can lead to systems, applications, and data manipulations.

**Vulnerabilities Related to Containerized Workloads**

The evolution of computing has led to serverless architectures from traditional bare-metal servers, through VMs and containers. These advancements also present potential vulnerabilities in application and open-source software, which are often overlooked in containers like Docker, Rocket, and containerd. Security measures need to be applied at various layers, including the container image, software inside the container, the host operating system, the interaction between containers and the host, and in the runtime environment and orchestration platform, such as Kubernetes.

Running containers with root privileges could lead to full compromise, hence securing container images is crucial. The CIS Benchmarks provide guidance on securing Docker containers and Kubernetes deployments. There are also various tools like Anchore's Grype, Clair, Dagda, kube-bench, kube-hunter, and Falco that can help detect vulnerabilities in Docker images, assess Kubernetes deployments, and maintain the overall security posture.

Threat actors have been known to insert malicious code into Docker images on Docker Hub, illustrating the potential for "supply chain" attacks, indicating the importance of robust security measures in the containerized environment.

---

Reflection Questions

New technologies can improve our lives, but this comes at a cost. The internet of things (IoT) connects many devices that can lower costs and improve efficiency to the internet. These devices are small and often have limited computer processing capability. However, they can host server software and command line utilities. What is the impact of connecting hundreds of thousands of IoT devices to the internet?

Technologies such as the cloud, virtual machines, and containerized services add flexibility and power to software deployments. However, so much flexibility can cause problems. Why does widespread adoption of cloud services present challenges for security experts?

What is the responsibility of ethical hackers as regards IoT, cloud, and containerized services?

