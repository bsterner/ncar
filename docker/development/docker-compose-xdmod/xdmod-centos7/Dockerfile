FROM centos:7
ENV REFRESHED_AT 2017-01-30

RUN yum -y update
RUN yum -y install epel-release gmp-devel php-gmp bzip2 patch

WORKDIR /usr/local
RUN curl https://repo.ucar.edu/artifactory/binary-local/phantomjs/phantomjs-2.1.1-linux-x86_64.tar.bz2 | \
    tar -jxvf -
RUN ln -s phantomjs-2.1.1-linux-x86_64 phantomjs

# Needed to keep the container running
CMD ["/sbin/init"]
