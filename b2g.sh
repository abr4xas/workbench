#!/bin/bash
#
# Script para preparar el entorno para compilar una ROM para Firefox OS
# Developed by abr4xas <me@abr4xas.org>

echo " "
echo "         Obteniendo las fuentes de B2G           "
echo " "
### You will need to increase Git’s HTTP buffer by setting the git config var
git config --global http.postBuffer 5242880000
### Clonamos el repo
git clone https://github.com/mozilla-b2g/B2G.git
cd B2G
cp userconfig ~/B2G/.userconfig
### Para evitar un posible error que no pueda verificar la clave pública hacemos lo siguiente:
### Fuente: http://gnulinuxvagos.es/topic/2090-compilandoinstalando-la-última-versión-de-firefox-os-para-el-zte-open/
curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ./repo
chmod a+w repo

        echo " "
        echo "              Finalizado                        "
        echo "              Happy Hacking!                    "
        echo "                    :)                          "
        echo " "
exit 0
