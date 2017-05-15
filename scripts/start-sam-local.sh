#!/bin/bash

JAVA_OPTS="-DPropertiesDir=/Users/bsterner/Development/apache-tomcat-resources/sam/sam.complete.properties"
JAVA_OPTS="$JAVA_OPTS -DucarAuth.config=/Users/bsterner/Development/apache-tomcat-resources/sam/sam.complete.properties"
JAVA_OPTS="$JAVA_OPTS -Dsam.errormail.from=bsterner-notify@ucar.edu"
JAVA_OPTS="$JAVA_OPTS -Dsam.errormail.to=bsterner@ucar.edu"
JAVA_OPTS="$JAVA_OPTS -Dlogback.configurationFile=/Users/bsterner/Development/apache-tomcat-resources/sam/logback.xml"
JAVA_OPTS="$JAVA_OPTS -Xmx2048M"
JAVA_OPTS="$JAVA_OPTS -Djavax.net.ssl.trustStore=/Users/bsterner/Development/apache-tomcat-webapps/sam-base/conf/tomcat_keystore"
JAVA_OPTS="$JAVA_OPTS -Djavax.net.ssl.trustStorePassword=changeit"

export JAVA_OPTS

# echo "Starting tomcat with CATALINA_HOME = $CATALINA_HOME and CATALINA_BASE = $CATALINA_BASE"
# echo
# echo "JAVA_OPTS=$JAVA_OPTS"
# echo

# pushd $SAM_DIR
# mvn package -Dmaven.test.skip=true
# cp ./target/*.war $CATALINA_BASE/webapps/ROOT.war

$CATALINA_HOME/bin/startup.sh
