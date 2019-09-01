#!/bin/sh

fetch -o /usr/local/apache-tomcat-9.0/webapps/ROOT.war https://github.com/gitbucket/gitbucket/releases/download/4.32.0/gitbucket.war

mkdir -p /var/gitbucket
chown www:www /var/gitbucket

sysrc tomcat9_enable=YES
sysrc tomcat9_prepend="env GITBUCKET_HOME=/var/gitbucket"

service tomcat9 start
