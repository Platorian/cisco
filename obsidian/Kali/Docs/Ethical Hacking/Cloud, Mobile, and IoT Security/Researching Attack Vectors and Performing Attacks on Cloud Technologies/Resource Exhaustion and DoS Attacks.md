One of the benefits of leveraging cloud services is the distributed and resilient architecture that most leading cloud providers offer. This architecture helps minimize the impact of a DoS or distributed denial-of-service (DDoS) attack compared to what it would be if you were hosting your application on premises in your data center. On the other hand, in recent years, the volume of bits per second (bps), packets per second (pps), and HTTP(s) requests per second (rps) have increased significantly. Often attackers use botnets of numerous compromised laptops and desktop systems and compromise mobile, IoT, and cloud-based systems to launch these attacks. Figure 7-3 illustrates the key metrics used to identify volumetric DDoS attacks.

**_Figure 7-3_** _- DDoS Attack Metrics_

![[Pasted image 20240617090331.png]]

However, attackers can launch more strategic DoS attacks against applications hosted in the cloud that could lead to _resource exhaustion_. For example, they can leverage a single-packet DoS vulnerability in network equipment used in cloud environments, or they can leverage tools to generate crafted packets to cause an application to crash. For instance, you can search in Exploit Database (exploit-db.com) for exploits that can be used to leverage “denial of service” vulnerabilities, where an attacker could just send a few packets and crash an application or the whole operating system. Example 7-8 shows how to search for exploits using the **searchsploit** tool.

**_Example 7-8_** _-_ _Using the_ **_searchsploit_** _to Search for Exploits_

![[Pasted image 20240617090405.png]]

Another example of a DoS attack that can affect cloud environments is the **_direct-to-origin_** **_(D2O)_** **_attack_**. In a D2O attack, threat actors are able to reveal the origin network or IP address behind a content delivery network (CDN) or large proxy placed in front of web services in a cloud provider. A D2O attack could allow attackers to bypass different anti-DDoS mitigations.

**NOTE** A CDN is a geographically distributed network of proxies in data centers around the world that offers high availability and performance benefits by distributing web services to end users around the world.

