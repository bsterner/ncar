FROM centos:7

ENV REFRESHED_AT 2017-04-28
LABEL name=xdmod_job_extractor_base \
      version=1.0

WORKDIR /usr/local/share

RUN yum-config-manager --add-repo http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo --enable
RUN yum -y install apache-maven
RUN yum -y install git

ENV JAVA_HOME="/etc/alternatives/jre_1.8.0_openjdk"
