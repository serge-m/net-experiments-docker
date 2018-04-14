# Sample docker image for experiments


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
