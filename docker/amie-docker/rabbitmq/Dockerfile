FROM centos:7

RUN yum -y update
RUN yum install -y httpd
RUN yum install -y php php-common php-cli php-mysql

EXPOSE  80

WORKDIR /var/www/html

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
# ENTRYPOINT ["/usr/sbin/httpd"]
# CMD ["-D", "FOREGROUND"]
