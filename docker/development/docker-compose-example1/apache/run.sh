#!/bin/bash
docker run -d -p 8080:80 --name apache-container \
	--link percona-container:percona-alias \
	--volumes-from dvc-container \
	apache/apache-base:v1
