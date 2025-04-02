### 1. Creating a New User

To create a new user and their home directory, use the `useradd` command with the `-m` option.

#### Purpose and Usage

The `useradd` command adds a new user to the system, and the `-m` option creates the user’s home directory. This is important for ethical hacking because it allows you to set up isolated environments for different tasks or users.

#### Command:

```sh
sudo useradd -m [username]
```

Replace `[username]` with your desired username.

#### Example:

```sh
sudo useradd -m john
```

This command creates a new user named “john” and sets up a home directory at `/home/john`.

### 2. Setting a Password for the New User

After creating the new user, the next step is to set a password using the `passwd` command.

#### Purpose and Usage

The `passwd` command sets or changes the password for a user. Setting a strong password is vital to secure user accounts against unauthorized access.

#### Command:

```sh
sudo passwd [username]
```

#### Example:

```sh
sudo passwd john
```

You will be prompted to enter and confirm the new password for “john”.

### 3. Let’s Add A User To The Sudo Group

To grant administrative privileges to the new user, and then use the `usermod` command to add a user to the sudo group.

#### Purpose and Usage

The `usermod` command modifies a user account. The `-a -G` options add the user to specified groups without removing them from other groups. This is crucial in hacking and cyber security for executing privileged commands.

#### Command:

```sh
sudo usermod -aG sudo [username]
```

#### Example:

```sh
sudo usermod -aG sudo john
```

This command adds “john” to the sudo group, allowing him to execute commands with administrative privileges.

**Verify the New User:** To ensure the user has been created and added to the necessary groups, use the **id** command: `id john` 
This will show you the user’s UID (user ID), GID (group ID), and the groups they belong to.

### 4. Changing the Default Shell to Bash

Ensure the new user has the bash shell by default using the `chsh` command.

#### Purpose and Usage

The `chsh` command changes the user’s login shell. Bash is commonly used for its powerful scripting capabilities, which are essential for hacking tasks.

#### Command:

```sh
sudo chsh -s /bin/bash [username]
```

#### Example:

```sh
sudo chsh -s /bin/bash john
```

This sets the default shell for “john” to bash.

### 5. Switching to the Newly Created User

Use the `su` command to switch to the newly created user.

#### Purpose and Usage

The `su` command allows you to switch to another user’s account within a session. This is useful for testing user-specific configurations and permissions.

#### Command:

```sh
su [username]
```

#### Example:

```sh
su john
```

This switches the current session to the user “john”.

### 6. Updating Kali Linux

Keeping your system updated is critical for security and performance. Use the following command to update and upgrade Kali Linux.

#### Command:

```sh
sudo apt-get update && sudo apt-get upgrade
```

### 7. Removing a User

If you need to delete a user from your Kali Linux system, use the `userdel` command:

```sh
sudo userdel <username>
```

This command will remove the user but will not delete their home directory. To remove the user and their home directory, use:

```sh
sudo userdel -r <username>
```

---

### Modify the Kali Username 

Instead we could modify the username. 

**Understanding User ID and Username in Linux**

But before changing the username or user ID we shall be aware of what is the user ID or username.

- **User ID (UID):** A unique identifier assigned to each user on a Linux system. It is used by the system to differentiate between users, even if they share the same username.
- **Username:** A human-readable identifier assigned to a user for login purposes.

### 1. To get the user id of a user

```sh
cat /etc/passwd | grep oldusername
```

Replace the ‘**oldusername’** with the name of the user you want to use.

![get username and id in Kali Linux](https://media.geeksforgeeks.org/wp-content/uploads/20200619150853/get_username_and_id.png)

This will display us a few details of the user along with the userid.

### 2. To change the Username

To change the username of an existing user, use the `usermod` command with the `-l` option:

```sh
usermod -l newusername oldusername
```

Replace the ‘**oldusername’** with the name of the user you want to change.

- **oldusername:** The current username you want to change.
- **newusername:** The new username you wish to assign to the user.

![change username](https://media.geeksforgeeks.org/wp-content/uploads/20200619150922/change_username.png)

This command will change the username of the oldusername to the newusername but will not change the files and userID of the user.

### **To change the UserID**

We use `usermod` command along with `-u` parameter in order to change the **userid** of a particular user.

```sh
usermod -u 1234 newusername
```

- Replace the **newusername** with the username you want to change the id of.
- Replace **1234** with the id you want to set for the user.

![change_user_id](https://media.geeksforgeeks.org/wp-content/uploads/20200619150948/change_user_id.png)

This command will change the **userid** of the user from the default one to **1234**.

Changing the username with the `usermod -l` command does not affect the user’s files or permissions. However, if you want to rename the user’s home directory to match the new username, you will need to do so manually using the mv command and update the home directory path with: 

```sh
usermod -d
```

It is not recommended to change the username or UID while the user is logged in, as it may cause issues with running processes. You should log the user out first, or forcefully terminate their session using:

```sh
pkill -u username
```

Then proceed with the username or UID change.

After changing the UID, you must update the ownership of the user’s files. You can do this by running the following command:

```sh
sudo find / -user oldUID -exec chown -h newUID {} \;
```

 This command updates the ownership of all files and directories associated with the **old UID** to the **new UID**.

---

Tools: **PimpMyKali:** https://github.com/Dewalt-arch/pimpmykali
- If you have an error at the ghidra install spot, try giving it extra RAM and CPU. This fixed my problem and it installed correctly after. 
- I also enabled 3d acceleration and gave it 256MB video memory

How to get full screen on BSPWM:
- disabling the mini-toolbar under user interface settings

**Metasploitable**
1. Make a standard Linux VM. 
- Type: Linux
- Sub Type: Other Linux
- Verison: Other Linux (64-bit)

2. Add the metasploitable image as the hardrive in Settings > Storage > Attributes Hard Disk. Now choose the metasploitable Disk
- Add it to the options so you can select it. You're looking for it's `.vmdk` file in it's download folder
- You can give it 1024 MB Base Memory and 1 CPU

How to shut down: **sudo power off**

Make sure they are on NAT Network

Resources: 
Bash command explanations: https://explainshell.com/

**VirtualBox**

To return ownership of keyboard and **mouse** **to** your host operating system, **VirtualBox** reserves a special key on your keyboard for itself: the "host key". By default, this is the right Control key on your keyboard; on a Mac host, the default host key is the left Command key.