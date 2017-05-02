FROM openjdk:8-jre-alpine

ENV REFRESHED_AT 2017-04-28
LABEL name=xdmod_job_extractor_openjre \
      version=1.0

VOLUME /tmp

WORKDIR /usr/local/share

#COPY ./security .
#COPY xdmod-job-extractor-1.1.5-SNAPSHOT.jar .

ADD xdmod-job-extractor-1.1.5-SNAPSHOT.jar app.jar
ADD security/ .

RUN sh -c 'touch app.jar'

EXPOSE 10443

ENV JAVA_OPTS="-Dxdmod-job-extractor.properties=xdmod-job-extractor.properties"

#ENTRYPOINT ["java", $JAVA_OPTS, "-jar","/app.jar"]
ENTRYPOINT ["java","-Dxdmod-job-extractor.properties=xdmod-job-extractor.properties", "-jar", "app.jar"]

#ENTRYPOINT exec java $JAVA_OPTS -jar ./xdmod-job-extractor-1.1.5-SNAPSHOT.jar
