FROM cisl-repo/xdmod_job_extractor_maven:1.0

ENV REFRESHED_AT 2017-04-28
LABEL name=xdmod_job_extractor \
      version=1.0

##ENV XDMOD_MAJOR=5.6 \
##    XDMOD_VERSION=5.6.0-1.0
##ENV XDMOD_RPM=xdmod-${XDMOD_VERSION}.el7.centos
#
##LABEL edu.ucar.cisl.open-xdmod.version ${XDMOD_VERSION}
#
#WORKDIR /usr/local/share
##
#RUN yum-config-manager --add-repo http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo --enable
#RUN yum -y install apache-maven
##RUN yum -y install git
##
#
#ENV JAVA_OPTS="-Dxdmod-job-extractor.properties=xdmod-job-extractor/xdmod-job-extractor.properties"
#
#RUN git clone https://bsterner:ra1der#45@github.com/NCAR/xdmod-job-extractor
#COPY pom.xml ./xdmod-job-extractor
COPY security/xdmod-job-extractor.properties ./xdmod-job-extractor
COPY ./security/sam-tomcat.ucar.edu.keystore ./xdmod-job-extractor/security/
#
#RUN mvn -Djar.finalName=xdmod-job-extractor -Dmaven.test.skip=true -f xdmod-job-extractor clean package
RUN mvn -Djar.finalName=xdmod-job-extractor -Dmaven.test.skip=true -f xdmod-job-extractor package

EXPOSE 10443

#java -jar $JAVA_OPTS ./xdmod-job-extractor/target/xdmod-job-extractor-1.1.5-SNAPSHOT.jar
#CMD ["java", "-jar", "$JAVA_OPTS", "./xdmod-job-extractor/target/xdmod-job-extractor-1.1.5-SNAPSHOT.jar"]

CMD ["/sbin/init"]