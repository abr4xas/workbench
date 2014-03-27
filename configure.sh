#!/bin/bash
# Script para preparar el entorno para compilar una ROM para Firefox OS
# Developed by abr4xas <me@abr4xas.org>

if [[ $USER != root ]]; then
	echo "#################################################################"
	echo "#         Error: Debe tener privilegios de ROOT                ##"
	echo "#################################################################"
fi
	echo "#################################################################"
	echo "#              Agregando soporte Multiarch                     ##"
	echo "#################################################################"

dpkg --add-architecture i386
apt-get update
apt-get -y install packagename:i386
apt-get -y install cmake autoconf2.13 bison bzip2 ccache curl flex gawk gcc g++ g++-multilib gcc-4.6 g++-4.6 g++-4.6-multilib git ia32-libs lib32ncurses5-dev lib32z1-dev libgl1-mesa-dev libx11-dev make zip libusb-1.0-0 libusb-1.0-0-dev zlib1g-dev:i386
export CC=gcc-4.6
export CXX=g++-4.6
ccache –max-size 3GB
echo 'SUBSYSTEM=="usb", ATTR{idVendor}=="19d2", MODE="0666", GROUP="plugdev"' > /etc/udev/rules.d/android.rules
echo 'SUBSYSTEM=="usb", ATTR{idVendor}=="18d1", MODE="0666", GROUP="plugdev"' >> /etc/udev/rules.d/android.rules
chmod a+r /etc/udev/rules.d/android.rules
service udev restart

	echo "########################################################################################################"
	echo "#                  Necesito las herramientas ADB (android debug bridge)                               ##"
	echo "# Por favor, agrega a tu sources.list el siguiente repo: 												##"
	echo "# deb http://ftp.debian.org/debian testing main contrib non-free 										##"
	echo "# Continuamos? Y/N 														                            ##"	
	echo "########################################################################################################"

if [[ $continuar = Y ]]; then
		echo "#################################################################"
		echo "#    Instalando las herramientas ADB (android debug bridge)    ##"
		echo "#################################################################"

apt-get update
apt-get -y install android-tools-adb android-tools-fastboot

		echo "#################################################################"
		echo "#              Obteniendo las fuentes de B2G                   ##"
		echo "#################################################################"

git clone https://github.com/mozilla-b2g/B2G.git
cd B2G
git pull
./repo sync
curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ./repo
chmod a+w repo

		echo "#################################################################"
		echo "#                       Finalizado                             ##"
		echo "#                      Happy Hackin!                           ##"
		echo "# BTW, no olvides comentar el repo de testing ;)               ##"	
		echo "#################################################################"	
	elif [[ $continuar = N]]; then
		echo "#################################################################"
		echo "#     Ha sido cancelado TODO el proceso por el usuario         ##"
		echo "#                      :(                                      ##"
		echo "#################################################################"	
fi

if [[ $continuar != Y || $continuar != N]]; then
	echo "#################################################################################################"
	echo "#    Debes indicar si deseas continuar seleccionando Y/N o cancelar todo el proceso con Ctrl+C ##"
	echo "#################################################################################################"
fi		