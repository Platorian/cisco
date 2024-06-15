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

![[Pasted image 20240615040458.png]]

In Example 6-1, you can see the packets that correspond to the steps shown in Figure 6-2. The client and the server first complete the TCP three-way handshake (SYN, SYN ACK, ACK). Then the client sends an HTTP **GET** (request), and the server replies with a TCP ACK and the contents of the page (with an HTTP 200 OK response). Each of these request and response messages contains a message header and message body. An HTTP message (either a request or a response) has a structure that consists of a block of lines comprising the message header, followed by a message body. Figure 6-3 shows the details of an HTTP request packet capture collected between a client (192.168.78.168) and a web server.

**_Figure 6-3_** _- HTTP Request Details_

![[Pasted image 20240615040631.png]]

When HTTP servers and browsers communicate with each other, they perform interactions based on headers as well as body content. The HTTP request shown in Figure 6-3 has the following structure:

- **The method:** In this example, the method is an HTTP **GET**, although it could be any of the following:  
    - **GET:** Retrieves information from the server  
    - **HEAD:** Basically the same as **GET** but returns only HTTP headers and no document body  
    - **POST:** Sends data to the server (typically using HTML forms, API requests, and so on)  
    - **TRACE:** Does a message loopback test along the path to the target resource  
    - **PUT:** Uploads a representation of the specified URI  
    - **DELETE:** Deletes the specified resource  
    - **OPTIONS:** Returns the HTTP methods that the server supports  
    - **CONNECT:** Converts the request connection to a transparent TCP/IP tunnel.
- **The URI and the path-to-resource field:** This represents the path portion of the requested URL.
- **The request version-number field:** This specifies the version of HTTP used by the client.
- **The user agent:** In this example, Chrome was used to access the website. In the packet capture you see the following:

```
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36
```

- **Several other fields: accept, accept-language, accept encoding**, and other fields also appear

![[Pasted image 20240615041542.png]]

he server response includes a three-digit status code and a brief human-readable explanation of the status code. Below that you can see the text data (which is the HTML code coming back from the server and displaying the website contents).

**NOTE** It is important that you become familiar with HTTP message status codes. W3Schools provides a very good explanation at [_https://www.w3schools.com/tags/ref_httpmessages.asp_](https://www.w3schools.com/tags/ref_httpmessages.asp).

The HTTP status code messages can be in the following ranges:

- Messages in the 100 range are informational.
- Messages in the 200 range are related to successful transactions.
- Messages in the 300 range are related to HTTP redirections.
- Messages in the 400 range are related to client errors.
- Messages in the 500 range are related to server errors.

**HTTP URL Structure**

HTTP and other protocols use URLs – and you are definitely familiar with URLs because you use them every day. This section explains the elements of a URL so you can better understand how to abuse some of these parameters and elements from an offensive security perspective.

Consider the URL **https://theartofhacking.org:8123/dir/test;id=89?name= omar&x=true**. Let’s break down this URL into its component parts:

- **scheme:** This is the portion of the URL that designates the underlying protocol to be used (for example, HTTP, FTP); it is followed by a colon and two forward slashes ( **//** ). In this example, the scheme is **http.**
- **host:** This is the IP address (numeric or DNS-based) for the web server being accessed; it usually follows the colon and two forward slashes. In this case, the host is **theartofhacking.org**.
- **port:** This optional portion of the URL designates the port number to which the target web server listens. (The default port number for HTTP servers is 80, but some configurations are set up to use an alternate port number.) In this case, the server is configured to use port **8123**.
- **path:** This is the path from the “root” directory of the server to the desired resource. In this case, you can see that there is a directory called **dir**. (Keep in mind that, in reality, web servers may use aliasing to point to documents, gateways, and services that are not explicitly accessible from the server’s root directory.)
- **path-segment-params:** This is the portion of the URL that includes optional name/value pairs (that is, path segment parameters). A path segment parameter is typically preceded by a semicolon (depending on the programming language used), and it comes immediately after the path information. In this example, the path segment parameter is **id=89**. Path segment parameters are not commonly used. In addition, it is worth mentioning that these parameters are different from query-string parameters (often referred to as _URL parameters_ ).
- **query-string:** This optional portion of the URL contains name/value pairs that represent dynamic parameters associated with the request. These parameters are commonly included in links for tracking and context-setting purposes. They may also be produced from variables in HTML forms. Typically, the query string is preceded by a question mark. Equals signs (=) separate names and values, and ampersands ( **_&_** ) mark the boundaries between name/value pairs. In this example, the query string is **name=omar&x=true.**

In addition, other protocols, such as HTML and CSS, are used on things like Simple Object Access Protocol (SOAP) and RESTful APIs. Examples include JSON, XML, and Web Processing Service (WPS) (which is not the same as the WPS in wireless networks).

**NOTE** The URL notation here applies to most protocols (for example, HTTP, HTTPS, and FTP).

**TIP** A REST API (or **_RESTful API_**) is a type of application programming interface (API) that conforms to the specification of the representational state transfer (REST) architectural style and allows for interaction with web services. REST APIs are used to build and integrate multiple-application software. In short, if you want to interact with a web service to retrieve information or add, delete, or modify data, an API helps you communicate with such a system in order to fulfill the request. REST APIs use JSON as the standard format for output and requests. SOAP is an older technology used in legacy APIs that use XML instead of JSON. **_Extensible Markup Language Remote Procedure Call (XML-RPC)_** is a protocol in legacy applications that uses XML to encode its calls and leverages HTTP as a transport mechanism.

The current HTTP versions are 1.1 and 2.0. Figure 6-5 shows an example of an HTTP 1.1 exchange between a web client and a web server.

**_Figure 6-5_** _- HTTP 1.1 Exchange_

![[Pasted image 20240615042846.png]]

Figure 6-6 shows an example of an HTTP 2.0 exchange between a web client and a web server.

**_Figure 6-6_** _- HTTP 2.0 Multiplexing_

![[Pasted image 20240615043014.png]]

**TIP** As a practice exercise, use curl to create a connection to the web.h4cker.org website. Try to change the version to HTTP 2.0 and use Wireshark. Can you see the difference between the versions of HTTP in a packet capture? See [_https://curl.haxx.se/docs/http2.html_](https://curl.haxx.se/docs/http2.html) for curl documentation.

Label the parts of the URL  **https://thearthacking.io:8123/dir/test;id=89?name=omar&x=true**  by dragging the labels to the URL components.

![[Pasted image 20240615043324.png]]

