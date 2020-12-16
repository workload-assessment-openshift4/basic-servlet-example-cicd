CATALINA_PROPERTIES=$JWS_HOME/conf/catalina.properties
SEARCH_DIR=/etc/files/
SEARCH_NAME='catalina.properties'
#Find and append all files - ignoring if path contains '..'
find $SEARCH_DIR  -not -path '*\.\.*' -name $SEARCH_NAME \
  -exec sh -c "echo Appending to $CATALINA_PROPERTIES: {}" \; \
  -exec sh -c "echo '# Properties from' {} >>$CATALINA_PROPERTIES && cat {} >>$CATALINA_PROPERTIES && echo >>$CATALINA_PROPERTIES" \;
