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

Within the records.config configuration file, ensure that the following settings have been configured as shown below:
```
CONFIG proxy.config.http.cache.http INT 1
CONFIG proxy.config.reverse_proxy.enabled INT 1
CONFIG proxy.config.url_remap.remap_required INT 1
CONFIG proxy.config.url_remap.pristine_host_hdr INT 1
CONFIG proxy.config.http.server_ports STRING 80 80:ipv6
```

open remap.config
```
sudo vim remap.config
```

add the following rule to the remap.config
```
map http://[your_cache_server_ip]/cache/ http://{cache}
map http://[your_cache_server_ip]/ http://[your_source_sever_ip]
```

run ATS
```
sudo service trafficserver start
```






          
