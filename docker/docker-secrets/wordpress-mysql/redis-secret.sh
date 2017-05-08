docker secret create
docker secret inspect
docker secret ls
docker secret rm
--secret flag for docker service create
--secret-add and --secret-rm flags for docker service update

echo "This is a secret" | docker secret create my_secret_data -
docker secret ls
docker secret inspect my_secret_data

docker service  create --name="redis-secret" --secret="my_secret_data" redis:alpine
docker service ps redis-secret # to get the node running the container

# On that container...
docker ps --filter name=redis-secret -q
docker exec $(docker ps --filter name=redis-secret -q) ls -l /run/secrets
docker exec $(docker ps --filter name=redis-secret -q) cat /run/secrets/my_secret_data

Verify that the secret is not available if you commit the container.

docker commit $(docker ps --filter name=redis -q) committed_redis
docker run --rm -it committed_redis cat /run/secrets/my_secret_data

# Try removing the secret. The removal fails because the redis is running and has access to the secret.
docker secret ls
docker secret rm my_secret_data
# remove it
docker service update --secret-rm="my_secret_data" redis-secret
# verify secret is gone
docker exec -it $(docker ps --filter name=redis-secret -q) cat /run/secrets/my_secret_data

docker service rm redis
docker secret rm my_secret_data
