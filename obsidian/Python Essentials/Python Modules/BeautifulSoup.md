Web Parser

```python
import urllib.request, urllib.parse, urllib.error
from bs4 import BeautifulSoup

url = input("Enter url: ")
html = urlib.request.urlopen(url.read())
soup = BeautifulSoup(html, "html.parser")

# Get anchor tags
tags = soup("a")
for tag in tags:
print(tag.get("href", None))
```

