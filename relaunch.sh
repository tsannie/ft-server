docker rm -f test
docker rmi ftserv
docker build -t ftserv .
docker run --name test -it -p 80:80 -p 443:443 ftserv