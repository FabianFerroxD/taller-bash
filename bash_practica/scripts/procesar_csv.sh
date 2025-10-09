#!/bin/bash

# Script para procesar archivos CSV
# Demuestra uso de cut, awk, sort

CSV_FILE="../documentos/contactos.csv"

echo "=== PROCESAMIENTO DE CSV ==="
echo ""

echo "1. Mostrar solo nombres (columna 1):"
tail -n +2 $CSV_FILE | cut -d',' -f1
echo ""

echo "2. Mostrar emails (columna 2):"
tail -n +2 $CSV_FILE | cut -d',' -f2
echo ""

echo "3. Contactos ordenados por ciudad:"
tail -n +2 $CSV_FILE | sort -t',' -k4
echo ""

echo "4. Contar contactos por ciudad:"
tail -n +2 $CSV_FILE | cut -d',' -f4 | sort | uniq -c
echo ""

echo "5. Buscar contactos de Buenos Aires:"
grep "Buenos Aires" $CSV_FILE
