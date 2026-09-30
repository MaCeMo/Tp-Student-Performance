#!/bin/bash

# descarga.sh
# Descarga y limpieza del dataset de rendimiento estudiantil

# 1. Descargar el dataset
echo "Descargando dataset..."
curl -L -o dataset_raw.csv "https://drive.google.com/uc?export=download&id=1zj_BZsUYwkRKFFX4o69GE2pf0XKFpdYu"

# 2. Verificar que se descargó bien
ls -la dataset_raw.csv
head -5 dataset_raw.csv
wc -l dataset_raw.csv

# 3. Cambiar separador de ; a , para que R lo lea bien
tr ';' ',' < dataset_raw.csv > dataset.csv

# 4. Eliminar archivo temporal
rm dataset_raw.csv

echo "Listo! dataset.csv disponible para importar en R"
