#!/bin/sh
echo "[+] Iniciando Servidor DMZ de Auditoria..."

cat <<EOF > /usr/share/nginx/html/index.html
<!DOCTYPE html>
<html>
<head><title>DMZ Lab</title></head>
<body style="font-family: Arial; text-align: center; margin-top: 50px;">
    <h1>Servidor DMZ Activo - Laboratorio de Mariano Molina</h1>
    <p>Estado del sistema: En monitoreo de seguridad</p>
</body>
</html>
EOF

exec nginx -g 'daemon off;'
