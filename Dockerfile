# Dockerfile
FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y apache2 && \
    apt-get clean

# Copy website files to Apache directory
COPY . /var/www/html/

# Change Apache default port from 80 to 82
RUN sed -i 's/80/82/g' /etc/apache2/ports.conf && \
    sed -i 's/80/82/g' /etc/apache2/sites-enabled/000-default.conf

EXPOSE 82

CMD ["apachectl", "-D", "FOREGROUND"]

