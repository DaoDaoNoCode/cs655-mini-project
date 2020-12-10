# cs655-mini-project
BU CS 655 Networking GENI Mini Project

## Set up the environment

### Install & Run Apache2 in the source server

login in the source server

```
ssh [your_username]@[your_source_server_ip]
```

update apt-get

```
sudo apt-get update
```

install apache2

```
sudo apt-get install apache2
```

run apache2

```
sudo service apache2
``` 

### Install & Run Apache Traffic Server in the cache server

login in the cache server

```
ssh [your_username]@[your_cache_server_ip]
```

update apt-get

```
sudo apt-get update
```

install ATS

```
sudo apt-get install trafficservice
```

Modify records.config to open reverse_proxy & cache

```
cd /etc/trafficservice
sudo vim records.config
```


          
