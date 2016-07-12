FROM centos:6
MAINTAINER rmkn
RUN yum -y update
RUN yum -y install httpd php php-mbstring php-xml unzip
RUN curl -o /tmp/monstra-3.0.4.zip -SL https://bitbucket.org/Awilum/monstra/downloads/monstra-3.0.4.zip \
        && unzip /tmp/monstra-3.0.4.zip -d /var/www/html/ \
        && rm /tmp/monstra-3.0.4.zip \
        && mv /var/www/html/monstra-3.0.4 /var/www/html/monstra \
        && chmod 777 /var/www/html/monstra \
        && chown -R apache. /var/www/html/monstra

EXPOSE 80
COPY vhosts.conf /etc/httpd/conf.d/vhosts.conf
COPY security.conf /etc/httpd/conf.d/securpty.conf
COPY init.sh /tmp/init.sh
RUN /tmp/init.sh && rm /tmp/init.sh
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

