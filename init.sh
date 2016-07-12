#!/bin/sh

sed -i -e 's/expose_php = On/expose_php = Off/' /etc/php.ini
sed -i -e 's/ServerTokens OS/ServerTokens Prod/' /etc/httpd/conf/httpd.conf
sed -i -e 's/ServerSignature On/ServerSignature Off/' /etc/httpd/conf/httpd.conf
sed -i -e 's/AddDefaultCharset UTF-8/AddDefaultCharset Off/' /etc/httpd/conf/httpd.conf
sed -i -e 's/Options Indexes/Options/' /etc/httpd/conf/httpd.conf

