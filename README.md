# cs655-mini-project
BU CS 655 Networking GENI Mini Project

### 1. Set up the environment
#### 1.1 Install & Run Apache2 in the source server
##### 1) login in the source server ```ssh username@source_server_ip```
##### 2) update apt-get ```sudo apt-get update ```
##### 3) install apache2```sudo apt-get install apache2```
##### 4) run apache2 ```sudo service apache2``` 
</br>

#### 1.2 Install & Run Apache Traffic Server in the cache server
##### 1) login in the cache server ```ssh username@cache_server_up```
##### 2) update apt-get ```sudo apt-get update```
##### 3) instal ATS ```sudo apt-get install trafficservice```
##### 4) Modify records.config to open reverse_proxy & cache

