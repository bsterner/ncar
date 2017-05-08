FROM xdmod-centos7/xdmod-centos7-base:v1
ENV REFRESHED_AT 2017-01-30

COPY yum-local-repo/yum-local.repo /etc/yum.repos.d
RUN yum -y install --nogpgcheck xdmod-5.6.0-1.0.el7.centos
WORKDIR /
RUN curl https://repo.ucar.edu/artifactory/xdmod-local/etc-config/open-xdmod-etc-config-5.6-v1.0.tar.gz | \
    tar -zxvf -
RUN curl https://repo.ucar.edu/artifactory/xdmod-local/patch/v5.6-patch-01.diff | patch -p1
VOLUME ["/etc/xdmod"]

# Needed to keep the container running
CMD ["/sbin/init"]
