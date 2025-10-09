# 📚 Ejercicios Prácticos de Bash

## 🎯 Nivel 1: Básico

### Ejercicio 1: Navegación y Exploración
**Objetivo:** Familiarizarse con la estructura del proyecto

```bash
# 1. Navega al directorio bash_practice
cd C:\Users\USUARIO\bash_practice

# 2. Lista todos los directorios
ls -d */

# 3. Cuenta cuántos archivos .txt hay en total
find . -name "*.txt" | wc -l

# 4. Muestra el árbol de directorios (primeros 2 niveles)
find . -maxdepth 2 -type d
```

**Pregunta:** ¿Cuántos archivos .log encontraste?

---

### Ejercicio 2: Visualización de Archivos
**Objetivo:** Practicar comandos de lectura

```bash
# 1. Muestra las primeras 5 líneas de notas.txt
head -5 documentos/notas.txt

# 2. Muestra las últimas 3 líneas de server.log
tail -3 logs/server.log

# 3. Cuenta las líneas del archivo poema.txt
wc -l documentos/poema.txt

# 4. Muestra el contenido de contactos.csv
cat documentos/contactos.csv

# 5. Lee el archivo de tareas pendientes
cat documentos/tareas.md

# 6. Visualiza el diccionario
head -10 documentos/diccionario.txt
```

**Desafío:** ¿Cuántas palabras tiene el archivo poema.txt?

---

### Ejercicio 3: Búsqueda con grep
**Objetivo:** Encontrar patrones en archivos

```bash
# 1. Busca la palabra "error" en server.log (insensible a mayúsculas)
grep -i "error" logs/server.log

# 2. Cuenta cuántas veces aparece "INFO" en server.log
grep -c "INFO" logs/server.log

# 3. Busca líneas que contengan "Buenos Aires" en contactos.csv
grep "Buenos Aires" documentos/contactos.csv

# 4. Busca recursivamente la palabra "función" en todos los archivos
grep -r "función" .

# 5. Muestra las líneas que NO contienen "ERROR" en server.log
grep -v "ERROR" logs/server.log

# 6. Busca la palabra "error" en archivos temporales
grep -i "error" temp/archivo1.txt

# 7. Busca patrones "DEBUG" en debug.log
grep "DEBUG" temp/debug.log

# 8. Busca en archivo2.txt
grep -i "[A-Z]" temp/archivo2.txt

# 9. Busca en archivo3.log
grep "Status" temp/archivo3.log
```

**Pregunta:** ¿Cuántos errores de tipo "timeout" hay en error.log?

---

### Ejercicio 4: Variables y Entorno
**Objetivo:** Aprender a trabajar con variables en Bash

```bash
# 1. Crear y usar variables
nombre="Fabi"
echo "Hola, $nombre"

# 2. Guardar salida de comandos
fecha_actual=$(date +"%Y-%m-%d")
echo "La fecha actual es: $fecha_actual"

# 3. Variables de entorno
echo "Tu usuario es: $USER"
echo "Tu directorio home es: $HOME"

# 4. Variables numéricas
contador=5
total_archivos=$(ls -1 | wc -l)
echo "Hay $total_archivos archivos en el directorio actual"

# 5. Variables de solo lectura
readonly VERSION="1.0"
# VERSION="2.0"  # Esto dará error

# 6. Variables especiales
echo "Nombre del script: $0"
echo "Primer argumento: $1"
echo "Número de argumentos: $#"
echo "Todos los argumentos: $@"

# 7. Variables de entorno personalizadas
export MI_VARIABLE="valor_exportado"
echo $MI_VARIABLE

# 8. Procesar salida de comandos
espacio_disco=$(df -h / | awk 'NR==2 {print $5}')
echo "Espacio en disco usado: $espacio_disco"

# 9. Longitud de una cadena
cadena="Hola Mundo"
longitud=${#cadena}
echo "La cadena '$cadena' tiene $longitud caracteres"
```

**Ejercicios Prácticos:**
1. Crea un script que muestre:
   - Tu nombre de usuario
   - La fecha actual en formato "Hoy es DD/MM/YYYY"
   - El espacio libre en disco en formato legible
   - El número de archivos en el directorio actual

2. Crea una función que reciba un nombre de archivo como parámetro y muestre:
   - Si el archivo existe
   - Su tamaño en bytes
   - Sus permisos
   - Su fecha de modificación

3. Escribe un comando que cuente cuántos archivos .log hay en el directorio logs y guarde el resultado en una variable.

---

## 🎯 Nivel 2: Intermedio

### Ejercicio 4: Procesamiento con awk y cut
**Objetivo:** Extraer y procesar columnas de datos

```bash
# 1. Extrae solo los nombres del archivo contactos.csv
tail -n +2 documentos/contactos.csv | cut -d',' -f1

# 2. Extrae emails y ciudades
tail -n +2 documentos/contactos.csv | cut -d',' -f2,4

# 3. Muestra estudiantes con promedio mayor a 8.5
awk -F',' '$6 > 8.5 {print $2, $3, $6}' datos/estudiantes.csv

# 4. Calcula el promedio de todos los estudiantes
tail -n +2 datos/estudiantes.csv | awk -F',' '{sum+=$6; count++} END {print sum/count}'

# 5. Extrae códigos de producto y precios
cut -d'|' -f1,3 datos/productos.txt

# 6. Extrae productos y totales de ventas
tail -n +2 datos/ventas.csv | cut -d',' -f2,5

# 7. Calcula el total de ventas
tail -n +2 datos/ventas.csv | awk -F',' '{sum+=$5} END {print "Total: $" sum}'

# 8. Extrae información de usuarios JSON
grep '"nombre"' datos/usuarios.json | cut -d':' -f2

# 9. Extrae temperaturas de una ciudad específica
grep "Buenos Aires" datos/temperaturas.txt
```

**Desafío:** ¿Cuál es el estudiante con el promedio más alto?

---

### Ejercicio 5: Ordenamiento y Filtrado
**Objetivo:** Organizar datos con sort y uniq

```bash
# 1. Ordena los números en numeros.txt
sort -n temp/numeros.txt

# 2. Encuentra números duplicados (si los hay)
sort temp/numeros.txt | uniq -d

# 3. Ordena estudiantes por promedio (descendente)
tail -n +2 datos/estudiantes.csv | sort -t',' -k6 -rn

# 4. Lista las carreras únicas
tail -n +2 datos/estudiantes.csv | cut -d',' -f5 | sort -u

# 5. Cuenta estudiantes por carrera
tail -n +2 datos/estudiantes.csv | cut -d',' -f5 | sort | uniq -c

# 6. Ordena ventas por total (descendente)
tail -n +2 datos/ventas.csv | sort -t',' -k5 -rn

# 7. Lista productos únicos vendidos
tail -n +2 datos/ventas.csv | cut -d',' -f2 | sort -u

# 8. Ordena el diccionario alfabéticamente
sort documentos/diccionario.txt | head -10

# 9. Ordena tareas por estado
grep "\[x\]" documentos/tareas.md | sort
```

**Pregunta:** ¿Cuál es la carrera con más estudiantes?

---

### Ejercicio 6: Redirecciones y Pipes
**Objetivo:** Combinar comandos y guardar resultados

```bash
# 1. Guarda todos los errores en un archivo nuevo
grep ERROR logs/server.log > errores_encontrados.txt

# 2. Agrega las advertencias al mismo archivo
grep WARNING logs/server.log >> errores_encontrados.txt

# 3. Crea un reporte de estudiantes de Informática
grep "Informática" datos/estudiantes.csv > reporte_informatica.txt

# 4. Combina múltiples comandos con pipes
cat datos/estudiantes.csv | grep "Córdoba" | cut -d',' -f2,3,6

# 5. Cuenta palabras únicas en el diccionario
cat documentos/diccionario.txt | wc -l

# 6. Guarda las IPs únicas de access.log
awk '{print $1}' logs/access.log | sort -u > ips_unicas.txt

# 7. Filtra solo peticiones exitosas (código 200)
grep " 200 " logs/access.log > peticiones_exitosas.txt

# 8. Combina múltiples archivos temporales
cat temp/archivo1.txt temp/archivo2.txt > archivos_combinados.txt

# 9. Extrae información de configuración
grep "host=" config/database.conf > hosts_db.txt
```

**Desafío:** Crea un archivo con los 5 números más grandes de numeros.txt

---

## 🎯 Nivel 3: Avanzado

### Ejercicio 7: Análisis de Logs
**Objetivo:** Extraer información útil de logs

```bash
# 1. Encuentra las IPs únicas en nginx_access.log
awk '{print $1}' logs/nginx_access.log | sort -u

# 2. Cuenta cuántas peticiones hizo cada IP
awk '{print $1}' logs/nginx_access.log | sort | uniq -c | sort -rn

# 3. Lista los códigos de estado HTTP
awk '{print $9}' logs/nginx_access.log | sort | uniq -c

# 4. Encuentra las URLs más solicitadas
awk '{print $7}' logs/nginx_access.log | sort | uniq -c | sort -rn

# 5. Filtra solo las peticiones con error (4xx y 5xx)
awk '$9 >= 400 {print}' logs/nginx_access.log

# 6. Analiza también el archivo access.log
awk '{print $1, $6, $9}' logs/access.log

# 7. Compara errores entre access.log y nginx_access.log
grep -E " (4[0-9]{2}|5[0-9]{2}) " logs/access.log | wc -l

# 8. Analiza el log de errores
awk '/ERROR/ {print $0}' logs/error.log | tail -5

# 9. Extrae información de debug.log por timestamp
awk '/10:00/ {print}' temp/debug.log
```

**Pregunta:** ¿Qué IP hizo más peticiones?

---

### Ejercicio 8: Procesamiento de Datos Complejos
**Objetivo:** Combinar múltiples comandos

```bash
# 1. Calcula la temperatura promedio por ciudad
awk '{sum[$2]+=$3; count[$2]++} END {for(city in sum) print city, sum[city]/count[city]}' datos/temperaturas.txt

# 2. Encuentra el producto más caro
sort -t'|' -k3 -rn datos/productos.txt | head -1

# 3. Lista productos con stock bajo (menos de 20 unidades)
awk -F'|' '$5 < 20 {print $2, $5}' datos/productos.txt

# 4. Cuenta cuántos productos hay por categoría
cut -d'|' -f4 datos/productos.txt | sort | uniq -c

# 5. Calcula el valor total del inventario
awk -F'|' '{total+=$3*$5} END {print "Total: $" total}' datos/productos.txt

# 6. Encuentra el producto más vendido
tail -n +2 datos/ventas.csv | awk -F',' '{sum[$2]+=$3} END {for(p in sum) print p, sum[p]}' | sort -k2 -rn | head -1

# 7. Calcula ventas totales por fecha
awk -F',' 'NR>1 {sum[$1]+=$5} END {for(d in sum) print d, "$"sum[d]}' datos/ventas.csv | sort

# 8. Procesa usuarios activos del JSON
awk '/"activo": true/ {count++} END {print "Activos:", count}' datos/usuarios.json

# 9. Analiza configuración de nginx
awk '/worker_processes|keepalive_timeout/ {print}' config/nginx.conf
```

**Desafío:** Encuentra los 3 estudiantes con mejor promedio de cada carrera

---

### Ejercicio 9: Búsquedas Avanzadas con find y grep
**Objetivo:** Dominar búsquedas complejas

```bash
# 1. Encuentra archivos modificados hoy
find . -type f -mtime 0

# 2. Busca archivos mayores a 1KB
find . -type f -size +1k -ls

# 3. Encuentra archivos .sh y hazlos ejecutables
find . -name "*.sh" -type f -exec chmod +x {} \;

# 4. Busca la palabra "error" en todos los .log
find . -name "*.log" -exec grep -l "error" {} \;

# 5. Lista archivos vacíos
find . -type f -empty

# 6. Busca archivos de configuración
find config -name "*.conf" -type f

# 7. Busca la palabra "localhost" en archivos de config
find config -type f -exec grep -l "localhost" {} \;

# 8. Busca archivos de texto en temp
find temp -name "*.txt" -type f

# 9. Busca archivos CSV en datos
find datos -name "*.csv" -type f -ls
```

**Pregunta:** ¿Cuántos archivos .csv hay en el proyecto?

---

### Ejercicio 10: Scripts y Automatización
**Objetivo:** Ejecutar y modificar scripts

```bash
# 1. Ejecuta el script de monitoreo
bash scripts/monitor.sh

# 2. Ejecuta con opción verbose
bash scripts/monitor.sh -v

# 3. Guarda el reporte en archivo
bash scripts/monitor.sh -f

# 4. Analiza los logs del servidor
bash scripts/analizar_logs.sh

# 5. Procesa el archivo CSV
bash scripts/procesar_csv.sh

# 6. Ejecuta el script de backup
bash scripts/backup.sh

# 7. Busca archivos con el script de búsqueda
bash scripts/buscar_archivos.sh
```

**Desafío:** Modifica `analizar_logs.sh` para que acepte el nombre del archivo como parámetro

---

## 🏆 Ejercicios Integradores

### Proyecto 1: Reporte de Estudiantes
**Objetivo:** Crear un reporte completo de estudiantes

```bash
# Crea un archivo reporte_estudiantes.txt que contenga:
# 1. Total de estudiantes
# 2. Promedio general
# 3. Estudiante con mejor promedio
# 4. Estudiantes por carrera
# 5. Top 5 mejores promedios

echo "=== REPORTE DE ESTUDIANTES ===" > reporte_estudiantes.txt
echo "" >> reporte_estudiantes.txt
echo "Total: $(tail -n +2 datos/estudiantes.csv | wc -l)" >> reporte_estudiantes.txt
echo "Promedio general: $(tail -n +2 datos/estudiantes.csv | awk -F',' '{sum+=$6} END {print sum/NR}')" >> reporte_estudiantes.txt
echo "" >> reporte_estudiantes.txt
echo "Top 5 promedios:" >> reporte_estudiantes.txt
tail -n +2 datos/estudiantes.csv | sort -t',' -k6 -rn | head -5 >> reporte_estudiantes.txt
```

---

### Proyecto 2: Análisis de Inventario y Ventas
**Objetivo:** Generar reporte de productos y ventas

```bash
# Crea un reporte que muestre:
# 1. Total de productos en inventario
# 2. Valor total del inventario
# 3. Productos con stock crítico (< 20)
# 4. Producto más caro
# 5. Productos por categoría
# 6. Total de ventas del mes
# 7. Producto más vendido
# 8. Ventas por día

echo "=== REPORTE DE INVENTARIO Y VENTAS ===" > reporte_inventario.txt
echo "" >> reporte_inventario.txt
echo "Total productos: $(tail -n +1 datos/productos.txt | wc -l)" >> reporte_inventario.txt
echo "Total ventas: $(tail -n +2 datos/ventas.csv | awk -F',' '{sum+=$5} END {print "$"sum}')" >> reporte_inventario.txt
echo "" >> reporte_inventario.txt
echo "Producto más caro:" >> reporte_inventario.txt
sort -t'|' -k3 -rn datos/productos.txt | head -1 >> reporte_inventario.txt
echo "" >> reporte_inventario.txt
echo "Stock crítico:" >> reporte_inventario.txt
awk -F'|' '$5 < 20 {print $2, "Stock:", $5}' datos/productos.txt >> reporte_inventario.txt
```

---

### Proyecto 3: Dashboard de Logs Completo
**Objetivo:** Crear un dashboard de monitoreo unificado

```bash
# Analiza todos los logs y crea un reporte que incluya:
# 1. Total de errores en todos los logs (server.log, error.log, access.log, debug.log)
# 2. Tipos de errores más comunes
# 3. Actividad por hora
# 4. IPs más activas (nginx_access.log y access.log)
# 5. Códigos HTTP más frecuentes
# 6. Comparación entre access.log y nginx_access.log
# 7. Mensajes DEBUG más frecuentes

echo "=== DASHBOARD DE LOGS ===" > dashboard_logs.txt
echo "" >> dashboard_logs.txt
echo "Total errores server.log: $(grep -c ERROR logs/server.log)" >> dashboard_logs.txt
echo "Total errores error.log: $(grep -c ERROR logs/error.log)" >> dashboard_logs.txt
echo "Total peticiones access.log: $(wc -l < logs/access.log)" >> dashboard_logs.txt
echo "Total peticiones nginx: $(wc -l < logs/nginx_access.log)" >> dashboard_logs.txt
echo "Total mensajes debug: $(wc -l < temp/debug.log)" >> dashboard_logs.txt
echo "" >> dashboard_logs.txt
echo "IPs más activas (access.log):" >> dashboard_logs.txt
awk '{print $1}' logs/access.log | sort | uniq -c | sort -rn | head -3 >> dashboard_logs.txt
```

---

### Proyecto 4: Análisis de Configuraciones
**Objetivo:** Extraer información de archivos de configuración

```bash
# Analiza los archivos de configuración y crea un reporte:
# 1. Lista todos los hosts configurados
# 2. Extrae configuraciones de base de datos
# 3. Encuentra todos los puertos configurados
# 4. Lista configuraciones de logging
# 5. Compara settings entre diferentes entornos

echo "=== ANÁLISIS DE CONFIGURACIONES ===" > reporte_config.txt
echo "" >> reporte_config.txt
echo "Hosts configurados:" >> reporte_config.txt
cat config/hosts.txt >> reporte_config.txt
echo "" >> reporte_config.txt
echo "Puertos en uso:" >> reporte_config.txt
grep -h "port=" config/*.conf | sort -u >> reporte_config.txt
echo "" >> reporte_config.txt
echo "Configuración Database (production):" >> reporte_config.txt
grep -A 6 "\[production\]" config/database.conf >> reporte_config.txt
echo "" >> reporte_config.txt
echo "Configuración Nginx (workers):" >> reporte_config.txt
grep "worker" config/nginx.conf >> reporte_config.txt
echo "" >> reporte_config.txt
echo "Logging settings:" >> reporte_config.txt
grep -A 3 "\[Logging\]" config/settings.conf >> reporte_config.txt
```

---

### Proyecto 5: Procesamiento de JSON
**Objetivo:** Trabajar con datos JSON usando herramientas bash

```bash
# Extrae información del archivo usuarios.json:
# 1. Lista todos los nombres de usuarios
# 2. Cuenta usuarios activos vs inactivos
# 3. Extrae todos los emails
# 4. Busca usuarios específicos

# Usando grep y herramientas básicas
echo "=== REPORTE DE USUARIOS JSON ===" > reporte_usuarios.txt
echo "" >> reporte_usuarios.txt
echo "Nombres de usuarios:" >> reporte_usuarios.txt
grep '"nombre"' datos/usuarios.json | cut -d':' -f2 | tr -d '",' | sed 's/^[[:space:]]*//' >> reporte_usuarios.txt
echo "" >> reporte_usuarios.txt
echo "Usuarios activos: $(grep '"activo": true' datos/usuarios.json | wc -l)" >> reporte_usuarios.txt
echo "Usuarios inactivos: $(grep '"activo": false' datos/usuarios.json | wc -l)" >> reporte_usuarios.txt
echo "" >> reporte_usuarios.txt
echo "Emails:" >> reporte_usuarios.txt
grep '"email"' datos/usuarios.json | cut -d':' -f2 | tr -d '",' | sed 's/^[[:space:]]*//' >> reporte_usuarios.txt
```

---

## 💡 Tips y Trucos

### Comandos Útiles
```bash
# Ver historial de comandos
history | tail -20

# Buscar en el historial
history | grep "grep"

# Crear alias temporal
alias ll='ls -la'

# Ver tamaño de directorios
du -sh */

# Encontrar archivos grandes
find . -type f -size +100k -exec ls -lh {} \;

# Contar líneas de código
find . -name "*.py" -o -name "*.js" | xargs wc -l

# Buscar en múltiples logs a la vez
grep -h "ERROR" logs/*.log | wc -l

# Comparar contenido de archivos
diff temp/archivo1.txt temp/archivo2.txt

# Comparar archivos de log
diff <(awk '{print $1}' logs/access.log | sort -u) <(awk '{print $1}' logs/nginx_access.log | sort -u)

# Buscar patrones en archivos de configuración
grep -r "port" config/

# Procesar archivos JSON con grep y cut
grep -o '"[^"]*":[^,}]*' datos/usuarios.json

# Analizar múltiples logs de temp
for log in temp/*.log; do echo "=== $log ==="; head -3 "$log"; done

# Extraer palabras del diccionario que empiezan con vocal
grep "^[AEIOUaeiou]" documentos/diccionario.txt | head -10

# Buscar configuraciones de timeout
grep -i "timeout" config/*.conf

# Contar líneas en todos los archivos de notas
wc -l documentos/notas.txt documentos/poema.txt documentos/tareas.md
```

### Atajos de Teclado en Bash
- `Ctrl + R`: Buscar en historial
- `Ctrl + A`: Ir al inicio de línea
- `Ctrl + E`: Ir al final de línea
- `Ctrl + U`: Borrar línea
- `Ctrl + L`: Limpiar pantalla
- `Tab`: Autocompletar

---

## 📝 Soluciones

Las soluciones a estos ejercicios las puedes encontrar experimentando en el terminal.
Recuerda que la mejor forma de aprender es practicando y cometiendo errores.

**¡Buena suerte! 🚀**
