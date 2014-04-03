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

Este archivo debe ir dento de B2G/ 

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


## NOTA

Recuerden que hay que colocar permisos de ejecución a los archivos para que puedan funcionar ;)
