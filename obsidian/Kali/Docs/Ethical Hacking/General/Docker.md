List online containers
```
docker ps
```

List offline containers
```
docker ps -a
```

Check status
```
sudo systemctl status docker
```

#### Use Docker as a non root user

Add the user to the docker group.
- this sounds like a serious security risk, but i'll add it anyway

Add docker group
```
sudo groupadd docker
```

```
sudo usermod -aG docker $USER
```

Reboot, or run:
```
newgrp docker
```

Test
```
docker run hello-world
```

---

Pull images for docker to use
```
docker pull ubuntu
```

Run interactive session
```
docker run -it ubuntu
```

Exit container
```
ctl+d
```

Remove old containers
```
docker rm <image>
```


