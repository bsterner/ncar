if [ `sudo docker ps -a | grep $1  | wc -l` == 1 ]; then
  echo "Docker container already exists"
else
#  docker run -it --name open-xdmod-dep cisl-repo/open-xdmod-dep:v1
  echo "Running docker container $1"
fi
