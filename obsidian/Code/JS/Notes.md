# Variables

```js
console.log('hello');
```
Var - global variable
```js
var message = 'hello';
console.log(message);
```

Const - keeps it's value, mostly
```js
const message = 'hello';
message = 'new message';
console.log(message);
```

Let - scoped to specific function 
```js
let message = 'hello';
message = 'new message';
console.log(message);
```

# Conditionals
```js
let uname = 'bill'

// Conditional Message
if (uname == 'bill') {
	console.log('Welcome back ' + uname + '!');
} else {
	console.log('Who are you?');
}
```
- Strict compare `===`
- Can use the normal `==` compare to exploit pieces of code, try adding the string 7, and integer 7, for example, and see what happens. 

Full tree
```js
let uname = 'Bill'

// Conditional Message
if (uname == 'Bill') {
	console.log('Welcome back ' + uname + '!');
} else if (uname == 'Anna'){
	console.log('Hey Anna!');
} else {
	console.log('Who are you');
}
```

# Loops and Arrays

Old way
```js
let users = [
	'anna',
	'bill',
	'amy',
	'sarah',
	'william'
];

// For loop
for (let i=0; i < users.length; i++) {
	console.log('hello ' + users[i] + '!');
}
```

Other methods of for loop
```js
for (let i in users) {
	console.log('hello ' + users[i] + '!');
}
```

Get index value of the array
```js
for (let i in users) {
	console.log('hello ' + i + '!');
}
```

Get element in the array
```js
for (let i of users) {
	console.log('hello ' + i + '!');
}
```

# Functions

```js

```

```js

```

```js

```

```js

```

```js

```

```js

```

