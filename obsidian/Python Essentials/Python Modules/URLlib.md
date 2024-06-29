Similar to socket module, but uses less code:

```python
import urllib.request

fhand = urllib.request.urlopen('http://data.pr4e.org/romeo.txt')
for line in fhand:
    print(line.decode().strip())
```

Could be this version:

```python
import urllib.request, urllib.parse, urllib.error

fhand = urllib.request.urlopen('http://data.pr4e.org/romeo.txt')
for line in fhand:
    print(line.decode().strip())
```

- urllib is the library
- requests is the function

This will:
- Makes the connection
- Encodes the get request
- Retrieves the headers, and saves them but doesn't show them to you 
- Returns a file object
- Reads the lines of the file
- Decodes it and then prints it

Using it like a file:

```python
import urllib.request, urllib.parse, urllib.error

fhand = urllib.request.urlopen('http://data.pr4e.org/romeo.txt')
counts = dict()
for line in fhand:
    words = line.decode().split()
    for word in words:
	    counts[word] = counts.get(word, 0) + 1
print(counts)
```

Read web page:

```python
import urllib.request

fhand = urllib.request.urlopen('http://www.dr-chuck.com/page1.htm')
for line in fhand:
    print(line.decode().strip())
```


