FROM tomcat:8.5.73
# Dummy text to test super
COPY target/java-web-app*.war /usr/local/tomcat/webapps/java-web-app.war
