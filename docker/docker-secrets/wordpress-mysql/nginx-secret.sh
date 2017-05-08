# ===========================================================================================
# Storing certificates as secrets
# ===========================================================================================
docker secret create site.key site.key
docker secret create site.crt site.crt
docker secret create site.conf site.conf

docker service create \
     --name nginx \
     --secret site.key \
     --secret site.crt \
     --secret site.conf \
     --publish 3000:443 \
     nginx:latest \
     sh -c "ln -s /run/secrets/site.conf /etc/nginx/conf.d/site.conf && exec nginx -g 'daemon off;'"
