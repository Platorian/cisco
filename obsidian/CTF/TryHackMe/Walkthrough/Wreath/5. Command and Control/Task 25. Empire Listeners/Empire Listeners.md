Listeners in Empire are used to receive connections from stagers (which we'll look at in the next task). The default listener is the `HTTP` listener. This is what we will be using here, although there are many others available. It's worth noting that a single listener can be used more than once -- they do not die after their first usage.

---

Let's start by setting up a listener in the Empire CLI Client.

Having started the client, we are met with the following menu:  
![Demonstration of connecting with the Empire CLI Client](https://assets.tryhackme.com/additional/wreath-network/empire-update-4.0/ba333000239e.png)

To select a listener we would use the `uselistener` command. To see all available listeners, type `uselistener`  (making sure to include the space at the end!) -- this should bring up a dropdown menu of available listeners:  
![Dropdown showing the listeners available](https://assets.tryhackme.com/additional/wreath-network/empire-update-4.0/ecc40f11478c.png)  

When you've picked a listener, type `uselistener LISTENER` and press enter to select it; alternatively, the up and down arrow keys can also be used to traverse the dropdown, with the chosen listener again being selected by pressing enter. Here we will be using the `http` listener (the most common kind), so we use `uselistener http`:  
![Screenshot showing the options table for the selected listener](https://assets.tryhackme.com/additional/wreath-network/empire-update-4.0/e79c26064a34.png)  

This brings up a huge table of options for the listener. If we need to see an updated copy of this table (having set options, for example), we can access it again with the `options` command when in the context of the listener.

The syntax for setting options is identical to the Metasploit module options syntax -- `set OPTION VALUE`. Once again, a dropdown will appear showing us the available options after we type `set`  .  

Set a new name for the listener. This allows us to easily identify it later -- especially if we have several open. It is not essential, however, and can be left at the default `http` if preferred.  

That said, some options _must_ be set. At a bare minimum we must set the host (to our own IP address) and port:  
![Demo of setting the options for name, host and port](https://assets.tryhackme.com/additional/wreath-network/empire-update-4.0/a5d0eb75224f.png)  

Bear in mind that option names are case sensitive in Empire.

Many of the other options presented here are extremely useful, so it's well worth learning what they do and how they can be applied.  

With the required options set, we can start the listener with: `execute`. We can then exit out of this menu using `back`, or exit to the main menu with `main`.  

To view our active listeners we can type listeners then press enter:  
![](https://assets.tryhackme.com/additional/wreath-network/empire-update-4.0/9e5c79b3eec7.png)  

When we want to stop a listener, we can use `kill LISTENER_NAME` to do so --  a dropdown menu with our active listeners will once again appear to assist.  

---

We have a listener in the Empire CLI; now let's do the same thing in Starkiller!

When we first launched Starkiller, we were placed automatically in the Listeners menu:  
![The listeners menu of Starkiller](https://assets.tryhackme.com/additional/wreath-network/empire-update-4.0/d8d7fd792211.png)  

The process of creating a listener with the GUI is very intuitive. Click the "Create " button.

In the menu that pops up, set the Type to `http`, the same as with the Empire Listener we created before. Several new options will appear:  
![Available options for listeners in Starkiller](https://assets.tryhackme.com/additional/wreath-network/efec537b41f2.png)

Notice that these options are identical to those we saw earlier in the CLI version.

Once again, set the Name, Host, and Port for the listener (make sure to use a different port from previously if you already have an Empire listener started!):  
![Setting the name, host, and port options for the Starkiller listener](https://assets.tryhackme.com/additional/wreath-network/4ac9e0c14358.png)  

With the options set, click "Submit" at the top of the page, then go back to the Listeners menu by clicking on "Listeners" at the top left of the page. Back on the main Listeners page you will see your created listener!  
![The listeners menu with the Starkiller listener started](https://assets.tryhackme.com/additional/wreath-network/empire-update-4.0/8d93b44295ba.png)  

_**Note:** if you also have a listener set up in Empire, this will also show up here._

Answer the questions below

Start a listener in Empire and/or Starkiller

