# Sample docker image for experiments


## Building 
```
docker build -t ovpn -f base.docker .
```

## Running 
```
docker run -it --rm -e SERVER_NAME=server1 ovpn 
```