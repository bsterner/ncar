#!/bin/bash
docker run -p 9306:3306 --name percona-container \
	-e MYSQL_ROOT_PASSWORD=password \
	--volumes-from dvc-container \
	-d percona/percona-base:v1
