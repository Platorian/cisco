# Challenge

## Online status

The aim of this challenge is, given a dictionary of people's online status, to count the number of people who are online.

For example, consider the following dictionary:

```python
statuses = {
    "Alice": "online",
    "Bob": "offline",
    "Eve": "online",
}
```

In this case, the number of people online is `2`.

Write a function named `online_count` that takes one parameter. The parameter is a dictionary that maps from strings of names to the string `"online"` or `"offline"`, as seen above.

Your function should return the number of people who are online.

```python
def online_count(status):

    status = {
        "Alice": "online",
        "Bob": "offline",
        "Eve": "online",
    }
    online = 0
    for x in status.values():
        if "online" in x:
            online += 1
    print(online)

online_count("status")
```


Function examples.

```python
def add(num):

	return num + num

total = add(5)

print(total)
print("")


def add(num):
	return num + num

print(add(5))
```


2.
The call online_count({'Alice': 'online', 'Bob': 'offline'}) should return '1', but it returned '2'

```python
def online_count(status):
    status = {
        "Alice": "online",
        "Bob": "offline",
        "Eve": "online",
    }
    online = 0
    for x in status.values():
        if "offline" in x:
            continue 
        if "online" in x:
            online += 1
        print(x)
                     
    return online
    
print(online_count("status"))
```

3.
```python
def online_count(status):
    status = {
        "Alice": "online",
        "Bob": "offline",
        "Eve": "online",
    }
    online = 0
    for x in status.values():
        
        if x == "online":
            online += 1
    return online
    
print(online_count("status"))
```

**Solution**
```python
def online_count(people):
    return sum(v == "online" for v in people.values())
```

```python
def online_count(myDict):
    counter = 0
    for i, j in myDict.items():
        if j == "online":
            counter += 1
    
    return counter


statuses = {
    "Alice": "online",
    "Bob": "offline",
    "Eve": "online",
}
online_count(statuses)
```

