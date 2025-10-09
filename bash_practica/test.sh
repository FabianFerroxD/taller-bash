#!/bin/bash

# Script de prueba para todos los ejercicios de Bash
# Autor: Generado automáticamente
# Fecha: 2025-10-08

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Contador de pruebas
TOTAL_TESTS=0
PASSED_TESTS=0
FAILED_TESTS=0

# Función para imprimir encabezados
print_header() {
    echo ""
    echo -e "${BLUE}========================================${NC}"
    echo -e "${BLUE}$1${NC}"
    echo -e "${BLUE}========================================${NC}"
}

# Función para imprimir sub-encabezados
print_subheader() {
    echo ""
    echo -e "${YELLOW}--- $1 ---${NC}"
}

# Función para ejecutar y verificar comandos
run_test() {
    local test_name="$1"
    local command="$2"
    TOTAL_TESTS=$((TOTAL_TESTS + 1))
    
    echo -n "  [$TOTAL_TESTS] $test_name... "
    
    if eval "$command" > /dev/null 2>&1; then
        echo -e "${GREEN}✓ PASS${NC}"
        PASSED_TESTS=$((PASSED_TESTS + 1))
        return 0
    else
        echo -e "${RED}✗ FAIL${NC}"
        FAILED_TESTS=$((FAILED_TESTS + 1))
        return 1
    fi
}

# Función para ejecutar comando y mostrar resultado
run_and_show() {
    local test_name="$1"
    local command="$2"
    TOTAL_TESTS=$((TOTAL_TESTS + 1))
    
    echo ""
    echo -e "${YELLOW}[$TOTAL_TESTS] $test_name${NC}"
    echo -e "${BLUE}Comando:${NC} $command"
    echo -e "${BLUE}Resultado:${NC}"
    
    if eval "$command"; then
        echo -e "${GREEN}✓ PASS${NC}"
        PASSED_TESTS=$((PASSED_TESTS + 1))
        return 0
    else
        echo -e "${RED}✗ FAIL${NC}"
        FAILED_TESTS=$((FAILED_TESTS + 1))
        return 1
    fi
}

# Inicio del script
clear
echo -e "${GREEN}╔════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║   TEST DE EJERCICIOS PRÁCTICOS DE BASH    ║${NC}"
echo -e "${GREEN}╔════════════════════════════════════════════╗${NC}"
echo ""
echo "Directorio de trabajo: $(pwd)"
echo "Fecha: $(date)"

# ============================================
# NIVEL 1: BÁSICO
# ============================================

print_header "🎯 NIVEL 1: BÁSICO"

# Ejercicio 1: Navegación y Exploración
print_subheader "Ejercicio 1: Navegación y Exploración"
run_test "Listar directorios" "ls -d */ | wc -l"
run_test "Contar archivos .txt" "find . -name '*.txt' -type f | wc -l"
run_test "Mostrar árbol de directorios" "find . -maxdepth 2 -type d | head -5"
run_test "Contar archivos .log" "find . -name '*.log' -type f | wc -l"

# Ejercicio 2: Visualización de Archivos
print_subheader "Ejercicio 2: Visualización de Archivos"
run_test "head notas.txt" "head -5 documentos/notas.txt"
run_test "tail server.log" "tail -3 logs/server.log"
run_test "wc poema.txt" "wc -l documentos/poema.txt"
run_test "cat contactos.csv" "cat documentos/contactos.csv"
run_test "cat tareas.md" "cat documentos/tareas.md"
run_test "head diccionario.txt" "head -10 documentos/diccionario.txt"
run_test "Contar palabras en poema.txt" "wc -w documentos/poema.txt"

# Ejercicio 3: Búsqueda con grep
print_subheader "Ejercicio 3: Búsqueda con grep"
run_test "grep error en server.log" "grep -i 'error' logs/server.log"
run_test "Contar INFO en server.log" "grep -c 'INFO' logs/server.log"
run_test "grep Buenos Aires" "grep 'Buenos Aires' documentos/contactos.csv"

# Ejercicio 4: Variables y Entorno
print_subheader "Ejercicio 4: Variables y Entorno"
run_test "Variables básicas" "nombre='Fabi'; echo \"Hola, $nombre\""
run_test "Variables de entorno" "echo \"Usuario: $USER - Home: $HOME\""
run_test "Salida de comandos" "fecha=$(date +'%Y-%m-%d'); echo \"La fecha es: $fecha\""
run_test "Contar archivos .log" "cant_logs=$(find logs -name '*.log' | wc -l); echo \"Hay $cant_logs archivos de log\""
run_test "Variables de solo lectura" "readonly VERSION='1.0'; echo \"Versión: $VERSION\""
run_test "Variables especiales" "echo \"Script: $0 - Número de argumentos: $#\""
run_test "grep recursivo función" "grep -r 'función' . 2>/dev/null | head -1"
run_test "grep inverso ERROR" "grep -v 'ERROR' logs/server.log"
run_test "grep error en archivo1.txt" "grep -i 'error' temp/archivo1.txt"
run_test "grep DEBUG en debug.log" "grep 'DEBUG' temp/debug.log"
run_test "grep en archivo2.txt" "grep -i '[A-Z]' temp/archivo2.txt"
run_test "grep Status en archivo3.log" "grep 'Status' temp/archivo3.log"
run_test "Contar timeout en error.log" "grep -c 'timeout' logs/error.log"

# ============================================
# NIVEL 2: INTERMEDIO
# ============================================

print_header "🎯 NIVEL 2: INTERMEDIO"

# Ejercicio 4: Procesamiento con awk y cut
print_subheader "Ejercicio 4: Procesamiento con awk y cut"
run_test "cut nombres contactos" "tail -n +2 documentos/contactos.csv | cut -d',' -f1 | head -3"
run_test "cut emails y ciudades" "tail -n +2 documentos/contactos.csv | cut -d',' -f2,4 | head -3"
run_test "awk estudiantes >8.5" "awk -F',' '\$6 > 8.5 {print \$2, \$3, \$6}' datos/estudiantes.csv | head -3"
run_test "awk promedio estudiantes" "tail -n +2 datos/estudiantes.csv | awk -F',' '{sum+=\$6; count++} END {print sum/count}'"
run_test "cut productos y precios" "cut -d'|' -f1,3 datos/productos.txt | head -3"
run_test "cut ventas" "tail -n +2 datos/ventas.csv | cut -d',' -f2,5 | head -3"
run_test "awk total ventas" "tail -n +2 datos/ventas.csv | awk -F',' '{sum+=\$5} END {print \"Total: \$\" sum}'"
run_test "grep nombres JSON" "grep '\"nombre\"' datos/usuarios.json | cut -d':' -f2 | head -2"
run_test "grep temperaturas" "grep 'Buenos Aires' datos/temperaturas.txt"

# Ejercicio 5: Ordenamiento y Filtrado
print_subheader "Ejercicio 5: Ordenamiento y Filtrado"
run_test "sort numeros.txt" "sort -n temp/numeros.txt | head -5"
run_test "uniq duplicados" "sort temp/numeros.txt | uniq -d"
run_test "sort estudiantes por promedio" "tail -n +2 datos/estudiantes.csv | sort -t',' -k6 -rn | head -3"
run_test "sort carreras únicas" "tail -n +2 datos/estudiantes.csv | cut -d',' -f5 | sort -u"
run_test "uniq contar carreras" "tail -n +2 datos/estudiantes.csv | cut -d',' -f5 | sort | uniq -c"
run_test "sort ventas por total" "tail -n +2 datos/ventas.csv | sort -t',' -k5 -rn | head -3"
run_test "sort productos vendidos" "tail -n +2 datos/ventas.csv | cut -d',' -f2 | sort -u"
run_test "sort diccionario" "sort documentos/diccionario.txt | head -10"
run_test "grep tareas completadas" "grep '\[x\]' documentos/tareas.md | sort"

# Ejercicio 6: Redirecciones y Pipes
print_subheader "Ejercicio 6: Redirecciones y Pipes"
run_test "grep ERROR a archivo" "grep ERROR logs/server.log > /tmp/errores_encontrados.txt && test -f /tmp/errores_encontrados.txt"
run_test "grep WARNING append" "grep WARNING logs/server.log >> /tmp/errores_encontrados.txt && test -f /tmp/errores_encontrados.txt"
run_test "grep Informática" "grep 'Informática' datos/estudiantes.csv > /tmp/reporte_informatica.txt && test -f /tmp/reporte_informatica.txt"
run_test "pipe múltiple" "cat datos/estudiantes.csv | grep 'Córdoba' | cut -d',' -f2,3,6 | head -2"
run_test "wc diccionario" "cat documentos/diccionario.txt | wc -l"
run_test "awk IPs únicas" "awk '{print \$1}' logs/access.log | sort -u > /tmp/ips_unicas.txt && test -f /tmp/ips_unicas.txt"
run_test "grep peticiones 200" "grep ' 200 ' logs/access.log > /tmp/peticiones_exitosas.txt && test -f /tmp/peticiones_exitosas.txt"
run_test "cat archivos temp" "cat temp/archivo1.txt temp/archivo2.txt > /tmp/archivos_combinados.txt && test -f /tmp/archivos_combinados.txt"
run_test "grep host database.conf" "grep 'host=' config/database.conf > /tmp/hosts_db.txt && test -f /tmp/hosts_db.txt"

# ============================================
# NIVEL 3: AVANZADO
# ============================================

print_header "🎯 NIVEL 3: AVANZADO"

# Ejercicio 7: Análisis de Logs
print_subheader "Ejercicio 7: Análisis de Logs"
run_test "awk IPs nginx" "awk '{print \$1}' logs/nginx_access.log | sort -u | head -5"
run_test "awk contar peticiones por IP" "awk '{print \$1}' logs/nginx_access.log | sort | uniq -c | sort -rn | head -3"
run_test "awk códigos HTTP" "awk '{print \$9}' logs/nginx_access.log | sort | uniq -c"
run_test "awk URLs solicitadas" "awk '{print \$7}' logs/nginx_access.log | sort | uniq -c | sort -rn | head -3"
run_test "awk peticiones con error" "awk '\$9 >= 400 {print}' logs/nginx_access.log | head -3"
run_test "awk access.log" "awk '{print \$1, \$6, \$9}' logs/access.log | head -3"
run_test "grep errores access.log" "grep -E ' (4[0-9]{2}|5[0-9]{2}) ' logs/access.log | wc -l"
run_test "awk ERROR en error.log" "awk '/ERROR/ {print \$0}' logs/error.log | tail -5"
run_test "awk debug por timestamp" "awk '/10:00/ {print}' temp/debug.log | head -3"

# Ejercicio 8: Procesamiento de Datos Complejos
print_subheader "Ejercicio 8: Procesamiento de Datos Complejos"
run_test "awk temperatura promedio" "awk '{sum[\$2]+=\$3; count[\$2]++} END {for(city in sum) print city, sum[city]/count[city]}' datos/temperaturas.txt | head -3"
run_test "sort producto más caro" "sort -t'|' -k3 -rn datos/productos.txt | head -1"
run_test "awk stock bajo" "awk -F'|' '\$5 < 20 {print \$2, \$5}' datos/productos.txt"
run_test "cut productos por categoría" "cut -d'|' -f4 datos/productos.txt | sort | uniq -c"
run_test "awk valor inventario" "awk -F'|' '{total+=\$3*\$5} END {print \"Total: \$\" total}' datos/productos.txt"
run_test "awk producto más vendido" "tail -n +2 datos/ventas.csv | awk -F',' '{sum[\$2]+=\$3} END {for(p in sum) print p, sum[p]}' | sort -k2 -rn | head -1"
run_test "awk ventas por fecha" "awk -F',' 'NR>1 {sum[\$1]+=\$5} END {for(d in sum) print d, \"\$\"sum[d]}' datos/ventas.csv | sort | head -3"
run_test "awk usuarios activos JSON" "awk '/\"activo\": true/ {count++} END {print \"Activos:\", count}' datos/usuarios.json"
run_test "awk nginx.conf" "awk '/worker_processes|keepalive_timeout/ {print}' config/nginx.conf"

# Ejercicio 9: Búsquedas Avanzadas con find y grep
print_subheader "Ejercicio 9: Búsquedas Avanzadas con find y grep"
run_test "find archivos modificados hoy" "find . -type f -mtime 0 2>/dev/null"
run_test "find archivos >1KB" "find . -type f -size +1k 2>/dev/null | head -5"
run_test "find archivos .sh" "find . -name '*.sh' -type f 2>/dev/null"
run_test "find grep error en logs" "find . -name '*.log' -exec grep -l 'error' {} \\; 2>/dev/null | head -3"
run_test "find archivos vacíos" "find . -type f -empty 2>/dev/null"
run_test "find archivos .conf" "find config -name '*.conf' -type f 2>/dev/null"
run_test "find grep localhost" "find config -type f -exec grep -l 'localhost' {} \\; 2>/dev/null"
run_test "find .txt en temp" "find temp -name '*.txt' -type f 2>/dev/null"
run_test "find .csv en datos" "find datos -name '*.csv' -type f 2>/dev/null"

# Ejercicio 10: Scripts y Automatización
print_subheader "Ejercicio 10: Scripts y Automatización"
run_test "Verificar monitor.sh existe" "test -f scripts/monitor.sh"
run_test "Verificar analizar_logs.sh existe" "test -f scripts/analizar_logs.sh"
run_test "Verificar procesar_csv.sh existe" "test -f scripts/procesar_csv.sh"
run_test "Verificar backup.sh existe" "test -f scripts/backup.sh"
run_test "Verificar buscar_archivos.sh existe" "test -f scripts/buscar_archivos.sh"

# ============================================
# PROYECTOS INTEGRADORES
# ============================================

print_header "🏆 EJERCICIOS INTEGRADORES"

# Proyecto 1: Reporte de Estudiantes
print_subheader "Proyecto 1: Reporte de Estudiantes"
run_test "Contar estudiantes" "tail -n +2 datos/estudiantes.csv | wc -l"
run_test "Promedio general" "tail -n +2 datos/estudiantes.csv | awk -F',' '{sum+=\$6} END {print sum/NR}'"
run_test "Top 5 promedios" "tail -n +2 datos/estudiantes.csv | sort -t',' -k6 -rn | head -5"

# Proyecto 2: Análisis de Inventario y Ventas
print_subheader "Proyecto 2: Análisis de Inventario y Ventas"
run_test "Total productos" "tail -n +1 datos/productos.txt | wc -l"
run_test "Total ventas" "tail -n +2 datos/ventas.csv | awk -F',' '{sum+=\$5} END {print \"\$\"sum}'"
run_test "Producto más caro" "sort -t'|' -k3 -rn datos/productos.txt | head -1"
run_test "Stock crítico" "awk -F'|' '\$5 < 20 {print \$2, \"Stock:\", \$5}' datos/productos.txt"

# Proyecto 3: Dashboard de Logs
print_subheader "Proyecto 3: Dashboard de Logs Completo"
run_test "Errores server.log" "grep -c ERROR logs/server.log"
run_test "Errores error.log" "grep -c ERROR logs/error.log"
run_test "Peticiones access.log" "wc -l < logs/access.log"
run_test "Peticiones nginx" "wc -l < logs/nginx_access.log"
run_test "Mensajes debug" "wc -l < temp/debug.log"
run_test "IPs más activas" "awk '{print \$1}' logs/access.log | sort | uniq -c | sort -rn | head -3"

# Proyecto 4: Análisis de Configuraciones
print_subheader "Proyecto 4: Análisis de Configuraciones"
run_test "Hosts configurados" "cat config/hosts.txt"
run_test "Puertos en uso" "grep -h 'port=' config/*.conf | sort -u"
run_test "Config production" "grep -A 6 '\[production\]' config/database.conf"
run_test "Config Nginx workers" "grep 'worker' config/nginx.conf"
run_test "Logging settings" "grep -A 3 '\[Logging\]' config/settings.conf"

# Proyecto 5: Procesamiento de JSON
print_subheader "Proyecto 5: Procesamiento de JSON"
run_test "Nombres usuarios JSON" "grep '\"nombre\"' datos/usuarios.json | cut -d':' -f2 | tr -d '\",' | sed 's/^[[:space:]]*//'"
run_test "Usuarios activos" "grep '\"activo\": true' datos/usuarios.json | wc -l"
run_test "Usuarios inactivos" "grep '\"activo\": false' datos/usuarios.json | wc -l"
run_test "Emails JSON" "grep '\"email\"' datos/usuarios.json | cut -d':' -f2 | tr -d '\",' | sed 's/^[[:space:]]*//'"

# ============================================
# RESUMEN FINAL
# ============================================

print_header "📊 RESUMEN DE PRUEBAS"

echo ""
echo -e "${BLUE}Total de pruebas ejecutadas:${NC} $TOTAL_TESTS"
echo -e "${GREEN}Pruebas exitosas:${NC} $PASSED_TESTS"
echo -e "${RED}Pruebas fallidas:${NC} $FAILED_TESTS"
echo ""

# Calcular porcentaje
if [ $TOTAL_TESTS -gt 0 ]; then
    PERCENTAGE=$((PASSED_TESTS * 100 / TOTAL_TESTS))
    echo -e "${BLUE}Porcentaje de éxito:${NC} ${PERCENTAGE}%"
    echo ""
    
    if [ $PERCENTAGE -eq 100 ]; then
        echo -e "${GREEN}╔════════════════════════════════════════════╗${NC}"
        echo -e "${GREEN}║   ✓ TODAS LAS PRUEBAS PASARON CON ÉXITO   ║${NC}"
        echo -e "${GREEN}╚════════════════════════════════════════════╝${NC}"
    elif [ $PERCENTAGE -ge 80 ]; then
        echo -e "${YELLOW}╔════════════════════════════════════════════╗${NC}"
        echo -e "${YELLOW}║   ⚠ LA MAYORÍA DE PRUEBAS PASARON         ║${NC}"
        echo -e "${YELLOW}╚════════════════════════════════════════════╝${NC}"
    else
        echo -e "${RED}╔════════════════════════════════════════════╗${NC}"
        echo -e "${RED}║   ✗ VARIAS PRUEBAS FALLARON               ║${NC}"
        echo -e "${RED}╚════════════════════════════════════════════╝${NC}"
    fi
fi

echo ""
echo "Prueba completada: $(date)"
echo ""

# Limpiar archivos temporales
rm -f /tmp/errores_encontrados.txt /tmp/reporte_informatica.txt /tmp/ips_unicas.txt
rm -f /tmp/peticiones_exitosas.txt /tmp/archivos_combinados.txt /tmp/hosts_db.txt

# Exit con código apropiado
if [ $FAILED_TESTS -eq 0 ]; then
    exit 0
else
    exit 1
fi
