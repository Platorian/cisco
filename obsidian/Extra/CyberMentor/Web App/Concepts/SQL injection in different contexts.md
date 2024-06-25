In the previous labs, you used the query string to inject your malicious SQL payload. However, you can perform SQL injection attacks using any controllable input that is processed as a SQL query by the application. For example, some websites take input in JSON or XML format and use this to query the database.

These different formats may provide different ways for you to obfuscate attacks that are otherwise blocked due to WAFs and other defence mechanisms. Weak implementations often look for common SQL injection keywords within the request, so you may be able to bypass these filters by encoding or escaping characters in the prohibited keywords. For example, the following XML-based SQL injection uses an XML escape sequence to encode the `S` character in `SELECT`:

```
<stockCheck> 
<productId>123</productId> 
<storeId>999 &#x53;ELECT * FROM information_schema.tables</storeId> 
</stockCheck>
````

This will be decoded server-side before being passed to the SQL interpreter.

This lab contains a SQL injection vulnerability in its stock check feature. The results from the query are returned in the application's response, so you can use a UNION attack to retrieve data from other tables.

The database contains a `users` table, which contains the usernames and passwords of registered users. To solve the lab, perform a SQL injection attack to retrieve the admin user's credentials, then log in to their account.

Payload:

```json
&#x53;ELECT * FROM information_schema.tables</storeId>
```

**Solution**

**Identify the vulnerability**

1. Observe that the stock check feature sends the `productId` and `storeId` to the application in XML format.
    
2. Send the `POST /product/stock` request to Burp Repeater.
    
3. In Burp Repeater, probe the `storeId` to see whether your input is evaluated. For example, try replacing the ID with mathematical expressions that evaluate to other potential IDs, for example:
    
    `<storeId>1+1</storeId>`
4. Observe that your input appears to be evaluated by the application, returning the stock for different stores.
    
5. Try determining the number of columns returned by the original query by appending a `UNION SELECT` statement to the original store ID:
    
    `<storeId>1 UNION SELECT NULL</storeId>`
6. Observe that your request has been blocked due to being flagged as a potential attack.

![[Pasted image 20240625055010.png]]
    

**Bypass the WAF**

1. As you're injecting into XML, try obfuscating your payload using XML entities. One way to do this is using the Hackvertor extension. Just highlight your input, right-click, then select **Extensions > Hackvertor > Encode > dec_entities/hex_entities**.
    
2. Resend the request and notice that you now receive a normal response from the application. This suggests that you have successfully bypassed the WAF.

![[Pasted image 20240625055451.png]]
    

**Craft an exploit**

1. Pick up where you left off, and deduce that the query returns a single column. When you try to return more than one column, the application returns `0 units`, implying an error.
    
2. As you can only return one column, you need to concatenate the returned usernames and passwords, for example:
    
```json
<storeId><@hex_entities>1 UNION SELECT username || '~' || password FROM users<@/hex_entities></storeId>
```


3. Send this query and observe that you've successfully fetched the usernames and passwords from the database, separated by a `~` character.
    
4. Use the administrator's credentials to log in and solve the lab.

![[Pasted image 20240625055721.png]]

---

## Second-order SQL injection

First-order SQL injection occurs when the application processes user input from an HTTP request and incorporates the input into a SQL query in an unsafe way.

Second-order SQL injection occurs when the application takes user input from an HTTP request and stores it for future use. This is usually done by placing the input into a database, but no vulnerability occurs at the point where the data is stored. Later, when handling a different HTTP request, the application retrieves the stored data and incorporates it into a SQL query in an unsafe way. For this reason, second-order SQL injection is also known as stored SQL injection.

![[Pasted image 20240625055848.png]]

Second-order SQL injection often occurs in situations where developers are aware of SQL injection vulnerabilities, and so safely handle the initial placement of the input into the database. When the data is later processed, it is deemed to be safe, since it was previously placed into the database safely. At this point, the data is handled in an unsafe way, because the developer wrongly deems it to be trusted.

---

## How to prevent SQL injection

You can prevent most instances of SQL injection using parameterised queries instead of string concatenation within the query. These parameterised queries are also know as "prepared statements".

The following code is vulnerable to SQL injection because the user input is concatenated directly into the query:

`String query = "SELECT * FROM products WHERE category = '"+ input + "'"; Statement statement = connection.createStatement(); 
`ResultSet resultSet = statement.executeQuery(query);`

You can rewrite this code in a way that prevents the user input from interfering with the query structure:

`PreparedStatement statement = connection.prepareStatement("SELECT * FROM products WHERE category = ?"); 
`statement.setString(1, input); 
`ResultSet resultSet = statement.executeQuery();`

