#!/bin/bash

# Script de backup simple
# Autor: Estudiante
# Fecha: 2025-10-08

BACKUP_DIR="/backup"
SOURCE_DIR="/home/user/documents"

echo "Iniciando backup..."
echo "Fecha: $(date)"

# Crear directorio de backup si no existe
mkdir -p $BACKUP_DIR

# Realizar backup
tar -czf $BACKUP_DIR/backup_$(date +%Y%m%d).tar.gz $SOURCE_DIR

echo "Backup completado"
