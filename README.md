# workbench

![Firefox OS](http://mozorg.cdn.mozilla.net/media/img/styleguide/identity/firefoxos/wordmark-standard-grey.png)


Script para preparar el entorno para compilar una ROM para Firefox OS [DEBIAN]


## Como usar

Simplemente en nuestra consola como ROOT ejecutamos:

```bash
./configure.sh
```

Luego, ejecutamos sin ser ROOT:

```bash
./b2g.sh
```
Para automatizar el proceso de clonación, actualización y sincronización del repo B2G.

## userconfig

Este archivo debe ir dentro de B2G/ 

```bash
.userconfig
```

Ahí ya tiene todas las variables de entorno necesarias para compilar nuestra ROM.

Solo debemos cambiar unas cosas y son:

```bash
export GAIA_DISTRIBUTION_DIR=/home/abr4xas/B2G
export L10NBASEDIR="/home/abr4xas/B2G/gecko-l10n"
```
Por:

```bash
export GAIA_DISTRIBUTION_DIR=/home/usuario/B2G
export L10NBASEDIR="/home/usuario/B2G/gecko-l10n"
```
Donde: usuario es, obviamente tu nombre de usuario y listo.

## Inari

Para iniciar el proceso de creación de la ROM para el ZTE Open (inari) debemos hacer lo siguiente:

```bash
./config.sh inari
```
Esto va a tardar un poco dependiendo la conexión que tengamos contratada ;)
Esperamos que termine y luego seguimos con el siguiente paso.

## vegnuxmod.sh

Luego de darle permisos de ejecución:

```bash
./vegnuxmod.sh
```
NO USAR AUN.


## NOTA

Funciona para debian estable. :)

Recuerden que hay que colocar permisos de ejecución a los archivos para que puedan funcionar ;)

Aun en desarrollo, pronto anunciaré una versión estable de estos script 

## Licencia de uso

GPL v2
