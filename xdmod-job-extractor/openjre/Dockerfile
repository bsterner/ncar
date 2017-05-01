FROM openjdk:8-jre-alpine

ENV REFRESHED_AT 2017-04-28
LABEL name=xdmod_job_extractor_openjre \
      version=1.0

ENV JAVA_OPTS="-Dxdmod-job-extractor.properties=xdmod-job-extractor.properties"

WORKDIR /usr/local/share

COPY ./security .
COPY xdmod-job-extractor-1.1.5-SNAPSHOT.jar .

EXPOSE 10443

#ENV JAVA_HOME="/etc/alternatives/jre_1.8.0_openjdk"

ENTRYPOINT exec java $JAVA_OPTS -jar ./xdmod-job-extractor-1.1.5-SNAPSHOT.jar
