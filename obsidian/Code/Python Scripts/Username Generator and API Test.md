The web request part is untested as i don't have anything to try it on, but the username generation is working fine.

The first part of the script generates usernames based on the top ten that you give it. It then appends to that the first initial from a-z at the beginning of the username, and finally at the end of the username a number from 60-100.  

The second part of the script will test an API endpoint for valid usernames, printing out the ones that are valid.

```python
import requests
import string
from string import ascii_lowercase as alc

# List of top ten most popular Hispanic last names
his_lastname = [
    "Garcia", "Martinez", "Rodriguez", "Hernandez", "Lopez", 
    "Gonzalez", "Perez", "Sanchez", "Ramirez", "Torres"
]

# Generate list of usernames
usernames = []
for lastname in his_lastname:
    lastname_lower = lastname.lower()

    # Generate usernames
    for c in alc:
        base_username = f"{c}{lastname_lower}"
        #print(base_username)

        for num in range(60, 100):
            usernames.append(f"{base_username}{num}")
            print(usernames[-1])  # Print only the latest username for clarity

# API endpoint
api_irl = "<URL>" # Change this

# Check each username with a GET request
valid_usernames = []
	for username in usernames:
	response = requests.get(api_url.format(username))
		if response.status_code = 200:
			valid_usernames.append(username)
			print(username) # Print valid username
```

