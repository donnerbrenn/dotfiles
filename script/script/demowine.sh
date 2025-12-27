#!/bin/bash

# Pfad für den neuen Prefix (kannst du ändern)
PREFIX_DIR="$HOME/.wine_demoscene"

# Check ob winetricks installiert ist
if ! command -v winetricks &> /dev/null; then
    echo "Fehler: 'winetricks' wurde nicht gefunden. Bitte installiere es zuerst."
    exit 1
fi

echo "--- Starte Setup für Demoscene Environment ---"
echo "Prefix Pfad: $PREFIX_DIR"

# 1. Prefix erstellen und initialisieren (32-Bit erzwingen!)
# Das unterdrückt GUI-Popups beim Boot
echo "[1/3] Erstelle 32-Bit Wine Prefix..."
WINEPREFIX="$PREFIX_DIR" WINEARCH=win32 wineboot -u

# 2. DXVK und DirectX DLLs installieren
# -q = quiet (weniger klicken)
echo "[2/3] Installiere DXVK und DirectX Libraries (das kann kurz dauern)..."
WINEPREFIX="$PREFIX_DIR" winetricks -q dxvk d3dx9 d3dcompiler_43 d3dcompiler_47

# 3. Optional: Einstellungen für Performance (CSMT an)
echo "[3/3] Setze Performance-Tweaks..."
WINEPREFIX="$PREFIX_DIR" winetricks -qcsmt=on

echo "---------------------------------------------------"
echo "Fertig! Der Prefix ist bereit."
echo ""
echo "Zum Starten deiner Demo (mit Gamescope) nutze:"
echo "WINEPREFIX=$PREFIX_DIR gamescope -w 1920 -h 1080 -W 2560 -H 1440 -U -f -- wine elevated_1920_1080.exe"
