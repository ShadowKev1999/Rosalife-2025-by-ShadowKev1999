@echo off
chcp 65001 >nul
title Rosalife-2025 Gamemode Zusammenführen V2

echo.
echo ========================================
echo    Rosalife-2025 Gamemode Zusammenführen V2
echo ========================================
echo.

REM Überprüfen ob PHP verfügbar
php --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [FEHLER] PHP nicht gefunden!
    echo Bitte installieren Sie PHP von https://www.php.net/downloads.php
    pause
    exit /b 1
)

echo [INFO] PHP gefunden
echo.

REM Überprüfen ob Verzeichnisse existieren
if not exist "gamemodes" (
    echo [FEHLER] gamemodes\ Ordner nicht gefunden!
    pause
    exit /b 1
)

if not exist "gamemodes\core" (
    echo [FEHLER] gamemodes\core\ Ordner nicht gefunden!
    pause
    exit /b 1
)

echo [INFO] Verzeichnisse gefunden
echo.

REM Backup erstellen
echo [INFO] Erstelle Backup...
if exist "gamemodes\skg.pwn" (
    set timestamp=%date:~0,4%%date:~5,2%%date:~8,2%_%time:~0,2%%time:~3,2%
    copy "gamemodes\skg.pwn" "gamemodes\skg_backup_%timestamp%.pwn" >nul
    echo [INFO] Backup erstellt: skg_backup_%timestamp%.pwn
) else (
    echo [WARNUNG] skg.pwn nicht gefunden
)

echo [INFO] Starte Zusammenführung aller Ordner...
echo.

REM PHP-Skript ausführen
php create_single_gamemode_v2.php

if %errorlevel% equ 0 (
    echo.
    echo [ERFOLG] Zusammenführung erfolgreich abgeschlossen!
    
    REM Dateigröße überprüfen
    for %%F in ("gamemodes\skg_single.pwn") do (
        echo [INFO] Dateigröße: %%~zF Bytes
    )
    
    echo.
    echo ========================================
    echo    ZUSAMMENFASSUNG
    echo ========================================
    echo.
    echo [INFO] Alle Ordner wurden in skg_single.pwn zusammengeführt
    echo [INFO] Original-Dateien bleiben erhalten
    echo [INFO] Backup erstellt als: skg_backup_*.pwn
    echo [INFO] Statistik gespeichert in: merge_stats.txt
    echo.
    
    REM Nächste Schritte
    echo [NÄCHSTE SCHRITTE]
    echo 1. Kompilieren: qawno\qawno.exe gamemodes\skg_single.pwn
    echo 2. Testen: Server mit skg_single.amx starten
    echo 3. Bei Erfolg: skg_single.pwn als skg.pwn verwenden
    echo.
    
    set /p choice="Möchten Sie die zusammengeführte Datei als Haupt-Gamemode verwenden? (j/N): "
    
    if /i "!choice!"=="!j!" goto end
    
    echo [INFO] Sichere aktuelle skg.pwn...
    copy "gamemodes\skg.pwn" "gamemodes\skg_original.pwn" >nul
    
    echo [INFO] Ersetze skg.pwn mit zusammengeführter Version...
    copy "gamemodes\skg_single.pwn" "gamemodes\skg.pwn" >nul
    
    echo [ERFOLG] skg.pwn wurde ersetzt!
    echo [INFO] Original gesichert als skg_original.pwn
    
) else (
    echo.
    echo [FEHLER] Zusammenführung fehlgeschlagen!
    echo [FEHLER] Überprüfen Sie die PHP-Fehlermeldung oben
    echo [FEHLER] Stellen Sie sicher, dass alle Dateien lesbar sind
    echo.
)

:end
echo.
echo ========================================
echo    Vorgang abgeschlossen
echo ========================================
echo.
pause
