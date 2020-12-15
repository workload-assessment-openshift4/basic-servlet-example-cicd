CURRENT_NAMSPACE=$(oc project -q)

#Install pipeline in current namespace
oc apply -f serviceaccount.yaml
oc apply -f basic-servlet-example-deploy.yaml

# Create a DEV namespace for the application
oc new-project basic-servlet-example-dev
oc adm policy add-role-to-user -n basic-servlet-example-dev edit system:serviceaccount:$CURRENT_NAMSPACE:deploy-bot

oc project $CURRENT_NAMSPACE
