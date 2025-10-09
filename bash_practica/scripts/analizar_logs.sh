#!/bin/bash

# Script para analizar archivos de log
# Extrae estadísticas útiles de logs del servidor

LOG_FILE="../logs/server.log"

if [ ! -f "$LOG_FILE" ]; then
    echo "Error: No se encuentra el archivo $LOG_FILE"
    exit 1
fi

echo "╔════════════════════════════════════════════════════════╗"
echo "║           ANÁLISIS DE LOGS DEL SERVIDOR               ║"
echo "╚════════════════════════════════════════════════════════╝"
echo ""

echo "=== RESUMEN GENERAL ==="
echo "Total de líneas: $(wc -l < $LOG_FILE)"
echo "Errores encontrados: $(grep -c ERROR $LOG_FILE)"
echo "Advertencias encontradas: $(grep -c WARNING $LOG_FILE)"
echo "Mensajes informativos: $(grep -c INFO $LOG_FILE)"
echo ""

echo "=== ERRORES DETALLADOS ==="
grep ERROR $LOG_FILE | head -5
echo ""

echo "=== ADVERTENCIAS DETALLADAS ==="
grep WARNING $LOG_FILE | head -5
echo ""

echo "=== ACTIVIDAD POR HORA ==="
awk '{print $2}' $LOG_FILE | cut -d':' -f1 | sort | uniq -c | sort -rn
echo ""

echo "=== ÚLTIMAS 5 ENTRADAS ==="
tail -5 $LOG_FILE
