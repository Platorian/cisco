Now that we've started a listener and created a stager, it's time to put them together to get an agent!

We've been building up towards getting an agent on the compromised webserver, so let's do that now.

---

The process for this is identical whether we are using Starkiller or Empire Client. We need to get the file to the target and executed.

There are a variety of ways we could do this. The simplest would simply be to use your preferred CLI text editor to create a file on the target, copy and paste the script in, then execute it. If using this method, please do it in the /tmp directory and follow the `FILENAME-USERNAME.sh` naming convention. We could also use something called a _[here-document](https://tldp.org/LDP/abs/html/here-docs.html)_ to execute the entire script without ever writing it to the disk.

That said, this is overkill. If we read through the script we can see that it is in three main parts:  
![Isolating the shebang, payload, and cleanup aspects of the script via highlighting. Line 1 is the shebang, line 2 is the payload, lines 3 and 4 are the cleanup.](https://assets.tryhackme.com/additional/wreath-network/bed26471fb22.png)  

- In the green square we have the _shebang_. This tells the shell which interpreter to run the script under. In this case the script would be run using `/bin/bash`
- The red square contains the payload itself. This is the section we're interested in
- The blue square contains post processing commands. Specifically these two lines tell the script to delete itself then exit

Knowing this, we can just copy everything in the red square then execute it in a terminal on the target:  
![Demonstration of executing the payload on the target manually by copying the payload from the stager and pasting it into a shell.](https://assets.tryhackme.com/additional/wreath-network/0d056c07dc42.png)

This results in an agent being received by our waiting listener.

In the Empire CLI receiving a listener looks something like this:  
![Showing what a received agent looks like in Empire CLI](https://assets.tryhackme.com/additional/wreath-network/empire-update-4.0/2c40df48c20b.png)

We can then type `agents` and hit enter to see a full list of available agents:  
![Using the agents command to view all available agents](https://assets.tryhackme.com/additional/wreath-network/empire-update-4.0/dd75d7655190.png)  

To interact with an agent, we use `interact AGENT_NAME` -- as per usual a dropdown with autocompletes will assist us here. This puts us into the context of the agent. We can view the full list of available commands with `help`:  
![Demonstrating how to interact with an agent and use the help menu](https://assets.tryhackme.com/additional/wreath-network/empire-update-4.0/58e64472c5ae.png)  

Note that this menu will change depending on the stager we used.

When we have finished with our agent we use `back` to switch context back to the agents menu. This doesn't destroy the agent, however. If we did want to kill our agent, we would do it with `kill AGENT_NAME`:  
![Demonstrating how to exit and kill an agent using the back and kill commands](https://assets.tryhackme.com/additional/wreath-network/empire-update-4.0/2c32ca6d0224.png)

We can also rename agents using the command: `rename AGENT_NAME NEW_AGENT_NAME`.  

---

To interact with agents In Starkiller we go to the Agents tab on the left hand side of the screen:  
![Highlighting the agents menu in Starkiller](https://assets.tryhackme.com/additional/wreath-network/f72d55e49b79.png)  

Here we will see that our agent has checked in!  
![Showing what an agent checking in looks like in the Starkiller GUI](https://assets.tryhackme.com/additional/wreath-network/empire-update-4.0/52199197fe7a.png)  

To interact with an agent in Starkiller we can either click on its name, or click on the "pop out" button in the actions menu.  

This results in a menu which gives us access to a variety of amazing features, including the ability to execute modules (more on these soon), execute commands in an interactive shell, browse the file system, and much more. Be sure to play around with this before moving on!  
![Showing the popout menu for interacting with the received agent](https://assets.tryhackme.com/additional/wreath-network/empire-update-4.0/fe886b4ba6bb.png)  

To delete agents in Starkiller we can use either the trashcan icon in the pop-out agent Window, or the kill button in the action menu for the agent back in the Agents tab of Starkiller.  

Answer the questions below

Using the `help` command for guidance: in Empire CLI, how would we run the `whoami` command inside an agent?  

We have now covered the basics of Empire, with the exception of modules, which we will look at after getting an agent back from the Git Server.

Kill your agents on the webserver then let's look at proxying Empire agents!