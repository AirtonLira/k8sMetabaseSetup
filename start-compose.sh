docker rm -f $(docker ps -a -q)
docker rmi -f $(docker images -a -q)

docker build -t metabase/airton docker/metabase 
docker build -t ubuntu/setup docker/setup 

docker-compose up 