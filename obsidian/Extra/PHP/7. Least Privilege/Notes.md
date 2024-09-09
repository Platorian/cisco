### Principle of Least Privilege 

- Admin access
- Editor access
- User access
- Everyone

For example:

- Admin access
	- Full control of the web-app
- Editor access
	- Able to update how the entire website looks
- User access
	- Able to change how their page looks
- Everyone
	- Able to view some of the public website content

How does this work in PHP?

First the SQL database would need a way of determine who has what access, so for this example let's call them ranks. We could use them in anyway you want but i'll just make a quick table.

| User  | ID  | Email           | Rank   |
| ----- | --- | --------------- | ------ |
| admin | 1   | admin@email.com | admin  |
| bob   | 2   | bob@email.com   | editor |
| sally | 3   | sally@email.com | user   |
| all   | 4   | n/a             | all    |

- Admin access
	- Rank admin
- Editor access
	- Rank editor
- User access
	- Rank user
- Everyone
	- Rank all

```php
<?php



```