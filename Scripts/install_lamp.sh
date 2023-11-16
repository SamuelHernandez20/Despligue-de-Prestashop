#!/bin/bash

#Muestra comandos que se van ejecutando por si falla
set -x

# Actualizamos los repos

dnf update

# Actualizar paquetes 

#yum upgrade

#Instalar apache

dnf install httpd -y

# Iniciar el servidor httpd:

systemctl start httpd

# Arrancar automaticamente:

systemctl enable httpd

# instalar sgbd mysql

dnf install -y mariadb105

#Instalacion del php

dnf install php-mbstring php-zip php-mysqli php-json php-gd php-fpm php-xml -y

# Antes de nada pasamos con la eliminación de descargas previas del phpmyadmin:
#------------------------------------------------------------------------------
rm -rf /tmp/phpMyAdmin-5.2.1-all-languages.zip

rm -rf /var/www/html/phpmyadmin
#------------------------------------------------------------------------------

# Obtener codigo fuente en la carpeta temporal:

wget https://files.phpmyadmin.net/phpMyAdmin/5.2.1/phpMyAdmin-5.2.1-all-languages.zip -P /tmp

# Instalo el unzip para descomprimir:

dnf install unzip -y

#descompresion en la carpeta /tmp

unzip -u /tmp/phpMyAdmin-5.2.1-all-languages.zip -d /var/www/html

#persnalizar el nombre

mv /var/www/html/phpMyAdmin-5.2.1-all-languages /var/www/html/phpmyadmin

#cambiar propietario y grupo:

chown -R apache:apache /var/www/html

#Copiar el archivo de conf de apache

cp ../conf/000-default.conf /etc/httpd/conf.d

#Reiniciar servicio

systemctl restart httpd

# copiar archivo php 

cp ../php/phpinfo.php /var/www/html

# modificar el propietario y grupo de /var/www/html para usuario de apache

chown -R apache:apache /var/www/html

