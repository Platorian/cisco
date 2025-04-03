View networks
```sh
ifconfig -a 
```

or 
```sh
ip link show
```

Turn off eth0
```sh
ifdown eth0
```

Turn on eth0
```sh
ifup eth0
```

See ip address info
```sh 
ip a show eth0
```

If you get error such as `ifup` or `ifdown` command not found, then use the ip command
```sh
sudo ip link set eth0 up
```

```sh
sudo ip link set eth0 down
```

```sh
sudo ip link show eth0
```

