# check install
git
sudo apt update
sudo apt install git
git --version

# set account
`git config --global user.name “<user>”`
`git config --global user.email “<email>”`
git config --list

# Access Token for auto push 
`git remote set-url origin` 

```xml
https://<Username>:`<Access_Token>@github.com/<Username>/<Repository_Name>.git
```

## set up a new repo on the website
## optional: add a README file

# mkdir for new repo
mkdir my-new-repo
cd my-new-repo

# copy repo link from github and clone into it
git clone https://github.com/user/my-new-repo

# check status
git status

# add files
git add .		#adds all files, optionally use file name 

# finalizing
git commit -m “comment about changes etc”
git push origin main

# alternative
-on github go to user settings,  developer settings, personal access tokens
-generate new token (classic)
-click on repo to access the website url


-the format is: git remote set-url origin `https://<token>@github.com/<username>/<repo>`

# Token expired

**Make sure you're in the correct dir**

```bash
git remote set-url origin https://<TOKEN>@github.com/<USER>/<REPO> 
```

# list branch
git branch -av
git checkout `<branchname>`

# merging branches, first move into main branch
git checkout master
git merge `<branch to be merged>`

# re-add repo
git remote add origin `https://github.com/<username>/<my-old-repo>`

# broken commit or file too large
git rebase -i HEAD~5

-i - interactive
5 = number of commits to go back

---

Taking a look at `github-cli` 

### Configuration

- Run [`gh auth login`](https://cli.github.com/manual/gh_auth_login) to authenticate with your GitHub account. Alternatively, `gh` will respect the `GITHUB_TOKEN` [environment variable](https://cli.github.com/manual/gh_help_environment).

- To set your preferred editor, use `gh config set editor <editor>`. Read more about [`gh config`](https://cli.github.com/manual/gh_config) and [environment variables](https://cli.github.com/manual/gh_help_environment).

- Declare your aliases for often-used commands with [`gh alias set`](https://cli.github.com/manual/gh_alias_set).

```php
gh auth login
```

```php
gh auth status
```

- We can check the information regarding the authentication state using the command: “**gh auth status**” and also refresh the stored authentication credentials using the command: “**gh auth refresh**”.

```php
gh auth setup-git
```

Log in with a token from `stdin`

If you have a personal access token generated from the GitHub website ([https://github.com/settings/tokens](https://github.com/settings/tokens) ) and want to log in with it, you can use the following command:

```php
echo your_token | gh auth login --with-token
```

- This use case is useful when you want to automate the authentication process or when you have a personal access token stored securely and want to use it for authentication.

https://commandmasters.com/commands/gh-auth-common/

To refresh the session and ensure that your authentication credentials have the correct minimum scopes, you can use the following command:

```php
gh auth refresh
```

To expand the permission scopes for the authentication, you can specify the desired scopes using the `--scopes` option. For example:

```php
gh auth refresh --scopes repo,admin:repo_hook,admin:org,admin:public_key,admin:org_hook,...
```

