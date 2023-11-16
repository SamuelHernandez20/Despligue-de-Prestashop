#!/bin/bash

#Muestra comandos que se van ejecutando por si falla
set -x

# Actualizamos los repos

dnf update -y

# Importación de las variables

source .env

#Instalación de extensiones de PHP:
#--------------------------------------------------
#1. BCMath Arbitrary Precision Mathematics (Recommended)

dnf install php-bcmath -y 

#2. Image Processing and GD (Required and Recommended)

dnf install php-gd -y 

#3. Internationalization Functions (Intl) (Required and Recommended)

dnf install php-intl -y 

#4. Zip (Required and Recommended)

dnf install php-zip -y

#5. Memcached (Recommended)

dnf install memcached -y

dnf install libmemcached-tools -y
#---------------------------------------------------

#Modificación de configuración PHP:
#---------------------------------------------------

sed -i "s/memory_limit = 128M/$memory_limit/" /etc/php.ini

sed -i "s/post_max_size = 8M/$post_max_size/" /etc/php.ini

sed -i "s/upload_max_filesize = 2M/$upload_max_filesize/" /etc/php.ini

sed -i "s/max_input_vars = 1000/$max_input_vars/" /etc/php.ini

#Reinciar el siguiente archivo para que se aplique la configuración:

systemctl restart php-fpm.service