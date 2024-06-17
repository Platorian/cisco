Install

Update system

Start dhcpcd
```
dhccpd
```

Update
```
pacman -Sy
```

Install
```
blackarch-install
```

Keyboard
```
loadkeys uk
```

Language
```
en_GB.UTF-8
```

After install: 
- Shut down and remove ISO
- Restart machine and insert guest additions
- Log in
- Upgrade guest additions

Add sudoers file
```
USER_NAME   ALL=(ALL) ALL
```

**_Caution_** this could be bad advice:
***if the file doesn't exist, re-install sudo***             

# Sudo

## [How To Obtain Root Privileges](https://www.digitalocean.com/community/tutorials/how-to-edit-the-sudoers-file#how-to-obtain-root-privileges)[](https://www.digitalocean.com/community/tutorials/how-to-edit-the-sudoers-file#how-to-obtain-root-privileges)

There are three basic ways to obtain **root** privileges, which vary in their level of sophistication.

### [Logging In As Root](https://www.digitalocean.com/community/tutorials/how-to-edit-the-sudoers-file#logging-in-as-root)[](https://www.digitalocean.com/community/tutorials/how-to-edit-the-sudoers-file#logging-in-as-root)

The simplest and most straightforward method of obtaining **root** privileges is to directly log into your server as the **root** user.

If you are logging into a local machine (or using an out-of-band console feature on a virtual server), enter `root` as your username at the login prompt and enter the **root** password when asked.

If you are logging in through SSH, specify the **root** user prior to the IP address or domain name in your SSH connection string:

```
ssh root@server_domain_or_ip

```

If you have not set up SSH keys for the **root** user, enter the **root** password when prompted.

### [Using `su` to Become Root](https://www.digitalocean.com/community/tutorials/how-to-edit-the-sudoers-file#using-su-to-become-root)[](https://www.digitalocean.com/community/tutorials/how-to-edit-the-sudoers-file#using-su-to-become-root)

Logging in directly as **root** is usually not recommended, because it is easy to begin using the system for non-administrative tasks, which is dangerous.

The next way to gain super-user privileges allows you to become the **root** user at any time, as you need it.

We can do this by invoking the `su` command, which stands for “substitute user”. To gain **root** privileges, type:

```
su

```

You will be prompted for the **root** user’s password, after which, you will be dropped into a **root** shell session.

When you have finished the tasks which require **root** privileges, return to your normal shell by typing:

```
exit

```

### [Using `sudo` to Execute Commands as Root](https://www.digitalocean.com/community/tutorials/how-to-edit-the-sudoers-file#using-sudo-to-execute-commands-as-root)[](https://www.digitalocean.com/community/tutorials/how-to-edit-the-sudoers-file#using-sudo-to-execute-commands-as-root)

The final, way of obtaining **root** privileges that we will discuss is with the `sudo` command.

The `sudo` command allows you to execute one-off commands with **root** privileges, without the need to spawn a new shell. It is executed like this:

```
sudo command_to_execute

```

Unlike `su`, the `sudo` command will request the password of the _current_ user, not the **root** password.

Because of its security implications, `sudo` access is not granted to users by default, and must be set up before it functions correctly. Check out our _How To Create a New Sudo-enabled User_ quickstart tutorials for [Ubuntu](https://www.digitalocean.com/community/tutorials/how-to-create-a-new-sudo-enabled-user-on-ubuntu-20-04-quickstart) and [CentOS](https://www.digitalocean.com/community/tutorials/how-to-create-a-new-sudo-enabled-user-on-centos-8-quickstart) to learn how to set up a `sudo`-enabled user.

In the following section, we will discuss how to modify the `sudo` configuration in greater detail.

## [What is Visudo?](https://www.digitalocean.com/community/tutorials/how-to-edit-the-sudoers-file#what-is-visudo)

The `sudo` command is configured through a file located at `/etc/sudoers`.

**Warning:** Never edit this file with a normal text editor! Always use the `visudo` command instead!

Because improper syntax in the `/etc/sudoers` file can leave you with a broken system where it is impossible to obtain elevated privileges, it is important to use the `visudo` command to edit the file.

The `visudo` command opens a text editor like normal, but it validates the syntax of the file upon saving. This prevents configuration errors from blocking `sudo` operations, which may be your only way of obtaining **root** privileges.

Traditionally, `visudo` opens the `/etc/sudoers` file with the `vi` text editor. Ubuntu, however, has configured `visudo` to use the `nano` text editor instead.

If you would like to change it back to `vi`, issue the following command:

```
sudo update-alternatives --config editor

```

```
OutputThere are 4 choices for the alternative editor (providing /usr/bin/editor).

  Selection    Path                Priority   Status
------------------------------------------------------------
* 0            /bin/nano            40        auto mode
  1            /bin/ed             -100       manual mode
  2            /bin/nano            40        manual mode
  3            /usr/bin/vim.basic   30        manual mode
  4            /usr/bin/vim.tiny    10        manual mode

Press <enter> to keep the current choice[*], or type selection number:
```

Select the number that corresponds with the choice you would like to make.

On CentOS, you can change this value by adding the following line to your `~/.bashrc`:

```
export EDITOR=`which name_of_editor`

```

Source the file to implement the changes:

```
. ~/.bashrc

```

After you have configured `visudo`, execute the command to access the `/etc/sudoers` file:

```
sudo visudo

```

## [How To Modify the Sudoers File](https://www.digitalocean.com/community/tutorials/how-to-edit-the-sudoers-file#how-to-modify-the-sudoers-file)[](https://www.digitalocean.com/community/tutorials/how-to-edit-the-sudoers-file#how-to-modify-the-sudoers-file)

You will be presented with the `/etc/sudoers` file in your selected text editor.

I have copied and pasted the file from Ubuntu 20.04, with comments removed. The CentOS `/etc/sudoers` file has many more lines, some of which we will not discuss in this guide.

/etc/sudoers

```
Defaults        env_reset
Defaults        mail_badpass
Defaults        secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin"

root    ALL=(ALL:ALL) ALL

%admin ALL=(ALL) ALL
%sudo   ALL=(ALL:ALL) ALL

#includedir /etc/sudoers.d
```

Let’s take a look at what these lines do.

### [Default Lines](https://www.digitalocean.com/community/tutorials/how-to-edit-the-sudoers-file#default-lines)[](https://www.digitalocean.com/community/tutorials/how-to-edit-the-sudoers-file#default-lines)

The first line, `Defaults env_reset`, resets the terminal environment to remove any user variables. This is a safety measure used to clear potentially harmful environmental variables from the `sudo` session.

The second line, `Defaults mail_badpass`, tells the system to mail notices of bad `sudo` password attempts to the configured `mailto` user. By default, this is the **root** account.

The third line, which begins with `Defaults secure_path=...`, specifies the `PATH` (the places in the filesystem the operating system will look for applications) that will be used for `sudo` operations. This prevents using user paths which may be harmful.

### [User Privilege Lines](https://www.digitalocean.com/community/tutorials/how-to-edit-the-sudoers-file#user-privilege-lines)[](https://www.digitalocean.com/community/tutorials/how-to-edit-the-sudoers-file#user-privilege-lines)

The fourth line, which dictates the **root** user’s `sudo` privileges, is different from the preceding lines. Let’s take a look at what the different fields mean:

- `==root== ALL=(ALL:ALL) ALL` The first field indicates the username that the rule will apply to (**root**).
    
- `root ==ALL===(ALL:ALL) ALL` The first “ALL” indicates that this rule applies to all hosts.
    
- `root ALL=(==ALL==:ALL) ALL` This “ALL” indicates that the **root** user can run commands as all users.
    
- `root ALL=(ALL:==ALL==) ALL` This “ALL” indicates that the **root** user can run commands as all groups.
    
- `root ALL=(ALL:ALL) ==ALL==` The last “ALL” indicates these rules apply to all commands.
    

This means that our **root** user can run any command using `sudo`, as long as they provide their password.

### [Group Privilege Lines](https://www.digitalocean.com/community/tutorials/how-to-edit-the-sudoers-file#group-privilege-lines)[](https://www.digitalocean.com/community/tutorials/how-to-edit-the-sudoers-file#group-privilege-lines)

The next two lines are similar to the user privilege lines, but they specify `sudo` rules for groups.

Names beginning with a `%` indicate group names.

Here, we see the **admin** group can execute any command as any user on any host. Similarly, the **sudo** group has the same privileges, but can execute as any group as well.

### [Included /etc/sudoers.d Line](https://www.digitalocean.com/community/tutorials/how-to-edit-the-sudoers-file#included-etc-sudoers-d-line)[](https://www.digitalocean.com/community/tutorials/how-to-edit-the-sudoers-file#included-etc-sudoers-d-line)

The last line might look like a comment at first glance:

/etc/sudoers

```
. . .

#includedir /etc/sudoers.d
```

It _does_ begin with a `#`, which usually indicates a comment. However, this line actually indicates that files within the `/etc/sudoers.d` directory will be sourced and applied as well.

Files within that directory follow the same rules as the `/etc/sudoers` file itself. Any file that does not end in `~` and that does not have a `.` in it will be read and appended to the `sudo` configuration.

This is mainly meant for applications to alter `sudo` privileges upon installation. Putting all of the associated rules within a single file in the `/etc/sudoers.d` directory can make it easy to see which privileges are associated with which accounts and to reverse credentials easily without having to try to manipulate the `/etc/sudoers` file directly.

As with the `/etc/sudoers` file itself, you should always edit files within the `/etc/sudoers.d` directory with `visudo`. The syntax for editing these files would be:

```
sudo visudo -f /etc/sudoers.d/file_to_edit

```

## [How To Give a User Sudo Privileges](https://www.digitalocean.com/community/tutorials/how-to-edit-the-sudoers-file#how-to-give-a-user-sudo-privileges)[](https://www.digitalocean.com/community/tutorials/how-to-edit-the-sudoers-file#how-to-give-a-user-sudo-privileges)

The most common operation that users want to accomplish when managing `sudo` permissions is to grant a new user general `sudo` access. This is useful if you want to give an account full administrative access to the system.

The easiest way of doing this on a system set up with a general purpose administration group, like the Ubuntu system in this guide, is actually to add the user in question to that group.

For example, on Ubuntu 20.04, the `sudo` group has full admin privileges. We can grant a user these same privileges by adding them to the group like this:

```
sudo usermod -aG sudo username

```

The `gpasswd` command can also be used:

```
sudo gpasswd -a username sudo

```

These will both accomplish the same thing.

On CentOS, this is usually the `wheel` group instead of the `sudo` group:

```
sudo usermod -aG wheel username

```

Or, using `gpasswd`:

```
sudo gpasswd -a username wheel

```

On CentOS, if adding the user to the group does not work immediately, you may have to edit the `/etc/sudoers` file to uncomment the group name:

```
sudo visudo

```

/etc/sudoers

```
. . .
%wheel ALL=(ALL) ALL
. . .
```

## [How To Set Up Custom Rules](https://www.digitalocean.com/community/tutorials/how-to-edit-the-sudoers-file#how-to-set-up-custom-rules)[](https://www.digitalocean.com/community/tutorials/how-to-edit-the-sudoers-file#how-to-set-up-custom-rules)

Now that we have gotten familiar with the general syntax of the file, let’s create some new rules.

### [How To Create Aliases](https://www.digitalocean.com/community/tutorials/how-to-edit-the-sudoers-file#how-to-create-aliases)[](https://www.digitalocean.com/community/tutorials/how-to-edit-the-sudoers-file#how-to-create-aliases)

The `sudoers` file can be organized more easily by grouping things with various kinds of “aliases”.

For instance, we can create three different groups of users, with overlapping membership:

/etc/sudoers

```
. . .
User_Alias		GROUPONE = abby, brent, carl
User_Alias		GROUPTWO = brent, doris, eric,
User_Alias		GROUPTHREE = doris, felicia, grant
. . .
```

Group names must start with a capital letter. We can then allow members of `GROUPTWO` to update the `apt` database by creating a rule like this:

/etc/sudoers

```
. . .
GROUPTWO	ALL = /usr/bin/apt-get update
. . .
```

If we do not specify a user/group to run as, as above, `sudo` defaults to the **root** user.

We can allow members of `GROUPTHREE` to shutdown and reboot the machine by creating a “command alias” and using that in a rule for `GROUPTHREE`:

/etc/sudoers

```
. . .
Cmnd_Alias		POWER = /sbin/shutdown, /sbin/halt, /sbin/reboot, /sbin/restart
GROUPTHREE	ALL = POWER
. . .
```

We create a command alias called `POWER` that contains commands to power off and reboot the machine. We then allow the members of `GROUPTHREE` to execute these commands.

We can also create “Run as” aliases, which can replace the portion of the rule that specifies the user to execute the command as:

/etc/sudoers

```
. . .
Runas_Alias		WEB = www-data, apache
GROUPONE	ALL = (WEB) ALL
. . .
```

This will allow anyone who is a member of `GROUPONE` to execute commands as the `www-data` user or the `apache` user.

Just keep in mind that later rules will override earlier rules when there is a conflict between the two.

### [How To Lock Down Rules](https://www.digitalocean.com/community/tutorials/how-to-edit-the-sudoers-file#how-to-lock-down-rules)[](https://www.digitalocean.com/community/tutorials/how-to-edit-the-sudoers-file#how-to-lock-down-rules)

There are a number of ways that you can achieve more control over how `sudo` reacts to a call.

The `updatedb` command associated with the `mlocate` package is relatively harmless on a single-user system. If we want to allow users to execute it with **root** privileges _without_ having to type a password, we can make a rule like this:

/etc/sudoers

```
. . .
GROUPONE	ALL = NOPASSWD: /usr/bin/updatedb
. . .
```

`NOPASSWD` is a “tag” that means no password will be requested. It has a companion command called `PASSWD`, which is the default behavior. A tag is relevant for the rest of the rule unless overruled by its “twin” tag later down the line.

For instance, we can have a line like this:

/etc/sudoers

```
. . .
GROUPTWO	ALL = NOPASSWD: /usr/bin/updatedb, PASSWD: /bin/kill
. . .
```

Another helpful tag is `NOEXEC`, which can be used to prevent some dangerous behavior in certain programs.

For example, some programs, like `less`, can spawn other commands by typing this from within their interface:

```
!command_to_run
```

This basically executes any command the user gives it with the same permissions that `less` is running under, which can be quite dangerous.

To restrict this, we could use a line like this:

/etc/sudoers

```
. . .
username	ALL = NOEXEC: /usr/bin/less
. . .
```

## [Miscellaneous Information](https://www.digitalocean.com/community/tutorials/how-to-edit-the-sudoers-file#miscellaneous-information)[](https://www.digitalocean.com/community/tutorials/how-to-edit-the-sudoers-file#miscellaneous-information)

There are a few more pieces of information that may be useful when dealing with `sudo`.

If you specified a user or group to “run as” in the configuration file, you can execute commands as those users by using the `-u` and `-g` flags, respectively:

```
sudo -u run_as_user command
sudo -g run_as_group command

```

For convenience, by default, `sudo` will save your authentication details for a certain amount of time in one terminal. This means you won’t have to type your password in again until that timer runs out.

For security purposes, if you wish to clear this timer when you are done running administrative commands, you can run:

```
sudo -k

```

If, on the other hand, you want to “prime” the `sudo` command so that you won’t be prompted later, or to renew your `sudo` lease, you can always type:

```
sudo -v

```

You will be prompted for your password, which will be cached for later `sudo` uses until the `sudo` time frame expires.

If you are simply wondering what kind of privileges are defined for your username, you can type:

```
sudo -l

```

This will list all of the rules in the `/etc/sudoers` file that apply to your user. This gives you a good idea of what you will or will not be allowed to do with `sudo` as any user.

There are many times when you will execute a command and it will fail because you forgot to preface it with `sudo`. To avoid having to re-type the command, you can take advantage of a bash functionality that means “repeat last command”:

```
sudo !!

```

The double exclamation point will repeat the last command. We preceded it with `sudo` to quickly change the unprivileged command to a privileged command.

For some fun, you can add the following line to your `/etc/sudoers` file with `visudo`:

```
sudo visudo

```

/etc/sudoers

```
. . .
Defaults	insults
. . .
```

This will cause `sudo` to return a silly insult when a user types in an incorrect password for `sudo`. We can use `sudo -k` to clear the previous `sudo` cached password to try it out:

```
sudo -k
sudo ls

```

```
Output[sudo] password for demo:    # enter an incorrect password here to see the results
Your mind just hasn't been the same since the electro-shock, has it?
[sudo] password for demo:
My mind is going. I can feel it.
```
### Untested guest additions

To install VirtualBox Guest Additions 7 14 on Linux BlackArch, follow these steps: 
1. Start the virtual machine in which BlackArch is installed. 
2. In the virtual machine window, click on Devices > Insert Guest Additions CD image. 
3. If a dialogue box appears, click on “Run”. 
4. Enter your root password when prompted. 
5. Wait for the installation to complete. 
6. Once the installation is complete, click on Devices > Optical Drives > Remove disk from virtual drive. 
7. Open the terminal and switch to the root user account. 
8. Mount the VirtualBox Guest Additions ISO file by running the following command: mount /dev/cdrom /mnt 
9. Change to the mounted directory by executing the following command: cd /mnt 
10. Install the necessary build tools by running the following command: pacman -S base-devel 
11. Change to the directory containing the VirtualBox Guest Additions installer by executing the following command: cd LinuxAdditions 
12. Install the Guest Additions by running the following command: ./VBoxLinuxAdditions.run 
13. Wait for the installation to complete. 
14. Once the installation is complete, reboot the virtual machine by running the following command: reboot 
15. After rebooting, the VirtualBox Guest Additions should be installed and working. You can check by opening the virtual machine window, going to the Devices menu, and checking if “Shared Clipboard” and “Drag and Drop” are enabled.

Suggestions

# My Fix 
I just needed to start dhclient and i was able to get a connection. I could then finish the above steps, but i still don't think it worked :) 

**Signature Unkown**
1st option:  

rm -rf /etc/pacman.d/gnupg  
pacman-key --init  
pacman-key --populate archlinux blackarch  
pacman-key --update --keyserver keyserver.ubuntu.com
#### Works i think after these steps and finish the above steps.


|                                                                                                                                                                                                                                                                                                                                                                 |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| <br>i found a way to solve this while i was using arch linux, so if u have the same problem:<br><br>1. boot to arch iso<br>2. mount the partition that your os is installed on: `mount /dev/sdaX /mnt`<br>3. chroot to the system: `arch-chroot /mnt`<br>4. download networkmanager or anything u need: `pacman -S iwd dhclient`<br>5. DONE ! now u can reboot. |


---

