#jsvc.exec -user tomcat-sam -home /usr/lib/jvm/java-8-openjdk-amd64 -Dcatalina.home=/usr/share/tomcat8 -Dcatalina.base=/tomcat/tomcat-sam -Djava.io.tmpdir=/tomcat/tomcat-sam/tmp -wait 10 -pidfile /tomcat/tomcat-sam/tmp/tomcat.pid -outfile /tomcat/tomcat-sam/logs/catalina.out -errfile &1 -Xms256m -Xmx1048m -Djava.awt.headless=true -Duser.timezone=America/Denver -DucarAuth.config=/tomcat/tomcat-sam/var/sam.complete.properties -DPropertiesDir=/tomcat/tomcat-sam/var/sam.complete.properties -Dsam.errormail.to=sweg-notify@ucar.edu -Dsam.errormail.from=sweg-notify@ucar.edu -Dlogback.configurationFile=/tomcat/tomcat-sam/var/logback.xml -cp /usr/lib/jvm/java-8-openjdk-amd64/lib/tools.jar:/usr/share/tomcat8/bin/bootstrap.jar:/usr/share/tomcat8/bin/tomcat-juli.jar:/tomcat/tomcat-sam/bin/commons-daemon.jar:/usr/share/tomcat8/lib/* org.apache.catalina.startup.Bootstrap

export TC_TEST_HOME=/Users/bsterner/Development/sam-environments/sam-test
export CATALINA_HOME=$TC_TEST_HOME/tomcat8
export CATALINA_BASE=$TC_TEST_HOME/tomcat-sam
export CATALINA_OUT=$CATALINA_BASE/logs/catalina.out
export TCR_DIR=/Users/bsterner/Development/apache-tomcat-resources/sam


#-Djava.io.tmpdir=/tomcat/tomcat-sam/tmp
#-wait 10 -pidfile /tomcat/tomcat-sam/tmp/tomcat.pid
#-outfile /tomcat/tomcat-sam/logs/catalina.out
#-errfile &1 -Xms256m -Xmx1048m
#-Djava.awt.headless=true
TC_CMD="$TC_CMD -Duser.timezone=America/Denver"
TC_CMD="$TC_CMD -DucarAuth.config=$TCR_DIR/sam.complete.properties"
TC_CMD="$TC_CMD -DPropertiesDir=$TCR_DIR/sam.complete.properties"
TC_CMD="$TC_CMD -Dsam.errormail.to=bsterner@ucar.edu"
TC_CMD="$TC_CMD -Dsam.errormail.from=bsterner@ucar.edu"
TC_CMD="$TC_CMD -Dlogback.configurationFile=$TCR_DIR/logback.xml"

export CLASSPATH="$CATALINA_BASE/bin/commons-daemon.jar:$CATALINA_HOME/lib/*"

#TC_CMD="$TC_CMD --classpath $CLASSPATH"
export CLASSPATH=$CLASSPATH

TC_SCRIPT="$CATALINA_HOME/bin/startup.sh"
TC_RUN="$TC_SCRIPT \"$TC_CMD\""

echo "TC_RUN: $TC_RUN"
echo
$TC_RUN
