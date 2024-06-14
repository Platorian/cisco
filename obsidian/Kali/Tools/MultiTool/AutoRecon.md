

Note that if you want to run AutoRecon using sudo (required for faster SYN scanning and UDP scanning), you have to use _one_ of the following examples:

```shell
sudo env "PATH=$PATH" autorecon [OPTIONS]
sudo $(which autorecon) [OPTIONS]
```

## Cheat Sheet
As discussed earlier, AutoRecon is an Enumeration tool. It requires a target or a set of targets. This can be IP Addresses, or CIDR Notations or hostnames as well. When triggered with the -h parameter it shows the user a help screen as depicted in the image below. It tells us that we can provide a target directly or if you have multiple targets. Then you can put the target IP Addresses into a file and then pass it as a parameter with the -t flag.

autorecon -h

![](https://1.bp.blogspot.com/-c0ukQMuB3ok/YFtTBYj0xLI/AAAAAAAAu8k/PQgOQq9K5Ksh55wc3TZnD1cRd5GcUSQUgCLcBGAsYHQ/s16000/6.png)

As we saw earlier that AutoRecon has a large number of parameters but most of these can be left default. The key thing to remember is the required argument “target”. It can be a space-separated list of either IP Addresses or CIDR Notations or even resolvable hostnames. We can also create a file with the targets in it. It should be in the format of one per new line. We need to reference that target file using the -t argument.

autorecon 192.168.126.132

![](https://1.bp.blogspot.com/--S72-0-p58o/YFtTFbT0PwI/AAAAAAAAu8o/XEh_EgdkVcQfF11A1zpMcDPn6exx_UnpQCLcBGAsYHQ/s16000/7.png)

### **Multi-Target Scan**

By default, AutoRecon will scan 5 target hosts at the same time but that number can be toggled using the -ct parameter. This is basically the number of targets getting scanned at the same time. To demonstrate, we collected some IP Address in the network and then entered them into a text file. Then used that text file to provide targets to AutoRecon.

cat target.txt
autorecon -t targets.txt

![](https://1.bp.blogspot.com/-wfXbq8UoRxY/YFtTJJJO4EI/AAAAAAAAu8w/OVCziimImWAi40iR1ToZAHuYe8o3lW2QQCLcBGAsYHQ/s16000/8.png)

### **Concurrent Scan**

Another parameter to look at is the -cs which is the Concurrent Scans. This is basically the number of scans that are being performed per target. By default, the setting is set to 10. When changed to any other value such as 2 then only 2 scans will be performed per host. Once it is finished it will run another instance of the scan.

Hence, each of the targets that are being scanned will at least have 3 nmap scans running, basically a full TCP, a top 1000 TCP and a top 20 UDP.

autorecon -cs 5 192.168.126.132

![](https://1.bp.blogspot.com/-gOkCnSx4OYk/YFtTMqNFVUI/AAAAAAAAu80/GvV35ioaRMkbpt68XibeJ5g-MGPme_PyACLcBGAsYHQ/s16000/9.png)

### **Single Target Argument**

The –single-target argument enables the users to scan the host but changing the directory structure. It means that the AutoRecon will only scan the target but no directory will be created for that particular target.

autorecon 192.168.126.133 --single-target

![](https://1.bp.blogspot.com/-3LCGRBcCXpY/YFtTRUhbRxI/AAAAAAAAu88/6_mkctY9Q6kwA0I53I__EpRLAg77U8kyQCLcBGAsYHQ/s16000/10.png)

Due to the use of the –single-target parameter, it didn’t create a directory by the name of the target inside the results folder.

ls -la results
cat results/report/notes.txt

![](https://1.bp.blogspot.com/-7a9nNJnKa-Q/YFtTVajp_GI/AAAAAAAAu9E/NlUVHshOEWAzlJ3uQLwKhLpSqU1-Gc5kwCLcBGAsYHQ/s16000/11.png)

### **Heartbeat Argument**

The –heartbeat argument allows the users to configure the duration of the updates that are provided by AutoRecon. By default, it is 60 seconds. It means AutoRecon will update the user what is going on and which scans are running every 60 seconds.

autorecon 192.168.126.133 --heartbeat 5

![](https://1.bp.blogspot.com/-b6XspKk6aCc/YFtTZlzIlzI/AAAAAAAAu9I/6mkX0nylJusl1RtQ7VxYQHsa6hJmeTk1wCLcBGAsYHQ/s16000/12.png)

### **Nmap Arguments**

Now here we have two options, we can either replace our own parameters instead of the ones that are provided here, by using the –nmap argument and passing the parameters that we want to perform.

autorecon 192.168.126.133 --nmap sV

![](https://1.bp.blogspot.com/-qz80Q_zLltM/YFtTicqHi_I/AAAAAAAAu9Q/ryipLgdej5Ud4MZyqL1MxIUy_Q9vtf32wCLcBGAsYHQ/s16000/13.png)

In the previous step, we added the -sV argument to the nmap scan, now in order to check we will read the commands.log file to see that it indeed uses the -sV parameter while scanning. It should also be noted that the default parameters -vv, –reason, -Pn are not used.

cat results/192.168.126.133/scans/_commands.log

![](https://1.bp.blogspot.com/-iMBzgrdCmpk/YFtTnHbmtNI/AAAAAAAAu9Y/GAYv_2yPSUwYGL0tUFHL-c2yhwHbddkbACLcBGAsYHQ/s16000/14.png)

We can use the –nmap-append option to add our parameters but not override the AutoRecon default parameters. It will append our parameters to it.

autorecon 192.168.126.133 --nmap-append sS

![](https://1.bp.blogspot.com/-Fdzt_L6x3PM/YFtTsbACdLI/AAAAAAAAu9c/wO_MhDnDuLQV_DWj6FrnJWjv0fMfujm6gCLcBGAsYHQ/s16000/15.png)

Let’s again check if the argument we added i.e., -sS has been appended with -vv, –reason, -Pn. It can be confirmed form a detailed read of the commands.log file.

cat results/192.168.126.133/scans/_commands.log

![](https://1.bp.blogspot.com/-WKuC-FSSqmw/YFtTz5Qg_OI/AAAAAAAAu9g/Zi-noZbrS_gNVg8pBk6G4h6BDMQJprH7gCLcBGAsYHQ/s16000/16.png)

### **Verbosity Scans**

AutoRecon has different levels of verbosity. By default, it doesn’t run with any verbosity that means it just informs the user when it initiates a scan and when the scan finishes, it does not provide any details regarding those tasks. With the -v argument, it will be telling the user more about the scans like it will show the complete commands it is running, it will also provide more information about the services that were detected and are being further enumerated.

autorecon -v 192.168.154.130

![](https://1.bp.blogspot.com/-eCJsw0uJ_tc/YFtT_xs6_YI/AAAAAAAAu9s/TlH8m0y1ozc9-O8zWFUocGwKAgRYm3RiwCLcBGAsYHQ/s16000/17.png)

You can also use -vv which stands for Very Verbose. It is not recommended as it will print all the scans and their results in real-time. It clutters up the screen with too much information.

autorecon -vv 192.168.154.130

![](https://1.bp.blogspot.com/-gMIUxlk3vRc/YFtUEU9oT-I/AAAAAAAAu90/NxRn6H2tS6EpoPah0r7VrN3G1sLkXJ0ZQCLcBGAsYHQ/s16000/18.png)

### **Only Scans Dir Argument**

AutoRecon creates a bunch of directories based on the type of evidence it collects. But there are some situations where all that is required is the scan results. This is where the Only Scans Dir argument comes into action. This prevents the creation of other directories.

autorecon 192.168.154.130 --only-scans-dir