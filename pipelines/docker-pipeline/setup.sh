# oc apply -f docker-build-pipeline/maven-task-2.yaml
oc apply -f gogs/gogs-secret-basic-servlet.yaml
oc apply -f nexus-secret.yaml
oc apply -f serviceaccount.yaml
oc apply -f docker-build-pipeline/docker-pipeline.yaml
