# Ejercicios prácticos de Bash (IPAP — Módulos 2, 3 y 4)

Material de práctica alineado con las diapositivas `modulo02.odp`, `modulo03.odp` y `modulo04.odp`, y con el programa del curso.

## Cómo empezar

```bash
cd ruta/al/repo/cursor_ipap_linux/taller-bash
ls -lah ejercicios_modulo*.md
cd bash_practica
pwd
ls -lah
```

La guía y los ejercicios viven en `taller-bash/`; los datos y las prácticas, en `taller-bash/bash_practica/`. Los archivos de datos del taller **no** deben borrarse ni moverse fuera de sus carpetas; para copiar, renombrar o eliminar usá `bash_practica/temp/` o creá archivos nuevos ahí.

## Ejercicios por módulo

| Módulo | Contenido del curso | Archivo de ejercicios |
|--------|---------------------|------------------------|
| **2** | Línea de comandos y sistema de archivos (`cd`, `pwd`, `ls`, `mkdir`, `cp`, `mv`, `rm`, globbing, ayuda) | [ejercicios_modulo02.md](ejercicios_modulo02.md) |
| **3** | Filtros, redirecciones, tuberías, `grep`, logs, compresión, scripting básico | [ejercicios_modulo03.md](ejercicios_modulo03.md) |
| **4** | Procesos, red, usuarios, permisos, configuración del sistema | [ejercicios_modulo04.md](ejercicios_modulo04.md) |

## Material de apoyo

- [SINTAXIS.md](SINTAXIS.md) — referencia rápida de comandos
- [INFORME.md](INFORME.md) — qué archivo usa cada ejercicio
- `test.sh` — verificación automática (ejecutar desde `taller-bash/`; entra solo en `bash_practica`)

## Verificación rápida

```bash
cd taller-bash
bash test.sh
```
