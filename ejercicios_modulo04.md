# Módulo 4 — Sistema operativo, red, seguridad y práctica

**Objetivos:** interpretar permisos, relacionar procesos y memoria, leer configuración de red y cuentas, usar `find` con criterio y automatizar tareas con scripts.

> Varios comandos del módulo requieren un sistema Linux real (`/proc`, `ip`, `ss`). Donde no aplique en el taller, se indica la alternativa con archivos locales.

---

## Ejercicio 1 — Permisos y propiedad

**Objetivo:** leer el listado largo y practicar `chmod` solo en archivos que creés vos.

```bash
ls -l documentos/notas.txt scripts/monitor.sh
stat documentos/notas.txt
touch temp/modulo4-prueba.sh
chmod u+x temp/modulo4-prueba.sh
ls -l temp/modulo4-prueba.sh
chmod 644 temp/modulo4-prueba.sh
ls -l temp/modulo4-prueba.sh
```

**Reflexión:** ¿qué significan `rwx` para usuario, grupo y otros en `ls -l`?

---

## Ejercicio 2 — Enlaces y rutas

**Objetivo:** enlaces simbólicos (`ln -s`).

```bash
ln -sf ../../documentos/notas.txt temp/enlace-notas.txt
ls -l temp/enlace-notas.txt
head -3 temp/enlace-notas.txt
readlink temp/enlace-notas.txt
```

No crees enlaces duros sobre archivos del repo salvo que estés en la misma partición y entiendas las implicancias.

---

## Ejercicio 3 — Procesos y memoria (sistema real)

**Objetivo:** `ps`, `top`, `free` como en el módulo 4.

```bash
ps
ps aux | head -10
ps -u "$USER" | head -10
free -h
```

Opcional (interactivo): `top` — salí con `q`.

Al ejecutar scripts del taller:

```bash
bash scripts/monitor.sh &
sleep 1
ps aux | grep -F monitor.sh | grep -v grep
```

---

## Ejercicio 4 — Red y resolución de nombres

**Objetivo:** DNS y hosts; en el taller usamos `config/hosts.txt` como analogía de `/etc/hosts`.

```bash
cat config/hosts.txt
grep -v '^#' config/hosts.txt | grep -v '^$'
```

En tu máquina Linux (si tenés permiso de lectura):

```bash
getent hosts localhost
head -5 /etc/resolv.conf 2>/dev/null
ip addr show 2>/dev/null | head -20
ping -c 2 127.0.0.1
ss -tuln 2>/dev/null | head -10
```

**Práctica:** compará el formato de `config/hosts.txt` con una línea de `/etc/hosts`.

---

## Ejercicio 5 — Usuarios y grupos (sistema real)

**Objetivo:** identidad sin exponer secretos.

```bash
id
groups
getent passwd "$USER"
getent group
sudo -l 2>/dev/null || echo "Revisá sudoers con tu administrador local"
```

**No** imprimas ni copies el contenido de `/etc/shadow`. Para ver metadatos:

```bash
sudo stat /etc/shadow 2>/dev/null || stat /etc/shadow 2>/dev/null
```

En el taller, simulá campos de cuenta con CSV:

```bash
cut -d',' -f2,3 datos/estudiantes.csv | head -5
```

---

## Ejercicio 6 — Sesiones y actividad (sistema real)

```bash
whoami
who 2>/dev/null | head -5
w 2>/dev/null | head -5
last -n 3 2>/dev/null
```

---

## Ejercicio 7 — Búsquedas con `find`

**Objetivo:** localizar scripts, logs y configuración.

```bash
find . -name "*.sh" -type f
find config -name "*.conf" -type f
find . -name "*.log" -exec grep -l -i error {} \;
find datos -name "*.csv" -type f
find . -type f -size +1k | head -10
find . -type f -empty
```

**Pregunta:** ¿cuántos archivos `.csv` hay en `datos/`?

---

## Ejercicio 8 — Scripts de administración del taller

**Objetivo:** ejecutar y revisar automatizaciones.

```bash
chmod +x scripts/*.sh
bash scripts/monitor.sh
bash scripts/monitor.sh -v
bash scripts/analizar_logs.sh
bash scripts/procesar_csv.sh
bash scripts/backup.sh
bash scripts/buscar_archivos.sh
```

**Desafío:** abrí `scripts/analizar_logs.sh` y proponé cómo aceptar el nombre del log como primer argumento (`$1`).

---

## Ejercicio 9 — Análisis de configuración

**Objetivo:** extraer datos de archivos tipo `/etc`.

```bash
cat config/hosts.txt
grep -h "port=" config/*.conf | sort -u
grep -A 6 "\[production\]" config/database.conf
grep "worker" config/nginx.conf
grep -A 3 "\[Logging\]" config/settings.conf
grep -ri "timeout" config/
```

Generá un informe:

```bash
{
  echo "=== ANÁLISIS DE CONFIGURACIONES ==="
  echo "Hosts:"
  grep -v '^#' config/hosts.txt
  echo "Puertos:"
  grep -h "port=" config/*.conf | sort -u
} > temp/reporte_config.txt
cat temp/reporte_config.txt
```

---

## Proyectos integradores (Módulo 4)

### Proyecto D — Dashboard de logs

```bash
{
  echo "=== DASHBOARD DE LOGS ==="
  echo "Errores server.log: $(grep -c ERROR logs/server.log)"
  echo "Errores error.log: $(grep -c ERROR logs/error.log)"
  echo "Líneas access.log: $(wc -l < logs/access.log)"
  echo "Líneas nginx: $(wc -l < logs/nginx_access.log)"
  echo "IPs más activas:"
  awk '{print $1}' logs/access.log | sort | uniq -c | sort -rn | head -3
} > temp/dashboard_logs.txt
cat temp/dashboard_logs.txt
```

### Proyecto E — Datos complejos (inventario + red lógica)

```bash
awk '{sum[$2]+=$3; count[$2]++} END {for(c in sum) print c, sum[c]/count[c]}' datos/temperaturas.txt
awk -F'|' '{total+=$3*$5} END {print "Inventario: $" total}' datos/productos.txt
```

### Proyecto F — Datos complejos con ventas

```bash
tail -n +2 datos/ventas.csv | awk -F',' '{sum[$2]+=$3} END {for(p in sum) print p, sum[p]}' | sort -k2 -rn | head -3
```

---

## Cierre del taller

Recorré los tres módulos en orden, guardá tus salidas en `temp/` y desde `taller-bash/` ejecutá `bash test.sh` para comprobar que el entorno responde como esperás.

**Buena práctica:** en producción, combiná permisos mínimos, revisión de logs y cambios de configuración versionados — el taller condensa esas ideas en archivos locales seguros.
