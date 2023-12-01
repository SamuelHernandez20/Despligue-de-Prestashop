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

# 1.1 Configuración de los requisitos, extensiones y variables

En este caso la lógica del despliegue esta divida en una parte la **instalación del Prestashop** y en otra el propio **despliegue**.

Habrá que tener definido en algun lado el phpinfo.php en el directorio donde este descomprimido el **Prestashop**, para que a la hora de acceder a traves del navegador se puedan observar bien los requisitos:

