# Módulo 2 — Línea de comandos y sistema de archivos

**Objetivos:** orientarse en el árbol de directorios, listar y crear archivos, copiar y mover con seguridad, usar patrones (globbing) y consultar la documentación.

> En Linux real, carpetas como `config/` y `logs/` de este taller **simulan** `/etc` y `/var/log`. En un sistema, consultá la jerarquía FHS antes de escribir fuera de tu home.

---

## Ejercicio 1 — Orientación y exploración

**Objetivo:** `cd`, `pwd` y visión general del proyecto.

```bash
cd taller-bash/bash_practica    # datos del taller; la guía está en taller-bash/
pwd
cd ..
pwd
cd -                           # vuelve al directorio anterior
ls -d */
find . -maxdepth 1 -type d
```

**Preguntas:**

1. ¿Cuántas carpetas de primer nivel hay en `bash_practica`?
2. ¿Qué devuelve `echo ~` y en qué se diferencia de `pwd`?

---

## Ejercicio 2 — Inspeccionar con `ls`

**Objetivo:** listado largo, ocultos, tamaños legibles y orden por fecha.

```bash
ls -lah
ls -lh documentos/
ls -lt logs/ | head
ls -ld config logs datos
ls -R datos | head -20
```

**Desafío:** en el listado largo de `documentos/notas.txt`, identificá propietario, grupo, tamaño y fecha de modificación.

---

## Ejercicio 3 — Crear, copiar, mover y eliminar (solo en `temp/`)

**Objetivo:** `mkdir`, `touch`, `cp`, `mv`, `rm` sin tocar datos del taller.

```bash
mkdir -p temp/modulo2/practica
touch temp/modulo2/practica/nota.txt temp/modulo2/practica/lista.txt
cp documentos/notas.txt temp/modulo2/practica/notas-copia.txt
cp -r temp/modulo2 temp/modulo2-respaldo
mv temp/modulo2/practica/lista.txt temp/modulo2/practica/indice.txt
rm -i temp/modulo2/practica/nota.txt
rmdir temp/modulo2/practica 2>/dev/null || ls temp/modulo2/practica
```

**Regla:** no uses `rm -r` sobre `datos/`, `logs/`, `scripts/` ni `config/`.

---

## Ejercicio 4 — Globbing (patrones de nombres)

**Objetivo:** `*`, `?` y `[]` con archivos del taller.

```bash
ls documentos/*.txt
ls logs/*.log
ls datos/estudiante?.csv 2>/dev/null || ls datos/*.csv
ls temp/archivo[123].*
printf '%s\n' [A-Z]* 2>/dev/null | head -3
```

**Pregunta:** ¿Cuántos archivos `.log` hay en `logs/` usando solo un patrón (sin `find`)?

---

## Ejercicio 5 — Navegación y conteos

**Objetivo:** combinar rutas relativas y absolutas con búsqueda simple.

```bash
cd documentos && pwd && ls
cd ../logs && wc -l *.log
cd ..
find . -name "*.txt" | wc -l
find . -name "*.log" | wc -l
```

**Pregunta:** ¿Cuántos archivos `.log` encontraste en todo el proyecto?

---

## Ejercicio 6 — Ayuda y documentación

**Objetivo:** `man`, `--help` y lectura prudente de la documentación.

```bash
man ls | head -20        # q para salir
ls --help | head -15
whatis ls 2>/dev/null || type ls
```

**Práctica:** anotá en `temp/ayuda-modulo2.txt` (con `touch` y redirección simple) la opción de `ls` que muestra archivos ocultos y la que ordena por tiempo.

---

## Ejercicio 7 — Simulación FHS (conceptual)

**Objetivo:** relacionar carpetas del taller con el sistema real.

| Carpeta en el taller | Analogía en Linux |
|----------------------|-------------------|
| `config/`            | `/etc`            |
| `logs/`              | `/var/log`        |
| `temp/`              | `/tmp` o trabajo local |
| `scripts/`           | `/usr/local/bin` o proyectos propios |

```bash
ls -lah config/
head -5 config/hosts.txt
ls -lah logs/ | tail -5
```

**Reflexión:** ¿por qué la configuración del sistema no debería guardarse mezclada con archivos personales en `/home`?
