As mentioned previously, modules are used to perform various tasks on a compromised target, through an active Empire agent. For example, we could use Mimikatz through its Empire module to dump various secrets from the target.

As per usual, let's look at loading modules in both Empire CLI and Starkiller.

---

Starting with Empire CLI:

Inside the context of an agent, type `usemodule` . As expected, this will show a dropdown with a huge list of modules which can be loaded into the agent for execution.

It doesn't really matter here as we already have full access to the target, but for the sake of learning, let's try loading in the Sherlock Empire module. This checks for potential privilege escalation vectors on the target.  
`usemodule powershell/privesc/sherlock`  
![Demonstration of loading the sherlock module](https://assets.tryhackme.com/additional/wreath-network/empire-update-4.0/081792f6213e.png)  

As previously, we can use `options` to get information about the module after loading it in.

This module requires one option to be set: the `Agent` value. This is already set for us here; however, if it was incorrect or there was no option set already then we could set it using the command: `set Agent AGENT_NAME`, (the same syntax as in previous parts of the framework).  

We start the module using the usual `execute` command. The module will then run as a background job, returning the results when it completes.  
![Executing the module in Empire CLI Client](https://assets.tryhackme.com/additional/wreath-network/empire-update-4.0/8ec5020e81a2.png)  
  

If we know approximately what we want to do, but don't know the exact path to a module, we can just type `usemodule NAME_OF_MODULE` and it should come up in the dropdown menu:  
![Demonstrating searching for modules using the dropdown menu](https://assets.tryhackme.com/additional/wreath-network/empire-update-4.0/02eba19664ee.png)  

---

Now let's do the same thing in Starkiller.

First we switch over to the modules menu:  
![Showing the modules menu in Starkiller](https://assets.tryhackme.com/additional/wreath-network/43556845ab7b.png)

In the top right corner we can search for our desired module. Let's search for the Sherlock module again:  
![Demonstrating the search function at the top right of the Starkiller Modules interface](https://assets.tryhackme.com/additional/wreath-network/empire-update-4.0/ec88bc6ff7b5.png)  

Select the module by clicking on its name.  

From here we click on the Agents menu, then select the agent(s) to use the module through:  
![Demonstrating what adding an agent looks like in Starkiller](https://assets.tryhackme.com/additional/wreath-network/empire-update-4.0/fc2e34bbfd15.png)  

Click Submit to run the module!

To view the results we need to switch over to the "Reporting" section of the main menu on the left side of the window:  
![Showing the reporting tab found in the left hand menu of Starkiller](https://assets.tryhackme.com/additional/wreath-network/f8553e45f903.png)  

From here we can see the task we just ran, showing the Agent in use, the event type, command, user, and a timestamp.  
![Highlighting the down arrow used to show the task results in the reporting section](https://assets.tryhackme.com/additional/wreath-network/empire-update-4.0/f57165fc44fc.png)

Clicking on the dropdown arrow to the left of the task gives the task results:  
![Demonstration of possible task results from a finished task in Starkiller](https://assets.tryhackme.com/additional/wreath-network/empire-update-4.0/213d58186b7f.png)  


---

Answer the questions below

Read the above information and try to experiment with the Empire Modules available.

---

**Completed:** _2024-07-22_


