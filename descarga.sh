#!/bin/bash
# Script de descarga, descompresión y limpieza

echo "=== Iniciando descarga del dataset ==="

# 1. Descargar el archivo desde Google Drive
FILE_ID="1zj_BZsUYwkRKFFX4o69GE2pf0XKFpdYu"
URL="https://drive.google.com/uc?export=download&id=${FILE_ID}"

echo "Descargando dataset..."
curl -L -o dataset_raw.csv "$URL"

# 2. Verificar que la descarga fue exitosa
if [ ! -f dataset_raw.csv ]; then
    echo "ERROR: No se pudo descargar el archivo."
    exit 1
fi

echo "Descarga exitosa."

# 3. Limpieza inicial: eliminar filas completamente vacías
echo "Limpiando dataset..."
sed '/^[;]*$/d' dataset_raw.csv > dataset.csv

# 4. Verificar que el archivo final existe y tiene contenido
FILAS=$(wc -l < dataset.csv)
echo "Dataset listo: dataset.csv ($FILAS filas)"

# 5. Eliminar archivo temporal
rm dataset_raw.csv

echo "=== Proceso finalizado. Archivo listo: dataset.csv ==="
