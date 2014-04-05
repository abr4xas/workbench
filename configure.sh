#!/bin/bash
#
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
### Agregando soporte multiarch i386
dpkg --add-architecture i386
### Actualizamos
apt-get update
### Solicitamos la instalación de los paquetes
apt-get -y install git cmake autoconf2.13 bison bzip2 ccache curl flex gawk gcc g++ g++-multilib gcc-4.6 g++-4.6 g++-4.6-multilib git lib32ncurses5 lib32z1-dev libgl1-mesa-dev libx11-dev make zip libusb-1.0-0 libusb-1.0-0-dev zlib1g-dev:i386
### Usaremos GCC 4.6 ya que > a eso da problemas
export CC=gcc-4.6
export CXX=g++-4.6
### Creamos un cache de 3GB
ccache --max-size 3GB
### Creamos las reglas UDEV
echo 'SUBSYSTEM=="usb", ATTR{idVendor}=="19d2", MODE="0666", GROUP="plugdev"' > /etc/udev/rules.d/android.rules
echo 'SUBSYSTEM=="usb", ATTR{idVendor}=="18d1", MODE="0666", GROUP="plugdev"' >> /etc/udev/rules.d/android.rules
### Damos los permisos
chmod a+r /etc/udev/rules.d/android.rules
### Reiniciamos el servivio UDEV
service udev restart
	echo "###################################################################"
	echo "# Necesito las herramientas ADB (android debug bridge)           ##"
	echo "# Por favor, agrega a tu sources.list el siguiente repo: 	       ##"
	echo "# deb http://ftp.debian.org/debian testing main contrib non-free ##"
	echo "# Continuamos? Y/N  					                           ##"	
	echo "###################################################################"
read continuar
if [ $continuar = y ] ; then
		echo "###########################################################"
		echo "# Instalando las herramientas ADB (android debug bridge) ##"
		echo "###########################################################"
### Si agrego el repo de testing, actualizamos
apt-get update
### E instalamos las herramientas ADB
apt-get -y install android-tools-adb android-tools-fastboot

		echo "#####################################################"
		echo "#               Finalizado                         ##"
		echo "#              Happy Hackin!                       ##"
		echo "# BTW, no olvides comentar el repo de testing ;)   ##"	
		echo "#####################################################"	
	elif [ $continuar = n ] ; then
		echo "###########################################################"
		echo "#  Ha sido cancelado TODO el proceso por el usuario :(   ##"
		echo "###########################################################"		
fi		