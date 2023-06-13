FROM ubuntu:jammy
ENV DEBIAN_FRONTEND="noninteractive" 
ENV TZ=Asia/Jakarta
ENV APACHE_LOG_DIR=/usr/local/apache2/logs
RUN apt-get update
RUN apt-get install -y software-properties-common vim apache2 curl unzip cron libapache2-mod-security2
RUN apt-get install certbot -y
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
RUN a2enmod ssl rewrite proxy proxy_http proxy_wstunnel headers
EXPOSE 80 443
CMD rm -f /var/run/apache2/apache2.pid && cron && apachectl -D FOREGROUND 
