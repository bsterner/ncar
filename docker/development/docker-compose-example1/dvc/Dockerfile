FROM centos:7

RUN yum -y update

VOLUME ["/var/lib/mysql"]
VOLUME ["/var/www/html"]

COPY var/www/html/* /var/www/html/

# Needed to keep the container running
CMD ["/sbin/init"]
