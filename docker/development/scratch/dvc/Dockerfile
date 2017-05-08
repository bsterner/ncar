FROM centos:7

RUN yum -y update

VOLUME ["/Users/bsterner/tmp"]

COPY var/www/html/* /var/www/html/

EXPOSE 2377

# Needed to keep the container running
CMD ["/sbin/init"]
