FROM registry.access.redhat.com/ubi8/ubi:8.6-855

MAINTAINER Jesus Arriola <arriola.jesus@hotmail.com>

ENV PORT 8080

LABEL description="A custom Apache container based on UBI 8"

RUN yum install -y httpd && yum clean all

RUN sed -ri -e "/^Listen 80/c\Listen ${PORT}" /etc/httpd/conf/httpd.conf && chown -R apache:apache /etc/httpd/logs/ && chown -R apache:apache /run/httpd/ && chmod -R 0755 /run/httpd/ /etc/httpd/logs/

RUN echo "Hello from Containerfile" > /var/www/html/index.html

USER apache

EXPOSE ${PORT}

CMD ["httpd", "-D", "FOREGROUND"]
