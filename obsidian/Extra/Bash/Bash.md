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

