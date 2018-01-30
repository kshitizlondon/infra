FROM jenkins/jenkins:2.100-alpine

USER root
RUN apt-get update
RUN apt-get install -y sudo
RUN rm -rf /var/lib/apt/lists/*
RUN groupadd -g 114 docker
RUN usermod -a -G docker jenkins
RUN usermod -a -G sudo jenkins
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

RUN /usr/local/bin/install-plugins.sh workflow-aggregator greenballs subversion ws-cleanup codesonar appdynamics-dashboard bitbucket-build-status-notifier stashNotifier build-timestamp

USER jenkins
