# Practica-01-08
Para esta práctica habia que realizar la instalación de **Prestashop** de manera automatizada, en este caso para que funcione de manera correcta se instalará la versión **8.1.2**.


````
.
├── README.md
├── conf
│   └── 000-default.conf
└── scripts
    ├── .env
    ├── install_lamp.sh
    ├── install_prestashop.sh
    ├── setup_letsencrypt_https.sh
    └── deploy_prestashop.sh
````
# 1. Despliegue del Prestashop

## 1.1 Configuración de los requisitos, extensiones y variables

En este caso la lógica del despliegue esta divida en una parte la **instalación del Prestashop** y en otra el propio **despliegue**.

Habrá que tener definido en algun lado el phpinfo.php en el directorio donde este descomprimido el **Prestashop**, para que a la hora de acceder a traves del navegador se puedan observar bien los requisitos:


Para cumplir con los requisitos de las extensiones procedo a instalar las siguientes:

`Instalación de extensiones de PHP:`

**1.** BCMath Arbitrary Precision Mathematics (Recommended)

````
apt install php-bcmath -y 
````
**2.** Image Processing and GD (Required and Recommended)

````
apt install php-gd -y 
````
**3.** Internationalization Functions (Intl) (Required and Recommended)

````
apt install php-intl -y 
````
**4.** Zip (Required and Recommended)

````
apt install php-zip -y
````
**5.** Memcached y algunas tools (Recommended)

````
apt install memcached -y
````
````
apt install libmemcached-tools -y
````
**6.** Curl
````
apt install php-curl -y
````
**7.** Cadena multibyte (Mbstring)
````
apt install php-mbstring -y
````
**8.** DOM y XML
````
apt-get install php-dom php-xml
````
`Configuración de variables en el archivo de configuración:`

**Modificación de configuración PHP:**
````
sed -i "s/memory_limit = 128M/$memory_limit/" /etc/php/8.1/apache2/php.ini
````
````
sed -i "s/upload_max_filesize = 2M/$upload_max_filesize/" /etc/php/8.1/apache2/php.ini
````
````
sed -i "s/max_input_vars = 1000/$max_input_vars/" /etc/php/8.1/apache2/php.ini
````
````
sed -i "s/post_max_size = 8M/$post_max_size/" /etc/php/8.1/apache2/php.ini
````

Reiniciar el siguiente archivo para que se aplique la configuración:

systemctl restart apache2




