# Create the swarm
docker swarm init --advertise-addr 192.168.56.101
# Swarm initialized: current node (w4xkn0pww12xs3r7ydb40ulel) is now a manager.
#
# To add a worker to this swarm, run the following command:
#
#     docker swarm join \
#     --token SWMTKN-1-21lk1m78iowdz39d3ys1ouej5sj8yqjy7uf6pgsdqumq8lf4n4-2gc73tjr8wvfjyvi77p49sgyp \
#     192.168.56.101:2377
#
# To add a manager to this swarm, run 'docker swarm join-token manager' and follow the instructions.

# Create a service
docker service create --replicas 1 --name helloworld alpine ping docker.com

# Useful inspection commands
docker node ls
docker service ls
docker node rm {HASH} # to remove a node from the swarm
docker service inspect --pretty helloworld
docker service ps helloworld # to see which nodes are running the service:

# Scaling
docker service scale helloworld=5
docker service ps helloworld
#
# OUTPUT...
#
# ID            NAME          IMAGE          NODE      DESIRED STATE  CURRENT STATE           ERROR  PORTS
# yiymqkb1d0zz  helloworld.1  alpine:latest  worker1   Running        Running 6 minutes ago
# za0btz8te0b2  helloworld.2  alpine:latest  manager1  Running        Running 28 seconds ago
# u8vetthe6ixp  helloworld.3  alpine:latest  worker2   Running        Running 28 seconds ago
# kj2l07ae200w  helloworld.4  alpine:latest  worker2   Running        Running 28 seconds ago
# i51eouf1skdc  helloworld.5  alpine:latest  worker1   Running        Running 30 seconds ago

# Remove the service
docker service rm helloworld

# Rolling updates
docker service create \
  --replicas 3 \
  --name redis \
  --update-delay 10s \
  redis:3.0.6
# use watch on nodes to view status

# Apply redis image update to containers and check status
docker service update --image redis:3.0.7 redis
docker service inspect --pretty redis

# Drain tasks/services on a node
docker node update --availability drain worker1
docker node ls
docker service ps redis
# Status:
#  State:			Ready
#  Availability:		Drain

 # Return node to active state
docker node update --availability active worker1

# Routing mesh
docker service create \
  --name my-web \
  --publish 8080:80 \
  --replicas 2 \
  nginx

  docker service update \
  --publish-add <PUBLISHED-PORT>:<TARGET-PORT> \
  <SERVICE>

docker service inspect --format="{{json .Endpoint.Spec.Ports}}" my-web

The following two commands are equivalent.
$ docker service create --name dns-cache -p 53:53 dns-cache
$ docker service create --name dns-cache -p 53:53/tcp dns-cache

TCP AND UDP
$ docker service create --name dns-cache -p 53:53/tcp -p 53:53/udp dns-cache

UDP ONLY
$ docker service create --name dns-cache -p 53:53/udp dns-cache
