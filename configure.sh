#!/bin/bash
#
# Script para preparar el entorno para compilar una ROM para Firefox OS
# Developed by abr4xas <me@abr4xas.org>
if [[ $USER != root ]]; then
	echo "#################################################################"
	echo "#         Error: Debe tener privilegios de ROOT                ##"
	echo "#################################################################"
	exit 1
fi
dpkg --add-architecture i386
echo "## Debian Testing" > /etc/apt/sources.list
echo "deb http://ftp.de.debian.org/debian/ testing main contrib non-free" >> /etc/apt/sources.list
echo "#deb-src http://ftp.de.debian.org/debian/ testing main contrib non-free" >> /etc/apt/sources.list
echo "## Security" >> /etc/apt/sources.list
echo "deb http://security.debian.org/ testing/updates main contrib non-free" >> /etc/apt/sources.list
echo "#deb-src http://security.debian.org/ testing/updates main contrib non-free" >> /etc/apt/sources.list
apt-get update -q
apt-get -y dist-upgrade
apt-get -y --force-yes install autoconf2.13 bison bzip2 ccache curl flex gawk gcc g++ g++-multilib git ia32-libs lib32ncurses5-dev lib32z1-dev libgl1-mesa-dev libx11-dev make zip
ccache --max-size 3GB
echo 'SUBSYSTEM=="usb", ATTR{idVendor}=="19d2", MODE="0666", GROUP="plugdev"' > /etc/udev/rules.d/android.rules
echo 'SUBSYSTEM=="usb", ATTR{idVendor}=="18d1", MODE="0666", GROUP="plugdev"' >> /etc/udev/rules.d/android.rules
chmod a+r /etc/udev/rules.d/android.rules
service udev restart
echo "Listo, ya terminamos..."
exit 0
