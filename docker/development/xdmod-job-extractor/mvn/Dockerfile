FROM cisl-repo/xdmod_job_extractor_base:1.0

ENV REFRESHED_AT 2017-04-28
LABEL name=xdmod_job_extractor_mvn \
      version=1.0

ENV JAVA_OPTS="-Dxdmod-job-extractor.properties=xdmod-job-extractor/xdmod-job-extractor.properties"
ARG GITHUB_PASSWORD

#RUN git clone https://bsterner:${GITHUB_PASSWORD}@github.com/NCAR/xdmod-job-extractor
RUN git clone https://bsterner:${GITHUB_PASSWORD}@github.com/bsterner/ncar
RUN mv ncar/xdmod-job-extractor .
RUN rm -Rf ncar

RUN mvn -Dmaven.test.skip=true -f xdmod-job-extractor clean install
#-Djar.finalName=xdmod-job-extractor -Dmaven.test.skip=true -f xdmod-job-extractor clean package

#CMD ["/sbin/init"]