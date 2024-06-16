## How to disable Port Restriction on Mozilla Firefox

- Open **Mozilla Firefox**.
- In the address bar, type **about:config** and press Enter to access the configuration page.
- Use the search bar above to look for the following configuration parameter: **network.security.ports.banned.override**
    - **If the parameter already exist**: double-click it, then add a comma to the end of its value followed by the port number you need to allow (no spaces) and click **OK**. If you need to override multiple ports, separate each number with a comma (no spaces).
    - **If the parameter does not exist**: create it by right-clicking anywhere on the page, choosing **New** > **String** and typing (or copy-pasting) the above name, then type in the port number you need to allow (no spaces) and click **OK**. If you need to override multiple ports, separate each number with a comma (no spaces).

### You can no longer right click new string, but you can just select string instead. 
