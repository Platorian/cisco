```python
# Get csrf
def get_csrf(s, url):
	r = s.get(url + 'login', verify=False, proxies=proxies)
	soup = BeautifulSoup(r.text, 'html.parser')
	csrf = soup.find("input")['value']
	return csrf
```



