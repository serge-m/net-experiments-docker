# Sample docker image for experiments with openvpn


## Building 
```
docker build -t ovpn -f base.docker .
```

## Running one contained
```
docker run -it --rm -e SERVER_NAME=server1 ovpn 
```

## Running a network
```
docker-compose up --build
```

## configuration files for OpenVPN
one have to create them manually. 
docker-compose mounts directories 
* /pki_persistent/<service_name> to /pki 
* /etc_persistent/<service_name> to /etc/openvpn 


## Launching openvpn server 

Create missing ccd directory and run server:
```
$ docker exec -it n1_server_1 bash -c "(mkdir -p /etc/openvpn/ccd && /etc/init.d/openvpn start)"
```


Check status:
```
$ docker exec -it n1_server_1 /etc/init.d/openvpn status * VPN 'server' is running
 * VPN 'server' is running
```

If not running check logs in the container: `/var/log/openvpn/....`