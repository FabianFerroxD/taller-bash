# Módulo 3 — Herramientas avanzadas y scripting básico

**Objetivos:** filtros de texto, tuberías y redirecciones, `grep`, análisis de registros, empaquetado (`tar`/`zip`) y primeros scripts en Bash.

---

## Ejercicio 1 — Visualización de archivos (`cat`, `head`, `tail`, `wc`)

**Objetivo:** leer archivos del taller.

```bash
head -5 documentos/notas.txt
tail -3 logs/server.log
wc -l documentos/poema.txt
wc -w documentos/poema.txt
cat documentos/contactos.csv
head -10 documentos/diccionario.txt
less documentos/tareas.md    # q para salir
```

**Desafío:** ¿cuántas palabras tiene `documentos/poema.txt`?

---

## Ejercicio 2 — Búsqueda con `grep`

**Objetivo:** patrones literales, conteo e inversión.

```bash
grep -i "error" logs/server.log
grep -c "INFO" logs/server.log
grep "Buenos Aires" documentos/contactos.csv
grep -v "ERROR" logs/server.log | head
grep -i "error" temp/archivo1.txt
grep "DEBUG" temp/debug.log
grep -c "timeout" logs/error.log
```

**Pregunta:** ¿cuántos timeouts hay en `logs/error.log`?

---

## Ejercicio 3 — `cut`, `sort`, `uniq` y tuberías

**Objetivo:** columnas, orden y duplicados.

```bash
tail -n +2 documentos/contactos.csv | cut -d',' -f1
tail -n +2 datos/estudiantes.csv | cut -d',' -f5 | sort -u
sort -n temp/numeros.txt
sort temp/numeros.txt | uniq -d
tail -n +2 datos/estudiantes.csv | sort -t',' -k6 -rn | head -5
tail -n +2 datos/estudiantes.csv | cut -d',' -f5 | sort | uniq -c
```

**Pregunta:** ¿cuál es la carrera con más estudiantes?

---

## Ejercicio 4 — Redirecciones y pipes

**Objetivo:** `>`, `>>`, `2>`, tuberías.

```bash
grep ERROR logs/server.log > temp/salida-errores.txt
grep WARNING logs/server.log >> temp/salida-errores.txt
grep "Informática" datos/estudiantes.csv > temp/reporte-informatica.txt
cat datos/estudiantes.csv | grep "Córdoba" | cut -d',' -f2,3,6
awk '{print $1}' logs/access.log | sort -u > temp/ips-unicas.txt
grep " 200 " logs/access.log > temp/peticiones-200.txt
ls carpeta-inexistente 2> temp/errores-ls.txt
```

**Desafío:** creá `temp/top5-numeros.txt` con los 5 números más grandes de `temp/numeros.txt` (usá `sort -n` y `tail`).

---

## Ejercicio 5 — Compresión y archivos (`tar` y `zip`)

**Objetivo:** empaquetar una copia de trabajo sin alterar los originales.

```bash
tar -cf temp/copias/documentos.tar documentos/
tar -tf temp/copias/documentos.tar
tar -czf temp/copias/documentos.tar.gz documentos/
tar -tzf temp/copias/documentos.tar.gz | head
zip -r temp/copias/datos.zip datos/
unzip -l temp/copias/datos.zip | head
```

Creá antes la carpeta: `mkdir -p temp/copias`.

**Buena práctica:** listá el contenido (`-t` / `unzip -l`) antes de extraer en un sistema real.

---

## Ejercicio 6 — Registros del sistema (logs)

**Objetivo:** practicar con archivos tipo `/var/log`.

```bash
wc -l logs/*.log
grep -h "ERROR" logs/*.log | wc -l
awk '{print $1}' logs/nginx_access.log | sort | uniq -c | sort -rn | head -5
awk '{print $9}' logs/nginx_access.log | sort | uniq -c
grep -E " (4[0-9]{2}|5[0-9]{2}) " logs/access.log | wc -l
```

**Pregunta:** ¿qué IP hizo más peticiones en `logs/nginx_access.log`?

---

## Ejercicio 7 — Procesamiento con `awk` (complemento)

**Objetivo:** columnas y agregados (útil en informes; el módulo prioriza `cut`).

```bash
awk -F',' '$6 > 8.5 {print $2, $3, $6}' datos/estudiantes.csv
tail -n +2 datos/ventas.csv | awk -F',' '{sum+=$5} END {print "Total: $" sum}'
cut -d'|' -f1,3 datos/productos.txt | head
```

**Desafío:** ¿cuál es el estudiante con el promedio más alto?

---

## Ejercicio 8 — Variables y scripting básico

**Objetivo:** variables, sustitución de comandos, argumentos y scripts incluidos.

```bash
nombre="Fabi"
echo "Hola, $nombre"
fecha_actual=$(date +"%d/%m/%Y")
echo "Hoy es $fecha_actual"
echo "Usuario: $USER — Home: $HOME"
cant_logs=$(find logs -name '*.log' | wc -l)
echo "Archivos .log en logs/: $cant_logs"
echo "Script: $0 — argumentos: $#"
head -5 scripts/monitor.sh
bash scripts/monitor.sh
bash scripts/analizar_logs.sh
```

**Tarea:** escribí `temp/mi-info.sh` con shebang `#!/bin/bash` que imprima usuario, fecha y cantidad de archivos en el directorio actual. Ejecutalo con `bash temp/mi-info.sh`.

---

## Ejercicio 9 — Gestión de paquetes (solo lectura)

**Objetivo:** relacionar el módulo con `apt` / `dnf` en tu distro (no modifica el taller).

```bash
command -v apt || command -v dnf
apt --help 2>/dev/null | head -5 || dnf --help 2>/dev/null | head -5
```

En Debian/Ubuntu: `apt show bash | head -10`. En Fedora: `dnf info bash | head -10`.

---

## Proyectos integradores (Módulo 3)

### Proyecto A — Reporte de estudiantes

```bash
echo "=== REPORTE DE ESTUDIANTES ===" > temp/reporte_estudiantes.txt
echo "Total: $(tail -n +2 datos/estudiantes.csv | wc -l)" >> temp/reporte_estudiantes.txt
echo "Promedio general: $(tail -n +2 datos/estudiantes.csv | awk -F',' '{sum+=$6} END {print sum/NR}')" >> temp/reporte_estudiantes.txt
tail -n +2 datos/estudiantes.csv | sort -t',' -k6 -rn | head -5 >> temp/reporte_estudiantes.txt
cat temp/reporte_estudiantes.txt
```

### Proyecto B — Inventario y ventas

```bash
echo "=== INVENTARIO Y VENTAS ===" > temp/reporte_inventario.txt
echo "Total ventas: $(tail -n +2 datos/ventas.csv | awk -F',' '{sum+=$5} END {print "$"sum}')" >> temp/reporte_inventario.txt
sort -t'|' -k3 -rn datos/productos.txt | head -1 >> temp/reporte_inventario.txt
awk -F'|' '$5 < 20 {print $2, "Stock:", $5}' datos/productos.txt >> temp/reporte_inventario.txt
```

### Proyecto C — Usuarios en JSON (con `grep` / `cut`)

```bash
grep '"nombre"' datos/usuarios.json | cut -d':' -f2 | tr -d '",' | sed 's/^[[:space:]]*//'
grep -c '"activo": true' datos/usuarios.json
```

---

## Tips del módulo

```bash
history | tail -20
alias ll='ls -la'    # válido solo en la sesión actual
du -sh */
grep -h "ERROR" logs/*.log | wc -l
```
