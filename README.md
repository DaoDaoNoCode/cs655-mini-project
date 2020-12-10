# cs655-mini-project
BU CS 655 Networking GENI Mini Project

## Correction
In 3.1 of the report we submit in the GradeScope, we mistakenly write old commands that are used to test connectivity.
![old](/image/old.png)
Actually, we use an 87MB video to test the performance, and we use the following commands: 
![new](/image/new.png)

## Set up the environment

### Install & Run Apache2 in the source server

Login in the source server

```
ssh [your_username]@[your_source_server_ip]
```

Update apt-get

```
sudo apt-get update
```

Install apache2

```
sudo apt-get install apache2
```

Run apache2

```
sudo service apache2
``` 

### Install & Run Apache Traffic Server in the cache server

Login in the cache server

```
ssh [your_username]@[your_cache_server_ip]
```

Update apt-get

```
sudo apt-get update
```

Install ATS

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

Modify remap.config
```
sudo vim remap.config
```

Add the following rule to the remap.config
```
map http://[your_cache_server_ip]/cache/ http://{cache}
map http://[your_cache_server_ip]/ http://[your_source_sever_ip]
```

Run ATS
```
sudo service trafficserver start
```

### Add max-age in http objects sent by the source server
Login in the source server

```
ssh [your_username]@[your_source_server_ip]
```

Open headers_module
```
sudo a2enmod headers
```

Modify apache2.conf
```
cd /etc/apache2
sudo vim apache2.conf
```

Add the following content to apache2.conf:
```
<FilesMatch "\.(htm|html|ico|pdf|flv|jpg|jpeg|png|gif|woff|js|css|swf)$">
        Header set Cache-Control "max-age=600"
</FilesMatch>
```

Restart apache2
```
sudo service apache2 restart
```

### Add expires in http objects sent by the source server
Login in the source server

```
ssh [your_username]@[your_source_server_ip]
```

Open expires_module
```
sudo a2enmod expires
```

Modify apache2.conf
```
cd /etc/apache2
sudo vim apache2.conf
```

Add the following content to apache2.conf:
```
<FilesMatch "\.(htm|html|ico|pdf|flv|jpg|jpeg|png|gif|woff|js|css|swf)$">
        ExpiresActive on
        ExpiresDefault "access plus 10 minutes"
</FilesMatch>
```

Restart apache2
```
sudo service apache2 restart
```

## Do the experiment
### Check the objects in the cache server:
After setting up ATS, you can go to this link below:

```
[your_cache_server_ip]/cache/
```

### Send a request to the cache server:
```
curl [your_cache_server_ip]/[filename]
```

### Get the response time:
```
curl -o [filename] -w 'Total: %{time_total}s\n' [your_cache_server_ip]/[filename]
```

### show detailed information of the response
```
curl -i -s [your_cache_server_ip]/[filename]
```





          
