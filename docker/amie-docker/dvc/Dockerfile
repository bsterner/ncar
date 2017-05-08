FROM centos:7.2.1511

RUN yum -y update

COPY var/www/html/* /var/www/html/

# Needed to keep the container running
CMD ["/sbin/init"]
