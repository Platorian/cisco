## Step 1 and 2.

**Step 1.** The attacker uses Airmon-ng to start the wireless interface in monitoring mode, using the **airmon-ng start wlan0** command. (This is the same process shown for cracking WEP in the previous section.) Figure 5-21 displays three terminal windows. The second terminal window from the top shows the output of the **airodump-ng wlan0** command, displaying all adjacent wireless networks.

**Step 2.** After locating the corp-net network, the attacker uses the **airodump-ng** command, as shown in the first terminal window displayed in Figure 5-21, to capture all the traffic to a capture file called **wpa_capture**, specifying the wireless channel (**11** , in this example), the BSSID, and the wireless interface (**wlan0**).

**_Figure 5-21_** _- Using Airodump-ng to View the Available Wireless Networks and Then Capturing Traffic to the Victim BSSID_

![](https://skillsforall.com/content/eh/1.0/courses/content/m5/en-US/assets/dd54db9c385b5dc657e036923ece948905713733.png)

## Step 3.

**Step 3** **_._** The attacker uses the **aireplay-ng** command, as shown in Figure 5-22, to perform a deauthentication attack against the wireless network. In the terminal shown at the top of Figure 5-23, you can see that the attacker has collected the WPA handshake.

**_Figure 5-22_** _- Using Aireplay-ng to Disconnect the Wireless Clients_

![](https://skillsforall.com/content/eh/1.0/courses/content/m5/en-US/assets/9a8b186befc8cc03b00e1e6d7d4bf7e8fdc3b69a.png)

## Step 4.

**Step 4** **_._** The attacker uses the **aircrack-ng** command to crack the WPA PSK by using a word list, as shown in Figure 5-23. (The filename is **words** in this example.)

**_Figure 5-23_** _- Collecting the WPA Handshake Using Airodump-ng_

![](https://skillsforall.com/content/eh/1.0/courses/content/m5/en-US/assets/cd53a8fc70ed2adb04013fe201f79dc1f7762307.png)

## Step 5.

**Step 5** **_._** The tool takes a while to process, depending on the computer power and the complexity of the PSK. After it cracks the WPA PSK, a window similar to the one shown in Figure 5-24 shows the WPA PSK (**corpsupersecret** in this example).

**_Figure 5-24_** _- Cracking the WPA PSK Using Aircrack-ng_

![](https://skillsforall.com/content/eh/1.0/courses/content/m5/en-US/assets/08e546758140a5db6cc55dfd5036c4d505bf1ab1.png)




