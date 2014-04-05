#!/bin/bash

export branches="master v1.4 v1.3"
export workdir=$(pwd)


updateb2g(){
echo "* updating gaia & gecko..."
./repo sync gaia
./repo sync gecko
./repo sync vegnuxmod
./repo sync gonk-misc
echo "* updating gaia & gecko languages..."
./repo sync gaia-l10n/de
./repo sync gaia-l10n/el
./repo sync gaia-l10n/es
./repo sync gaia-l10n/fr
./repo sync gaia-l10n/hu
./repo sync gaia-l10n/it
./repo sync gaia-l10n/pl
./repo sync gaia-l10n/pt-BR
./repo sync gaia-l10n/ru
./repo sync compare-locales
./repo sync gecko-l10n/es-ES
echo "* copying xulrunner & vm-bootanimation to b2g..."
cp ../../xulrunner-30.0a1.en-US.linux-x86_64.sdk.tar.bz2 gaia/.
cp ../../vm-bootanimation.zip gonk-misc/bootanimation.zip
}

updateall(){
./repo sync -j4
}

cleanb2g(){
for i in gaia gecko* o* vegnuxmod compare-locales gonk-misc;do
echo "* Removing $i ..."
rm -r $i 2>/dev/null
done

# cleaning gaia languajes
for i in de el es fr hu it pl pt-BR ru;do
cd gaia-l10n
echo "* Removing gaia-l10n/$i ..."
rm -r $i 2>/dev/null
cd ..
done
}

help(){
echo ""
echo "********************************************"
echo "$0 version 0.1  by cargabsj175"
echo "********************************************"
echo ""
echo "-h help"
echo "-p prepare"
echo "-b build"
echo "-c clean b2g directories"
echo "-C clean all directories"
echo "-u update b2g repos"
echo "-U update all repos"
echo ""
}

cleanall(){
# cleaning projects
for i in abi bionic bootable build \
		compare-locales dalvik development \
		device external frameworks gaia \
		gecko gecko-l10n gonk-misc hardware\
		kernel lib* ndk o* patches \
		prebuilt rilproxy system vendor vegnuxmod;do
echo "* Removing $i ..."
rm -r $i 2>/dev/null
done
# cleaning gaia languajes
for i in de el es fr hu it pl pt-BR ru;do
cd gaia-l10n
echo "* Removing gaia-l10n/$i ..."
rm -r $i 2>/dev/null
cd ..
done
}

if [[ "$1" = "-p" || "$1" = "--prepare" ]]; then
# preparing
for revision in $branches;do
cd ${revision}
echo "** Preparing for ${revision}..."
echo "** clean old builds..."
cleanb2g # wipe old builds
echo "** Updating repos..."
updateb2g # update specific b2g stuff
cd ${workdir}
done
exit 0
elif [[ "$1" = "--build" || "$1" = "-b" ]]; then
#building
for revision in $branches;do
cd ${revision}
echo "** Starting building for ${revision}..."
./build.sh -j10 # build b2g
output="images-hamachi-${revision}-$(date +%Y%m%d)" # set output directory name
mkdir ../images/${output} # creates output directory name
cp out/target/product/hamachi/system.img ../images/${output}
cp -R ../images/skel/* ../images/${output}
cd ../images
tar cJvf ${output}.tar.xz ${output}
cd ${workdir}
done
exit 0
elif [[ "$1" = "--help" || "$1" = "-h" ]]; then
help
exit 0
elif [[ "$1" = "--cleanb2g" || "$1" = "-c" ]]; then
for revision in ${branches};do
cd ${revision}
cleanb2g
cd .. ${workdir}
done
exit 0
elif [[ "$1" = "--cleanall" || "$1" = "-C" ]]; then
for revision in ${branches};do
cd ${revision}
cleanall
cd .. ${workdir}
done
exit 0
elif [[ "$1" = "--updateb2g" || "$1" = "-u" ]]; then
for revision in ${branches};do
cd ${revision}
updateb2g
cd .. ${workdir}
done
exit 0
elif [[ "$1" = "--updateall" || "$1" = "-U" ]]; then
for revision in ${branches};do
cd ${revision}
updateall
cd .. ${workdir}
done
exit 0
fi

help

