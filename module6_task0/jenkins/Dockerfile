FROM jenkins/jenkins:lts-jdk11

# work directory path
WORKDIR /module6_task0

# user name
USER jenkins

# do not change the administrator password 
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"

# where to copy the plugins installation file 
COPY --chown=jenkins:jenkins plugins.txt /usr/share/jenkins/ref/plugins.txt

# run the installation of the plugins in the txt file
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt

CMD ["/sbin/tini", "--", "/usr/local/bin/jenkins.sh"]
