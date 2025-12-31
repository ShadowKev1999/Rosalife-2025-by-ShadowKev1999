@echo off
chcp 65001 >nul
title README.md Ersetzen

echo.
echo ========================================
echo    README.md Ersetzen
echo ========================================
echo.

echo [INFO] Sichere alte README.md...
if exist "README.md" (
    copy "README.md" "README_ALT.md" >nul
    echo [ERFOLG] Alte README.md als README_ALT.md gesichert
) else (
    echo [WARNUNG] README.md nicht gefunden
)

echo.
echo [INFO] Ersetze README.md mit neuer Version...
if exist "README_NEU.md" (
    copy "README_NEU.md" "README.md" >nul
    echo [ERFOLG] README.md wurde ersetzt
) else (
    echo [FEHLER] README_NEU.md nicht gefunden!
    pause
    exit /b 1
)

echo.
echo [INFO] Überprüfe Ergebnis...
if exist "README.md" (
    echo [ERFOLG] Neue README.md ist vorhanden
) else (
    echo [FEHLER] README.md wurde nicht erstellt!
)

if exist "README_ALT.md" (
    echo [INFO] Alte Version als README_ALT.md gesichert
)

echo.
echo ========================================
echo    Vorgang abgeschlossen
echo ========================================
echo.
echo Die neue README.md enthält:
echo - Alle Befehle und Funktionen
echo - Datenbank-Setup Anleitungen  
echo - Compiler-Anleitungen (Qawno/Pawno)
echo - Installationsanleitung
echo.
pause
