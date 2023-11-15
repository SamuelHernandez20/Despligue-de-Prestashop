#!/bin/bash

#Muestra comandos que se van ejecutando por si falla
set -x

# Actualizamos los repos

dnf update

# Actualizar paquetes 

#yum upgrade

#Instalar apache

dnf install httpd -y

# instalar sgbd mysql

dnf install -y mariadb105

#Instalacion del php

dnf install php-mbstring php-zip php-json php-gd php-fpm php-xml -y

#Copiar el archivo de conf de apache

cp ../conf/000-default.conf /etc/httpd/conf.d

#Reiniciar servicio

systemctl restart httpd

# copiar archivo php 

cp ../php/phpinfo.php /var/www/html

# modificar el propietario y grupo de /var/www/html para usuario de apache

chown -R apache:apache /var/www/html

