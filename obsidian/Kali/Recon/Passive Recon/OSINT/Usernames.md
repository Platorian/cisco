access github api to access hidden emails
```php
https://api.github.com/repos/gophish/gophish/commits
```

```php
https://api.github.com/repos/<GIT_USERNAME>/<REPO_NAME>/commits
```

curl and grep emails
```python
https://api.github.com/repos/gophish/gophish/commits | grep -Eio '([[:alnum:]_.]+@[[:alnum:]_]+?\.[[:alpha:].]{2,6})'
```

breach data
https://www.osintme.com/index.php/2021/04/18/20-osint-resources-for-breach-data-research/

https://liferaftlabs.com/blog/how-to-use-osint-to-detect-data-leaks-and-breaches

https://osintteam.blog/using-breached-data-for-osint-investigations-9b44318412e