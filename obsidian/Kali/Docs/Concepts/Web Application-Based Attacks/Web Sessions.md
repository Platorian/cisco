A _web session_ is a sequence of HTTP request and response transactions between a web client and a server. These transactions include pre-authentication tasks, the authentication process, session management, access control, and session finalization. Numerous web applications keep track of information about each user for the duration of a web transaction. Several web applications have the ability to establish variables such as access rights and localization settings. These variables apply to each and every interaction a user has with the web application for the duration of the session.

Web applications can create sessions to keep track of anonymous users after the very first user request. For example, an application can remember the user language preference every time it visits the site or application front end. In addition, a web application uses a session after the user has authenticated. This allows the application to identify the user on any subsequent requests and be able to apply security access controls and increase the usability of the application. In short, web applications can provide session capabilities both before and after authentication.

After an authenticated session has been established, the session ID (or token) is temporarily equivalent to the strongest authentication method used by the application, such as usernames and passwords, one-time passwords, and client-based digital certificates

**NOTE** A good resource that provides a lot of information about application authentication is the OWASP Authentication Cheat Sheet, available at [_https://www.owasp.org/index.php/Authentication_Cheat_Sheet_](https://www.owasp.org/index.php/Authentication_Cheat_Sheet).

n order to keep the authenticated state and track user progress, applications provide users with session IDs, or tokens. A token is assigned at session creation time, and it is shared and exchanged by the user and the web application for the duration of the session. The session ID is a name/value pair.

The session ID names used by the most common web application development frameworks can be easily fingerprinted. For instance, you can easily fingerprint PHPSESSID (PHP), JSESSIONID (J2EE), CFID and CFTOKEN (ColdFusion), ASP.NET_SessionId (ASP.NET), and many others. In addition, the session ID name may indicate what framework and programming languages are used by the web application.

It is recommended to change the default session ID name of the web development framework to a generic name, such as **id**.

The session ID must be long enough to prevent brute-force attacks. Sometimes developers set it to just a few bits, though it must be at least 128 bits (16 bytes).

**NOTE** It is very important that a session ID be unique and unpredictable. You should use a good deterministic random bit generator (DRBG) to create a session ID value that provides at least 256 bits of entropy.

There are multiple mechanisms available in HTTP to maintain session state within web applications, including cookies (in the standard HTTP header), the URL parameters and rewriting defined in RFC 3986, and URL arguments on **GET** requests. In addition, developers use body arguments on **POST** requests, such as hidden form fields (HTML forms) or proprietary HTTP headers. However, one of the most widely used session ID exchange mechanisms is cookies, which offer advanced capabilities not available in other methods.

Including the session ID in the URL can lead to the manipulation of the ID or session fixation attacks. It is therefore important to keep the session ID out of the URL.

**TIP** Web development frameworks such as ASP.NET, PHP, and Ruby on Rails provide their own session management features and associated implementations. It is recommended to use these built-in frameworks rather than build your own from scratch, since they have been tested by many people. When you perform pen testing, you are likely to find people trying to create their own frameworks. In addition, JSON Web Token (JWT) can be used for authentication in modern applications.

This may seem pretty obvious, but you have to remember to encrypt an entire web session, not only for the authentication process where the user credentials are exchanged but also to ensure that the session ID is exchanged only through an encrypted channel. The use of an encrypted communication channel also protects the session against some **_session fixation_** attacks, in which the attacker is able to intercept and manipulate the web traffic to inject (or fix) the session ID on the victim’s web browser.

Session management mechanisms based on cookies can make use of two types of cookies: non-persistent (or session) cookies and persistent cookies. If a cookie has a **Max-Age** or **Expires** attribute, it is considered a persistent cookie and is stored on a disk by the web browser until the expiration time. Common web applications and clients prioritize the **Max-Age** attribute over the **Expires** attribute.

Modern applications typically track users after authentication by using non-persistent cookies. This forces the session information to be deleted from the client if the current web browser instance is closed. This is why it is important to use nonpersistent cookies: so the session ID does not remain on the web client cache for long periods of time.

Session IDs must be carefully validated and verified by an application. Depending on the session management mechanism that is used, the session ID will be received in a **GET** or **POST** parameter, in the URL, or in an HTTP header using cookies.

If web applications do not validate and filter out invalid session ID values, they can potentially be used to exploit other web vulnerabilities, such as SQL injection if the session IDs are stored on a relational database or persistent cross-site scripting (XSS) if the session IDs are stored and reflected back afterward by the web application.

**NOTE** You will learn about SQL injection and XSS later in this module.

-----

You are conducting an initial test of a client's website and you notice that a 128-bit PHP session ID cookie is set on your testing computer. What practical recommendation will you make to your client to enhance security of the application?

It is recommended that session IDs be named generically to hide the framework and languages that are used in the web application. There is no inherent security risk in passing session IDs in a URL, however they are then visible to users and could be copied and the session hijacked. Migrating to J2EE cookies is not really a practical option because it could require changing the programming language in use on the site. In addition, there is no real security difference between these types of session ID. Shortening the session ID is not recommended because it needs to be at least 128 bits to prevent brute force attacks.