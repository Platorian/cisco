As shown in Figure 7-7, computing has evolved from traditional physical (bare-metal) servers to VMs, containers, and serverless architectures.

**_Figure 7-7_** _- The Evolution of Computing_

![[Pasted image 20240617123525.png]]

Vulnerabilities in applications and in open-source software running in containers such as Docker, Rocket, and containerd are often overlooked by developers and IT staff. Attackers may take advantage of these vulnerabilities to compromise applications and data. A variety of security layers apply to containerized workloads:

- The container image
- Software inside the container
- The host operating system
- Interaction between containers and the host operating system
- Security in runtime environment and orchestration platforms such as Kubernetes

Figure 7-8 shows three key security best practices that organizations should use to create a secure container image.

**_Figure 7-8_** _- Securing Container Images_

![[Pasted image 20240617123553.png]]

Often software developers run containers with root privileges. These containers are one vulnerability away from full compromise.

**TIP** The CIS Benchmarks for Docker and Kubernetes provide detailed guidance on how to secure Docker containers and Kubernetes deployments. You can access all the CIS Benchmarks at: [_https://www.cisecurity.org/cis-benchmarks_](https://www.cisecurity.org/cis-benchmarks).

---

A number of tools allow you to scan Docker images for vulnerabilities and assess Kubernetes deployments. The following are a few examples of these tools. Select each tool for more information.

**Anchore’s Grype**  

Grype is an open-source container vulnerability scanner that you can download from [_https://github.com/anchore/grype_](https://github.com/anchore/grype). Figure 7-9 demonstrates the use of the Grype scanner to find vulnerabilities in a Docker image.

***Clair**  

Clair is another open-source container vulnerability scanner. You can download it from [_https://github.com/quay/clair_](https://github.com/quay/clair).

***Dagda**  

This set of open-source static analysis tools can help detect vulnerabilities, Trojans, backdoors, and malware in Docker images and containers. It uses the ClamAV antivirus engine to detect malware and vulnerabilities. You can download Dagda from [_https://github.com/eliasgranderubio/dagda/_](https://github.com/eliasgranderubio/dagda/).

***kube-bench**  

This open-source tool performs a security assessment of Kubernetes clusters based on the CIS Kubernetes Benchmark. You can download kube-bench from [_https://github.com/aquasecurity/kube-bench_](https://github.com/aquasecurity/kube-bench).

***kube-hunter**  

This open-source tool is designed to check the security posture of Kubernetes clusters. You can download kube-hunter from [_https://kube-hunter.aquasec.com/_](https://kube-hunter.aquasec.com/).

***Falco**  

You can download this threat detection engine for Kubernetes from [_https://falco.org/_](https://falco.org/).

**_Figure 7-9_** _- Scanning Container Images with Grype_

![[Pasted image 20240617123811.png]]

Another strategy that threat actors have used for years is to insert malicious code into Docker images on Docker Hub ([_https://hub.docker.com_](https://hub.docker.com)). This has been a very effective “supply chain” attack.

---

Practice - Vulnerabilities Related to Containerized Workloads

**Q.** Pixel Paradise is considering a variety of container and serverless architectures as they begin to plan their move towards a CI/CD development process. They will be implementing continuous integration (CI) for merging new code and continuous delivery (CD) for automating building and testing their games. Your familiarity with container vulnerability scanning tools will be crucial as you continue to grow at Protego. Match each tool to its description.

**A.** 
![[Pasted image 20240617125901.png]]


