FROM debian

COPY default /etc/nginx/sites-available

RUN apt-get update && \
    apt-get install -y gnupg2 wget && \
    wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | apt-key add - && \
    sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list' && \
    apt-get update && \
    apt-get -y install jenkins nginx && \
    apt-get clean

CMD service nginx restart && service jenkins start && tail -f /var/log/jenkins/*
