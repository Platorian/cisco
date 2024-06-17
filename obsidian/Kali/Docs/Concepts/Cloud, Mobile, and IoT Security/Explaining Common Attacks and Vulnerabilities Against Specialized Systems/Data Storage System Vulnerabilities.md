With the incredibly large number of IoT architectures and platforms available today, choosing which direction to focus on is a major challenge. IoT architectures extend from IoT endpoint devices (things) to intermediary “fog” networks and cloud computing. Gateways and edge nodes are devices such as switches, routers, and computing platforms that act as intermediaries (“the fog layer”) between the endpoints and the higher layers of the IoT system. The IoT architectural hierarchy high-level layers are illustrated in Figure 7-4.

**_Figure 7-4_** _- IoT Architecture Layers_

![[Pasted image 20240617121418.png]]

Misconfigurations in IoT _on-premises and cloud-based solutions_ can lead to data theft. The following are some of the most common misconfigurations of IoT devices and cloud-based solutions. Select each misconfiguration for more information.

![[Pasted image 20240617121843.png]]

Hardcoded or default credentials are often left in place by administrators and in some cases by software developers, exposing devices or the cloud environment to different attacks.

![[Pasted image 20240617121903.png]]

Many IoT, ICS, and SCADA systems should never be exposed to the Internet (see [_https://www.shodan.io/explore/category/industrial-control-systems_](https://www.shodan.io/explore/category/industrial-control-systems)). For example, programmable logic controllers (PLCs) controlling turbines in a power plant, the lighting at a stadium, and robots in a factory should never be exposed to the Internet. However, you can often see such systems in Shodan scan results.

![[Pasted image 20240617122001.png]]

Input validation vulnerabilities in protocols such as Modbus, S7 Communication, DNP3, and Zigbee could lead to DoS and code execution.

![[Pasted image 20240617122034.png]]

In Module 6, you learned about SQL injection and how attackers can inject malicious SQL statements after “escaping input” with a single quote (by using the single quote method). IoT systems can be susceptible to similar vulnerabilities.

![[Pasted image 20240617122122.png]]

Many IoT systems include details in error messages and debugging output that can allow an attacker to obtain sensitive information from the system and underlying network.

