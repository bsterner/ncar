#!/bin/bash

docker run -d -p 8080:80 --name apache-server \
	--link percona-server:percona-alias \
	-v /Users/bsterner/Development/docker/apache/ubuntu-apache-percona/var/www/html:/var/www/html \
	apache/apache-server:v1
