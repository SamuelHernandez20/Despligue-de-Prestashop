#!/bin/bash

#Muestra comandos que se van ejecutando por si falla
set -x

# Actualizamos los repos

apt update -y

# Actualizar paquetes 

#apt upgrade -y

# Instalacion de apache
apt install apache2 -y

# Iniciar el servidor httpd:

systemctl start apache2

# Arrancar automaticamente:

systemctl enable apache2

# instalar sgbd mysql

apt install mysql-server -y

# Iniciar servidor de apache

systemctl start apache2

# Activar automaticamente

systemctl enable apache2

#Instalacion del php

apt install php libapache2-mod-php php-mysql -y

systemctl restart apache2

# reinicio
#---------------------------->
systemctl restart apache2


# Antes de nada pasamos con la eliminación de descargas previas del phpmyadmin:
#------------------------------------------------------------------------------
rm -rf /tmp/phpMyAdmin-5.2.1-all-languages.zip

rm -rf /var/www/html/phpmyadmin
#------------------------------------------------------------------------------

# Obtener codigo fuente en la carpeta temporal:

wget https://files.phpmyadmin.net/phpMyAdmin/5.2.1/phpMyAdmin-5.2.1-all-languages.zip -P /tmp

# Instalo el unzip para descomprimir:
systemctl restart apache2

apt install unzip -y

#descompresion en la carpeta /tmp

unzip -u /tmp/phpMyAdmin-5.2.1-all-languages.zip -d /var/www/html

#persnalizar el nombre

mv /var/www/html/phpMyAdmin-5.2.1-all-languages /var/www/html/phpmyadmin

#cambiar propietario y grupo:

chown -R www-data:www-data /var/www/html

#Copiar el archivo de conf de apache

cp ../conf/000-default.conf /etc/apache2/sites-available 

systemctl restart apache2


#Reiniciar servicio

systemctl restart apache2

# copiar archivo php 

cp ../php/phpinfo.php /var/www/html

# modificar el propietario y grupo de /var/www/html para usuario de apache

chown -R www-data:www-data /var/www/html

