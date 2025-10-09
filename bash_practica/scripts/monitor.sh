#!/bin/bash

# Script de monitoreo del sistema mejorado
# Muestra información detallada del sistema
# Uso: ./monitor.sh [opciones]
#   -f : Guardar reporte en archivo
#   -v : Modo verbose

VERBOSE=false
SAVE_TO_FILE=false
OUTPUT_FILE="system_report_$(date +%Y%m%d_%H%M%S).txt"

# Procesar argumentos
while getopts "fv" opt; do
    case $opt in
        f) SAVE_TO_FILE=true ;;
        v) VERBOSE=true ;;
        *) echo "Uso: $0 [-f] [-v]" && exit 1 ;;
    esac
done

# Función para imprimir y guardar
print_info() {
    if [ "$SAVE_TO_FILE" = true ]; then
        echo "$1" | tee -a "$OUTPUT_FILE"
    else
        echo "$1"
    fi
}

# Inicio del reporte
print_info "╔════════════════════════════════════════════════════════╗"
print_info "║        REPORTE DE MONITOREO DEL SISTEMA               ║"
print_info "╚════════════════════════════════════════════════════════╝"
print_info ""

print_info "=== INFORMACIÓN BÁSICA ==="
print_info "Fecha y hora: $(date '+%Y-%m-%d %H:%M:%S')"
print_info "Usuario actual: $(whoami)"
print_info "Directorio actual: $(pwd)"
print_info "Sistema operativo: $(uname -s)"
print_info ""

print_info "=== USO DE DISCO ==="
df -h | head -5 | while read line; do print_info "$line"; done
print_info ""

print_info "=== PROCESOS ACTIVOS (Top 10) ==="
ps aux --sort=-%mem | head -11 | while read line; do print_info "$line"; done
print_info ""

if [ "$VERBOSE" = true ]; then
    print_info "=== VARIABLES DE ENTORNO ==="
    env | head -10 | while read line; do print_info "$line"; done
    print_info ""
fi

print_info "=== RESUMEN ==="
print_info "Total de procesos: $(ps aux | wc -l)"
print_info "Archivos en directorio actual: $(ls -1 | wc -l)"
print_info ""

if [ "$SAVE_TO_FILE" = true ]; then
    print_info "✓ Reporte guardado en: $OUTPUT_FILE"
fi
