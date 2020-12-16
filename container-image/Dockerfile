FROM nexus-container-registry-nexus.apps.cluster-3bcb.sandbox1869.opentlc.com/jboss-webserver-5/webserver54-openjdk11-tomcat9-openshift-rhel8:latest

ARG  CICD_DIR

COPY *.war /deployments/ROOT.war
COPY $CICD_DIR/setenv.sh $JWS_HOME/bin/