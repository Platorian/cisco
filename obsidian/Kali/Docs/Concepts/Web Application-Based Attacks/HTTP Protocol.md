- The HTTP 1.1 protocol is defined in RFCs 7230-7235.
- In the examples in this module, when we refer to an _HTTP server_, we basically mean a _web server_.
- When we refer to _HTTP clients_, we are talking about browsers, proxies, API clients, and other custom HTTP client programs.
- HTTP is a very simple protocol, which is both a good thing and a bad thing.
- In most cases, HTTP is categorized as a stateless protocol that does not rely on a persistent connection for communication logic.
- An HTTP transaction consists of a single request from a client to a server, followed by a single response from the server back to the client.
- HTTP is different from stateful protocols, such as FTP, SMTP, IMAP, and POP. When a protocol is stateful, sequences of related commands are treated as a single interaction.
- A server must maintain the state of its interaction with the client throughout the transmission of successive commands until the interaction is terminated.
- A sequence of transmitted and executed commands is often called a _session_.

Figure 6-1 shows a very simple topology that includes a client, a proxy, and a web (HTTP) server.

**_Figure 6-1_** _- A Web Client, a Proxy, and a Web (HTTP) Server_

![[Pasted image 20240615035451.png]]

HTTP proxies act as both servers and clients. Proxies make requests to web servers on behalf of other clients. They enable HTTP transfers across firewalls and can also provide support for caching of HTTP messages. Proxies can perform other roles in complex environments, including Network Address Translation (NAT) and filtering of HTTP requests.

HTTP is an application-level protocol in the TCP/IP protocol suite, and it uses TCP as the underlying transport layer protocol for transmitting messages. HTTP uses a request/response model, which basically means that an HTTP client program sends an HTTP request message to a server, and then the server returns an HTTP response message, as demonstrated in Figure 6-2.

**_Figure 6-2_** _- HTTP Request/Response Model_

![[Pasted image 20240615035621.png]]

In Example 6-1, the Linux **tcpdump** utility (command) is being used to capture the packets from the client (192.168.78.6) to the web server to access the website http://web.h4cker.org/omar.html.

**_Example 6-1_** _-_ _Packet Capture of an HTTP Request and Response Using_ **_tcpdump_**

```
mar@jorel:~$ sudo tcpdump net 185.199.0.0/16tcpdump: verbose output suppressed, use -v or -vv for full protocoldecodelistening on enp9s0, link-type EN10MB (Ethernet), capture size 262144bytes23:55:13.076301 IP 192.168.78.6.37328 > 185.199.109.153.http: Flags[S], seq 3575866614, win 29200, options [mss 1460,sackOK,TS val462864607 ecr 0,nop,wscale 7], length 023:55:13.091262 IP 185.199.109.153.http > 192.168.78.6.37328: Flags[S.], seq 3039448681, ack 3575866615, win 26960, options [mss1360,sackOK,TS val 491992242 ecr 462864607,nop,wscale 9], length 023:55:13.091322 IP 192.168.78.6.37328 > 185.199.109.153.http: Flags[.], ack 1, win 229, options [nop,nop,TS val 462864611 ecr 491992242],length 023:55:13.091409 IP 192.168.78.6.37328 > 185.199.109.153.http: Flags[P.], seq 1:79, ack 1, win 229, options [nop,nop,TS val 462864611 ecr491992242], length 78: HTTP: GET / HTTP/1.123:55:13.105791 IP 185.199.109.153.http > 192.168.78.6.37328: Flags[.], ack 79, win 53, options [nop,nop,TS val 491992246 ecr 462864611],length 023:55:13.106727 IP 185.199.109.153.http > 192.168.78.6.37328: Flags[P.], seq 1:6404, ack 79, win 53, options [nop,nop,TS val 491992246ecr 462864611], length 6403: HTTP: HTTP/1.1 200 OK23:55:13.106776 IP 192.168.78.6.37328 > 185.199.109.153.http: Flags[.], ack 6404, win 329, options [nop,nop,TS val 462864615 ecr491992246], length 0
```
