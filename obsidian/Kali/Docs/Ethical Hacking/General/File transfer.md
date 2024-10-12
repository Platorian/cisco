**Start a http server**
```
python -m http.server
```

**Transfer files**

Linux
```
wget http://<My IP>:<Port>/<Target File>
```

Windows
```
Invoke-WebRequest "http://<My IP>:<Port>/<Target File>"
```

Add outfile if it gets stuck trying to download
```
Invoke-WebRequest "http://<My IP>:<Port>/<Target File>" -OutFile <New File Name>
```

Curl
```
curl -O https://www.digitalocean.com/robots.txt
```

