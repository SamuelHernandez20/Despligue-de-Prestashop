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

En este caso la lógica del despliegue esta divida en una parte la instalación del Prestashop y en otra el propio despliegue.

