#!/bin/bash

# Script para buscar archivos con diferentes criterios
# Ejemplos de uso de find

echo "=== BÚSQUEDA DE ARCHIVOS ==="
echo ""

echo "1. Archivos .txt en el proyecto:"
find .. -name "*.txt" -type f
echo ""

echo "2. Archivos modificados en las últimas 24 horas:"
find .. -type f -mtime -1
echo ""

echo "3. Archivos mayores a 1KB:"
find .. -type f -size +1k -exec ls -lh {} \; | awk '{print $9, $5}'
echo ""

echo "4. Directorios en el proyecto:"
find .. -type d -maxdepth 2
echo ""

echo "5. Archivos de log:"
find .. -name "*.log" -type f
