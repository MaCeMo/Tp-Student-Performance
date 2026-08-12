#!/bin/bash

# Descarga, descompresión y limpieza inicial

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

# 3. Limpieza: eliminar filas vacías y corregir separador
echo "Limpiando dataset..."
sed '/^[;]*$/d' dataset_raw.csv | tr ';' ',' > dataset.csv

# 4. Verificar resultado
if [ ! -f dataset.csv ]; then
    echo "ERROR: No se pudo generar dataset.csv"
    exit 1
fi

FILAS=$(wc -l < dataset.csv)
echo "Dataset listo: dataset.csv ($FILAS filas)"

# 5. Eliminar archivo temporal
rm dataset_raw.csv

echo "=== Proceso finalizado. Archivo listo para importar en R ==="
