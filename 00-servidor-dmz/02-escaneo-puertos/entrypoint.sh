#!/bin/sh
TARGET_HOST="servidor-web-dmz-mariano-molina.onrender.com"

echo "[+] Iniciando escaneo de puertos sobre: $TARGET_HOST"
for port in 80 443 8080 22 21 3306; do
    nc -zv -w 2 "$TARGET_HOST" "$port" 2>&1
done
