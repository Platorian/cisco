Scripting for ctf completion.

This will mark the dir as completed after finishing a ctf:
`finish.sh`

```bash
# Captures output of pwd command and stores it in var
original_dir=$(pwd)

# Move back a dir
cd ..

# Modify name
mv $original_dir ${original_dir}_COMPLETED
```

- Move script into opt folder `/opt/`
- open `~/.bashrc` or `~/.zshrc` in a text editor
- Add to aliases

```bash
alias finish="source /opt/finish.sh"
```

Git upload script

```bash
#!/usr/bin/bash 

echo "==============="
echo "Script Started"
echo "==============="
cd ~/Documents/cisco
git add .
sleep 2
git commit 
sleep 3 
git push origin main
sleep 3 
git status
echo "==============="
echo "Script Has Finished"
echo "==============="
```

**Using the script**
Create an alias in zsh, or whatever shell i'm using, and point it to the /opt directory.
`gitup=/opt/gitup.sh`

I can view aliases by typing into the shell `alias`

**The syntax is as follows:**
`$ alias shortName="your custom command here"`

**Creating Permanent Aliases in Linux**
To keep **aliases** between sessions, you can save them in your user’s shell configuration profile file. This can be:

- Bash – **~/.bashrc**
- ZSH – **~/.zshrc**
- Fish – **~/.config/fish/config.fish**

