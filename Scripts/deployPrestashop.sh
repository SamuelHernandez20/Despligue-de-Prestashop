#!/bin/bash

#Muestra comandos que se van ejecutando por si falla
set -x

# Actualizamos los repos

apt update -y

# Importación de las variables

source .env

#Instalación de extensiones de PHP:
#--------------------------------------------------
#1. BCMath Arbitrary Precision Mathematics (Recommended)

apt install php-bcmath -y 

#2. Image Processing and GD (Required and Recommended)

apt install php-gd -y 

#3. Internationalization Functions (Intl) (Required and Recommended)

apt install php-intl -y 

#4. Zip (Required and Recommended)

apt install php-zip -y

#5. Memcached y algunas tools (Recommended)

apt install memcached -y

apt install libmemcached-tools -y

#6. Curl

apt install php-curl -y

#7. Cadena multibyte (Mbstring)

apt install php-mbstring -y

#8. 

apt-get install php-dom php-xml


systemctl restart apache2

#---------------------------------------------------

#Modificación de configuración PHP:
#---------------------------------------------------

sed -i "s/memory_limit = 128M/$memory_limit/" /etc/php/8.1/apache2/php.ini

sed -i "s/upload_max_filesize = 2M/$upload_max_filesize/" /etc/php/8.1/apache2/php.ini

sed -i "s/max_input_vars = 1000/$max_input_vars/" /etc/php/8.1/apache2/php.ini

#Reinciar el siguiente archivo para que se aplique la configuración:

systemctl restart apache2

# Instalación de Prestashop

# Traigo el codigo fuente de Prestashop

wget https://github.com/PrestaShop/PrestaShop/archive/refs/tags/8.0.0.tar.gz -P /tmp

# Lo descomprimo en la carpeta temporal

tar -xzvf /tmp/8.0.0.tar.gz -C /tmp



# Mover el contenido de Prestashop a /var/www/html

mv -f /tmp/PrestaShop-8.0.0/* /var/www/html

#Creacion de usuario para la base de datos de Prestashop

mysql -u root <<< "DROP DATABASE IF EXISTS $PRESTASHOP_DB_NAME"
mysql -u root <<< "CREATE DATABASE $PRESTASHOP_DB_NAME"
mysql -u root <<< "DROP USER IF EXISTS '$PRESTASHOP_DB_USER'@'%'"
mysql -u root <<< "CREATE USER '$PRESTASHOP_DB_USER'@'%'IDENTIFIED BY '$PRESTASHOP_DB_PASSWORD'"
mysql -u root <<< "GRANT ALL PRIVILEGES ON $PRESTASHOP_DB_NAME.* TO '$PRESTASHOP_DB_USER'@'%'"
