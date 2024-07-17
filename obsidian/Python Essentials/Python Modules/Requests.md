## Making a GET Request

```python
import requests

url = "https://api.example.com/data"
response = requests.get(url)

# Check if the request was successful (status code 200)
if response.status_code == 200:
    data = response.json()  # Parse JSON response
    print(data)
else:
    print(f"Error: {response.status_code}")
```

## Making a POST Request

```python
import requests

url = "https://api.example.com/create"
payload = {"key1": "value1", "key2": "value2"}

response = requests.post(url, data=payload)

if response.status_code == 201:  # Created
    print("Resource created successfully.")
else:
    print(f"Error: {response.status_code}")
```

## Passing URL Parameters

```python
import requests

url = "https://api.example.com/search"
params = {"query": "python", "type": "programming"}

response = requests.get(url, params=params)

if response.status_code == 200:
    results = response.json()
    print(results)
else:
    print(f"Error: {response.status_code}")
```

## Handling Headers

```python
import requests

url = "https://api.example.com/endpoint"
headers = {"Authorization": "Bearer YOUR_ACCESS_TOKEN"}

response = requests.get(url, headers=headers)

if response.status_code == 200:
    data = response.json()
    print(data)
else:
    print(f"Error: {response.status_code}")
```

## Uploading Files

```python
import requests

url = "https://api.example.com/upload"
files = {"file": open("example.txt", "rb")}

response = requests.post(url, files=files)

if response.status_code == 200:
    print("File uploaded successfully.")
else:
    print(f"Error: {response.status_code}")
```

## Handling Timeouts

```python
import requests

url = "https://api.example.com/timeout"
timeout_seconds = 5

try:
    response = requests.get(url, timeout=timeout_seconds)
    response.raise_for_status()  # Raise an exception for HTTP errors
    print(response.text)
except requests.exceptions.Timeout:
    print("Request timed out.")
except requests.exceptions.RequestException as e:
    print(f"Error: {e}")
```

## Session Management

```python
import requests

# Create a session for making multiple requests with shared parameters (e.g., cookies)
session = requests.Session()

# Perform multiple requests with the same session
response1 = session.get("https://api.example.com/login", params={"user": "john", "password": "secret"})
response2 = session.get("https://api.example.com/dashboard")

# Close the session when done
session.close()
```

