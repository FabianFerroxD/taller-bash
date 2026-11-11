# Informe: archivos por ejercicio (por módulo)

Referencia cruzada con [ejercicios_modulo02.md](ejercicios_modulo02.md), [ejercicios_modulo03.md](ejercicios_modulo03.md) y [ejercicios_modulo04.md](ejercicios_modulo04.md).

## Módulo 2 — Sistema de archivos

| Ejercicio | Archivos / ámbito |
|-----------|-------------------|
| 1 Orientación | Carpeta de datos `bash_practica/` (ejercicios en `taller-bash/`) |
| 2 `ls` | `documentos/`, `logs/`, `datos/`, `config/` |
| 3 Crear/copiar/mover | `temp/modulo2/` (creado por la persona estudiante) |
| 4 Globbing | `documentos/`, `logs/`, `datos/`, `temp/` |
| 5 Conteos | `documentos/`, `logs/`, búsqueda `*.txt` y `*.log` |
| 6 Ayuda | documentación del sistema (`man`, `--help`) |
| 7 FHS (conceptual) | `config/`, `logs/` |

---

## Módulo 3 — Filtros, pipes y scripting

| Ejercicio | Archivos principales |
|-----------|----------------------|
| 1 Visualización | `documentos/notas.txt`, `poema.txt`, `contactos.csv`, `diccionario.txt`, `tareas.md`, `logs/server.log` |
| 2 `grep` | `logs/server.log`, `error.log`, `documentos/contactos.csv`, `temp/archivo1.txt`, `debug.log` |
| 3 `cut` / `sort` | `documentos/contactos.csv`, `datos/estudiantes.csv`, `temp/numeros.txt` |
| 4 Redirecciones | `logs/server.log`, `datos/estudiantes.csv`, `logs/access.log`, salidas en `temp/` |
| 5 `tar` / `zip` | `documentos/`, `datos/` → `temp/copias/` |
| 6 Logs | `logs/*.log` |
| 7 `awk` | `datos/estudiantes.csv`, `ventas.csv`, `productos.txt` |
| 8 Scripting | `scripts/monitor.sh`, `analizar_logs.sh`; script propio en `temp/` |
| 9 Paquetes | sistema host (`apt` / `dnf`) |
| Proyecto A | `datos/estudiantes.csv` |
| Proyecto B | `datos/productos.txt`, `ventas.csv` |
| Proyecto C | `datos/usuarios.json` |

---

## Módulo 4 — SO, red, permisos y automatización

| Ejercicio | Archivos / ámbito |
|-----------|-------------------|
| 1 Permisos | `documentos/`, `scripts/`, `temp/modulo4-prueba.sh` |
| 2 Enlaces | `temp/enlace-notas.txt` → `documentos/notas.txt` |
| 3 Procesos | `scripts/monitor.sh`, comandos del sistema |
| 4 Red | `config/hosts.txt`; opcional `/etc/resolv.conf`, `ip`, `ping` |
| 5 Usuarios | `getent`, `datos/estudiantes.csv` (simulación) |
| 6 Sesiones | `who`, `w`, `last` en el sistema |
| 7 `find` | `scripts/`, `config/`, `datos/`, `logs/` |
| 8 Scripts | `scripts/*.sh` |
| 9 Configuración | `config/hosts.txt`, `*.conf` |
| Proyecto D | todos los `logs/` |
| Proyecto E–F | `datos/temperaturas.txt`, `productos.txt`, `ventas.csv` |

---

## Salidas generadas en `temp/`

Durante la práctica pueden aparecer, entre otros: `salida-errores.txt`, `reporte-informatica.txt`, `ips-unicas.txt`, `copias/*.tar*`, `reporte_estudiantes.txt`, `dashboard_logs.txt`, `reporte_config.txt`. No forman parte del material original del repo; pueden borrarse al finalizar.
