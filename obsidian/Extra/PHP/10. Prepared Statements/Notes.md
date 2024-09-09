## What are Prepared Statements?

Adds a placeholder for the variable that it assigns back into the query later.

PDO - php data objects
- Can connect to different databases and is a prepared statement.

This would replace: `mysqli_connect("localhost", "root", "", "security_db")`

Example:

```php
$string = "mysql:host=localhost;dbname=security_db";
$con = new PDO(%string, "root", "");
return $con;

$stm = $con->prepare($query)

$query = "select * from posts where id = :id limit 1";
```

- Statement `$stm`
- Connection `$con`
- Placeholder `:id`

_Usually it's expecting the input to be in an array `arr = []` which would be included in a return statement: `return db_read($query,$arr)`_

```php
$arr = array();
$arr['id'] = (int)$id;
$query = "select * from posts where id = :id limit 1";

return $this->db_read($query,$arr)
```

---

**Completed:** _13:45 2024-09-09_




