Attackers can leverage misconfigured cloud assets in a number of ways. Select each for more information.

![[Pasted image 20240617083351.png]]

IAM solutions are used to administer user and application authentication and authorization. Key IAM features include SSO, multifactor authentication, and user provisioning and life cycle management. If an attacker is able to manipulate a cloud-based IAM solution in an IaaS or PaaS environment, it could be catastrophic for the cloud consumer (that is, the organization developing, deploying, and consuming cloud applications).

![[Pasted image 20240617083408.png]]

Federated authentication (or federated identity) is a method of associating a user’s identity across different identity management systems. For example, every time you access a website, a web application, or a mobile application that allows you to log in or register with your Facebook, Google, or Twitter account, that application is using federated authentication.

Often application developers misconfigure the implementation of the underlying protocols used in a federated identity environment (such as SAML, OAuth, and OpenID). For instance, a SAML assertion–that is, the XML document the identity provider sends to the service provider that contains the user authorization–should contain a unique ID that is accepted only once by the application. If you do not configure your application this way, an attacker could replay a SAML message to create multiple sessions. Attackers could also change the expiration date on an expired SAML message to make it valid again or change the user ID to a different valid user. In some cases, an application could grant default permissions or higher permissions to an unmapped user. Subsequently, if an attacker changes the user ID to an invalid user, the application could be tricked into giving access to the specific resource.

In addition, your application might use security tokens like the JSON Web Token (JWT) and SAML assertions to associate permissions from one platform to another. An attacker could steal such tokens and leverage misconfigured environments to access sensitive data and resources.

![[Pasted image 20240617083429.png]]

Insecure permission configurations for cloud object storage services, such as Amazon’s AWS S3 buckets, are often the cause of data breaches.

**TIP** Omar Santos has included several tools that can be used to scan insecure S3 buckets at my GitHub repository, at [_https://github.com/The-Art-of-Hacking/h4cker/tree/master/cloud_resources_](https://github.com/The-Art-of-Hacking/h4cker/tree/master/cloud_resources).


![[Pasted image 20240617083449.png]]

Attacks against container-based deployments (such as Docker, Rocket, LXC, and containerd) have led to massive data breaches. For instance, you can passively obtain information from Shodan (shodan.io) or run active recon scans to find cloud deployments widely exposing the Docker daemon or Kubernetes elements to the Internet. Often attackers use stolen credentials or known vulnerabilities to compromise cloud-based applications. Similarly, attackers use methods such as typosquatting to create malicious containers and post them in Docker Hub. This attack, which can be considered a supply chain attack, can be very effective. You could, for example, download the base image for NGINX or Apache HTTPd from Docker Hub, and that Docker image might include a backdoor that the attacker can use to manipulate your applications and underlying systems.

**NOTE**  Typosquatting is a technique that leverages human error when typing URLs in a web browser or accessing other resources (as in the earlier example of impersonating legitimate Docker containers in Docker Hub).


