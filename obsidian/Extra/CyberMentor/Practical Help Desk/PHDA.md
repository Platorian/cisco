## Install Windows Server

_I gave it 8gb RAM and 2 CPU_

_If a step is missing it's probably because you can hit next and leave the default options_

1. Standard evaluation desktop experience
2. Custom installation
3. Pick required drive. In this case it only has the one drive that we gave it for our VM machine
4. Set desired password
5. Use input, then keyboard option on virtualbox to input Ctl-Alt-Del to unlock the machine
6. Install virtualbox guest utils 
	- Try using the fast way - devices insert guest additions CD image
	- else: in the server, click folder to get access to the CD drive
	- right click and run as admin VBoxWindowsEditions-amd64 
	- Reboot machine
	- Adjust window size on virtualbox and make sure Auto-Resize Guest Display is enabled
	- Using fullscreen: right control + f
	- Optionally, take a snap shot to save progress

## Configure Windows Server

1. Change sever name: search for _view my pc name_ then select _rename this PC_. Here i use DC01 for Domain Controller 01
2. Set Server to be a Domain Controller: 
	- Click manage and select _add roles and features_ 
	- Role-based or feature-based installation
	- Select required server. Here it would be DC01
	- Server roles: Active Directory Domain Services. Click _add features_
	- In confirmation select Restart server automatically if required at the top
	- Now we can hit install
	- Now before leaving we have to select _Promote server to domain controller_ which is written in blue text
	- Add new forest
	- Root Domain Name: LAB.local (can be whatever you want as long as it's .local) 
	- Select a password
	- Wait for the prerequisites check to finish
	- Install
	- The server will reboot and you should be able to login in as the domain admin
3. Add active directory certificate services (adds secure versions of protocols)
	- Configure active directory certificate services (again this is in blue text)
	- check the box for certificate authority
	- everything else can be left as default

## Create Domain Users

1. Click tools and select active directory users and computers (you should see our domain LAB.local)
2. Organise by adding a new organisational unit for groups and put everything but the guest and admin user into it
	- Right click LAB.local 
	- Select new and select organisational unit 
	- Name it Groups
	- Shift click everything as explained above
3. Add users by right clicking where the guest and admin account are located
	- Select new then user
	- Add required names for users
	- Create a password for them
	- Select if you want their password to never expire, or for them to have to change it on logon etc (for this i set it to _never expire_ because it's my lab)
	- You can now right click on the new user and select copy to make more users

## Attach the Windows 11 VM to Domain

1. Add a AD network in virtualbox
	- Select file and select tools
	- Click network manager
	- Move to _NAT network_ and click create
	- Name it whatever you want (here i use ADNetwork)
	- Set the win11 and server to the new NAT network
2. Set static IP for both the server and win 11
	- On the server
	- Open cmd and type ipconfig to see the network details
	- Right click the globe on the task bar to get to the network centre 
	- Click properties to set the static IP
	- Double click IPV4
	- Here i set it to the same one as that shows up in our _ipconfig_ command results
	- Set DNS to local 127.0.0.1
	- Rerun _ipconfig_ to make sure it set properly
3. Rename win11 PC to WS01 (workstation 01) and set the static ip
	- Run ipconfig again
	- Set the IP details sequentially 
	- Now i set the DNS to the IP of the Domain Controller, which would be one lower than the workstation (DC01 - 10.0.2.16, WS01 - 10.0.2.15)
4. Attach to the domain
	- Access work or school
	- Click connect in blue
	- Join device to a local Active Directory domain
	- Now it will ask you the domain name which in this case is LAB.local
	- Now we need to put in the credentials of the domain admin which would be administrator and the password
	- Set as standard user
	- Restart
5. You can now login with the users that were created earlier

## Organisational units (OU)

1. Accessed in Tools > Active Directory Users and Computers
2. Right click on the domain (LAB.local) > New > Organisational Unit
3. In the lab i create three OUs for Engineering, Management, and IT. Inside IT i create one more for Administrators 
4. To create a group i right click where the names are, for example the Administrator account, and select New > Group
5. In this lab i name the group _EngineeringShare_ and leave the defaults (group type Distribution is used for emails)
6. Now i can double click on the new object to bring up the options
7. Click on members to add accounts to the group (here i put both members of the engineering group and a member member of management, Jared Dunn)
8. I can use check names feature to find the account easier and also finish the account name providing there isn't more than one account with the same name
9. Click _apply_ then _ok_ to exit
10. Set up a share folder:
	- Files and Storage Services
	- Click on Shares
	- Tasks and select New Share
	- SMB Share - Quick
	- In share name i use EngineeringShare
	- Customise permissions and remove both of the users under Principle
	- Disable inheritance (convert)
	- Add and select principle and type in the name of the group (EngineeringShare)
	- I give it write permissions and click ok
	- Now i can click create to make the share and then close
11. Joining the share on the Win11 VM:
	- Login as jdunn
	- On the desktop click the folder on the task bar 
	- In the search bar type in the location of the share, (given to us in an earlier step) in this case it's: `\\DC01\EngineeringShare` which should populate as you start typing
12. Map the new share:
	- Right click on This PC
	- Map network drive
	- Pick a drive (i leave this as default)
	- Now i can either type the new share in or use the browse feature, and hit finish
13. If you try logging in and repeating these steps as a user that is not in the share group you'll notice that you get an error saying you do not have the permissions

## Group Policy Objects (GPO)

**Set Specific Desktop Background:**
1. Create a background in paint:
	- Open paint and then use the resize image to be 1920x1080
	- I can the use the **A** button to add text (hold left click to create a text box)
	- Save as JPEG (i save it to desktop so i can find it easily)
2. Copy the new image to a common share used for desktop backgrounds
	- On the server click on File and Share Services > Shares
	- Right click on select open share for NETLOGON
	- Copy and paste the JPEG into the NETLOGON that we just opened
3. Create the GPO:
	- Tools > Group Policy Management
	- We want this to be just for engineering so we expand the Forest and go into LAB.local then right click on Engineering and select Create GPO in this domain and link it here
	- Name the GPO (here i use SetEnginneringBackground)
	- Right click and make sure it's enforced
	- Right click again and select edit. This is where we select what policy we want to enforce, here, of course, we want to set a special Engineering background
	- It's inside User Configuration > Policies > Administrative Templates > Desktop > Desktop > Desktop Wallpaper and double click on desktop wallpaper to open options
	- Click enabled and paste the JPEG location into Wallpaper Name (when you cop the JPEG choose copy as path) and remove the quotations
	- Click OK

**Resetting AD Passwords:**
1. Add a GPO for the whole domain
	- Right click on LAB.local
	- Create a GPO
	- Here i name it AccountLockoutPolicy
	- Right click and edit to open the options
	- Computer Configuration > Policies > Windows Settings > Security Settings > Account Policies > Account Lockout Policy > and double click on Account Lockout Threshold
	- Check the box for define this policy setting and select how many attempts a user has before the account is locked (here i use 3)
	- Apply then OK
	- I leave the other options as default
	- Right click again and enforce the policy
2. Now i test the policy with a user by entering the wrong password three times
3. Back on the Domain Controller i open Tools > Active Directory Users and Computers to gain access to the users
4. I can search for a user by selecting the folder with a spyglass on the top part of the window called Find Objects
5. Here i can start typing the name and hit Find Now to bring up the users. Make sure you are searching the entire directory which you can select near the top of the window
6. Once you have the correct user you can right click and select Reset Password
7. Make sure the box that says unlock account is checked
8. Enter the users new password (because i set the users password to never expire, you may need to turn that off for this part)
9. Right click on the user again and select properties to remove the _password never expires_ option, and repeat the above step. If you don't do this then the box to make the user have to change their password at next logon will be greyed out. 
10. Using powershell to accomplish the same result:

```powershell
Set-ADAccountPassword -Identity rhendricks -reset
```

- Now enter the new password for the user
- Check that the pass has been reset using:

```powershell
Get-ADUser rhendricks -Properties * | Select name, pass *
```

- Force user to reset their password at login:

```powershell
Set-ADUser -Identity rhendricks -ChangePasswordAtLogon $true
```

- Check settings to verify everything was completed correctly

```powershell
Get-ADUser rhendricks -Properties * 
```

## Automating Tasks With Powershell

**Script to Create New AD Users:**

```powershell
#Script to create a new AD user with the parameters passed in by the user

#Getting parameters for script from user
param (
    [Parameter(Mandatory=$true)]
    [string]$FirstName,

    [Parameter(Mandatory=$true)]
    [string]$LastName,

    [Parameter(Mandatory=$true)]
    [string]$UserName,

    [Parameter(Mandatory=$true)]
    [string]$OU,

    [Parameter(Mandatory=$true)]
    [string]$Domain

)

#Generate Random Password
$Password = -join((0x30..0x39)+(0x41..0x5A)+(0x61..0x7A) | Get-Random -Count 12 | ForEach-Object {[char]$_})
Write-Host "Password Generated as: $Password"

$SecurePassword = ($Password | ConvertTo-SecureString -AsPlainText -Force)
#Make a call to New-ADUser to create the AD user
New-ADUser `
    -SamAccountName $UserName `
    -UserPrincipalName "$Username@$Domain" `
    -Name "$FirstName $LastName" `
    -GivenName $FirstName `
    -Surname $LastName `
    -AccountPassword $SecurePassword `
    -Enabled $true `
    -Path "OU = $OU, DC = LAB, DC = local" `
    -PasswordNeverExpires $false `
    -ChangePasswordAtLogon $true
```

**Using the Script:**

```powershell
.\Create-ADUser.ps1 -FirstName "Andrew" -LastName "Belini" -UserName "abelini" -OU "Engineering" -Domain "LAB.local"
```

## Docker

When installing docker and peppermint you just need to change the API, at the bottom, to localhost after pasting it into vim as a docker-compose.yml file