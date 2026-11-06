#!/bin/bash
TARGET_URL="https://servidor-web-dmz-mariano-molina.onrender.com"

echo "[+] Iniciando simulacion de auditoria de Exfiltracion de Datos contra: $TARGET_URL"
PATHS=("/etc/passwd" "/config/db.json" "/backup.zip" "/.env")

for path in "${PATHS[@]}"; do
    echo "[*] Simulando intento de acceso/exfiltracion en la ruta: $path"
    curl -s -o /dev/null -w "%{http_code}\n" "$TARGET_URL$path"
    sleep 1
done

echo "[+] Auditoria de exfiltracion de datos finalizada exitosamente."
tail -f /dev/null
