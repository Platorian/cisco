https://www.kali.org/docs/containers/installing-docker-on-kali/

```php
sudo apt install docker.io -y
```

Check install
```php
docker --version
```

Remove docker
```php
sudo apt remove docker.io -y
```

Metasploitable
```php
docker search metasploitable
```

Pull
```php
docker pull tleemcjr/metasploitable2
```

Check images
```php
docker images
```

Create network
```php
docker network create pentest
```

Run
```php
sudo docker run --network=pentest -h victim -it --rm --name metasploitable2 tleemcjr/metasploitable2
```

Let’s breakdown the flags used in the commands:

- — network tells docker to run the container inside the previously created network it also gives us access to internet from the container. WARNING: do NOT expose the metasploitable2 box to the internet from work office only use this in a controlled environment you have full access to.
- -h is the name given to the host we named the first one victim and the second one attacker, this is important because otherwise docker will assign the id of the container which is very inconvenient.
- -it makes it interactive so we can fully use it
- — rm will make it clean after itself once we are done with it, this is highly recommended in case of multiple runs.
- — name is pretty safe explanatory, we can distinguish between the two easily.