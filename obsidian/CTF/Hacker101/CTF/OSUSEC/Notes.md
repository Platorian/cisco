Main page has the task details.

**Goal:** _Natasha Drew really wants to go to hacker camp but she doesn't have the grades. Hack into the OSUSEC student portal and give her all A's so she can go!_

**Analysis:** 
- Secure failed login message. It doesn't reveal if i have the correct username or not.
- Doesn't appear to be anything in the code other than a cookie function. 
- I'll running an owasp-zap with top names and common passwords while i explore the app further.
- I don't know java yet so i through the code into an ai code bot to see what's going on. It doesn't seem like the cookie function is doing anything strange, but i'm not totally sure. 
- I try using a generic SQL wordlist in the username field which gives me a result:

```php
admin' or 1=1#
```

![[Pasted image 20240907151942.png]]

- The logged in page has some interesting java

```js
(function(s, objectName) {
    setupLinks = function() {
        if (s.admin) {
            var sl = document.getElementsByClassName("student-link");
            for (i = 0; i < sl.length; i++) {
                let name = sl[i].innerHTML;
                sl[i].style.cursor = 'pointer';
                sl[i].addEventListener("click", function() {
                    window.location = '/update-' + objectName + '/' + this.dataset.id;
                });
            }
        }
    };
    updateForm = function() {
        var submitButton = document.getElementsByClassName("update-record");
        if (submitButton.length === 1) {
            submitButton[0].addEventListener("click", function() {
                var english = document.getElementById("english");
                english = english.options[english.selectedIndex].value;
                var science = document.getElementById("science");
                science = science.options[science.selectedIndex].value;
                var maths = document.getElementById("maths");
                maths = maths.options[maths.selectedIndex].value;
                var grades = new Set(["A", "B", "C", "D", "E", "F"]);
                if (grades.has(english) && grades.has(science) && grades.has(maths)) {
                    document.getElementById('student-form').submit();
                } else {
                    alert('Grades should only be between A - F');
                }
            });
        }
    };
    setupLinks();
    updateForm();
})(staff, 'student');
```

`function(s, objectName)`
`if (s.admin)`

I set up a break point at the following line and reload the page:
`setupLinks = function() {`

![[Pasted image 20240907154213.png]]

I then move to console and type:
`s.admin = true`

![[Pasted image 20240907154232.png]]

Hopefully this will allow me to edit the page. 

- Now, i can click on username and enter an edit mode. An interesting addition to the url appears in the page:

![[Pasted image 20240907154558.png]]

I try hash-finder on the url and it looks like it might be MySQL.

```php
HASH: TmFuY2llX0JyZXR0
Possible Hashs:
[+] MySQL
[+] MD5(Middle)
```

I don't have any luck with crackstation but fr-decode identifies and cracks the hash, which was base64:

![[Pasted image 20240907155005.png]]

I use the same site to encode the username i need to update and add it to the url:

`TmF0YXNoYV9EcmV3`

I change the url to access Natasha's account, and then update her grades to the A's as requested. 

![[Pasted image 20240907160150.png]]

`^FLAG^51ee784ae7e2bbdd159675e6f5c71357509156c94c1de29c1142e84ad5e565f7$FLAG$`

---

**Completed:** _16:02 2024-09-07_

Resources: _https://medium.com/@0xazr/hacker101-ctf-osu-ctf-80999cdc4221_

