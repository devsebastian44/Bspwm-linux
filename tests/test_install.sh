#!/usr/bin/env bash
# tests/test_install.sh

echo "[*] Ejecutando pruebas unitarias secas de instalacion..."
# Aca va la logica real de BATS o pruebas con mocks.
if [ -f "scripts/install.sh" ]; then
    TARGET="scripts/install.sh"
elif [ -f "../scripts/install.sh" ]; then
    TARGET="../scripts/install.sh"
else
    echo "[-] No se encuentra el archivo install.sh"
    exit 1
fi

echo "[+] install.sh encontrado en $TARGET."
# Comprobar sintaxis sin ejecutar
bash -n "$TARGET"
if [ $? -eq 0 ]; then
    echo "[+] install.sh paso la verificacion de sintaxis bash."
    exit 0
else
    echo "[-] Error de sintaxis en install.sh"
    exit 1
fi
