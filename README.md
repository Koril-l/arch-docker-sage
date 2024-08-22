Build docker image:
```
sudo docker build -t archlinux:sage .
```
Run docker:
```
sudo docker run -d -p 2222:22 -p 7777:8888 archlinux:sage
```
SSH:
```
ssh localhost -p 2222 -l root
```

Root password:
```
root
```

init jupyter lab:
```
. jup
```
default jupyter password
```
zymeth777
```

