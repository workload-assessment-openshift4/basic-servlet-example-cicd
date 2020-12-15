# oc apply -f docker-build-pipeline/maven-task-2.yaml
oc apply -f gogs-secret-basic-servlet.yaml
oc apply -f nexus-secret.yaml
oc apply -f serviceaccount.yaml
oc apply -f docker-pipeline.yaml
