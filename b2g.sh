#!/bin/bash
# Script para preparar el entorno para compilar una ROM para Firefox OS
# Developed by abr4xas <me@abr4xas.org>

echo "#################################"
echo "#Obteniendo las fuentes de B2G ##"
echo "#################################"

### Clonamos el repo
git clone https://github.com/mozilla-b2g/B2G.git
cd B2G
### Para actualizar el repo local al commit más nuevo.
git pull
### Para evitar un posible error que no pueda verificar la clave pública hacemos lo siguiente:
### Fuente: http://gnulinuxvagos.es/topic/2090-compilandoinstalando-la-última-versión-de-firefox-os-para-el-zte-open/
curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ./repo
chmod a+w repo
echo "######################################################"
echo "#                       Finalizado                  ##"
echo "#                      Happy Hackin!                ##"
echo "# BTW, no olvides comentar el repo de testing ;)    ##"	
echo "######################################################"
