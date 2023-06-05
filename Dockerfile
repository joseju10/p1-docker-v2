FROM php:7.4-apache
MAINTAINER José Juan Hervás Carrasco "josejuanhervascarrasco@gmail.com"
RUN apt-get update && apt-get install -y mariadb-client && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN docker-php-ext-install mysqli pdo pdo_mysql && docker-php-ext-enable pdo_mysql
ADD bookmedik /var/www/html/
ADD script.sh /opt/
RUN chmod +x /opt/script.sh
EXPOSE 80
ENTRYPOINT ["/opt/script.sh"]
