@echo off
chcp 65001 >nul
title Rosalife-2025 Gamemode Zusammenführen

echo.
echo ========================================
echo    Rosalife-2025 Gamemode Zusammenführen
echo ========================================
echo.

REM Überprüfen ob Quell-Ordner existieren
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

echo [INFO] Quell-Ordner gefunden
echo.

REM Backup erstellen
echo [INFO] Erstelle Backup...
if exist "gamemodes\skg.pwn" copy "gamemodes\skg.pwn" "gamemodes\skg_backup_%date:~0,4%%date:~5,2%%date:~8,2%_%time:~0,2%%time:~3,2%.pwn" >nul
echo [INFO] Backup erstellt

REM Zieldatei erstellen
echo [INFO] Erstelle zusammengeführte Gamemode...
echo.

REM Header schreiben
echo // Rosalife-2025 - Zusammengeführte Gamemode > "gamemodes\skg_merged.pwn"
echo // Automatisch erstellt am %date% %time% >> "gamemodes\skg_merged.pwn"
echo // Alle Includes und Dateien in einer Datei >> "gamemodes\skg_merged.pwn"
echo. >> "gamemodes\skg_merged.pwn"

REM Haupt-Datei zuerst einlesen
echo [INFO] Lese Haupt-Gamemode...
type "gamemodes\skg.pwn" >> "gamemodes\skg_merged.pwn"
echo. >> "gamemodes\skg_merged.pwn"

REM Core-Dateien zusammenführen
echo [INFO] Füge Core-Dateien hinzu...

REM Utils
for %%f in (gamemodes\core\utils\*.pwn) do (
    echo [INFO] Füge hinzu: core\utils\%%f
    echo. >> "gamemodes\skg_merged.pwn"
    echo // ======================================== >> "gamemodes\skg_merged.pwn"
    echo // Datei: core\utils\%%f >> "gamemodes\skg_merged.pwn"
    echo // ======================================== >> "gamemodes\skg_merged.pwn"
    type "gamemodes\core\utils\%%f" >> "gamemodes\skg_merged.pwn"
    echo. >> "gamemodes\skg_merged.pwn"
)

REM Server
for %%f in (gamemodes\core\server\*.pwn) do (
    echo [INFO] Füge hinzu: core\server\%%f
    echo. >> "gamemodes\skg_merged.pwn"
    echo // ======================================== >> "gamemodes\skg_merged.pwn"
    echo // Datei: core\server\%%f >> "gamemodes\skg_merged.pwn"
    echo // ======================================== >> "gamemodes\skg_merged.pwn"
    type "gamemodes\core\server\%%f" >> "gamemodes\skg_merged.pwn"
    echo. >> "gamemodes\skg_merged.pwn"
)

REM Admin
for %%f in (gamemodes\core\admin\*.pwn) do (
    echo [INFO] Füge hinzu: core\admin\%%f
    echo. >> "gamemodes\skg_merged.pwn"
    echo // ======================================== >> "gamemodes\skg_merged.pwn"
    echo // Datei: core\admin\%%f >> "gamemodes\skg_merged.pwn"
    echo // ======================================== >> "gamemodes\skg_merged.pwn"
    type "gamemodes\core\admin\%%f" >> "gamemodes\skg_merged.pwn"
    echo. >> "gamemodes\skg_merged.pwn"
)

REM UI
for %%f in (gamemodes\core\ui\*.pwn) do (
    echo [INFO] Füge hinzu: core\ui\%%f
    echo. >> "gamemodes\skg_merged.pwn"
    echo // ======================================== >> "gamemodes\skg_merged.pwn"
    echo // Datei: core\ui\%%f >> "gamemodes\skg_merged.pwn"
    echo // ======================================== >> "gamemodes\skg_merged.pwn"
    type "gamemodes\core\ui\%%f" >> "gamemodes\skg_merged.pwn"
    echo. >> "gamemodes\skg_merged.pwn"
)

REM Item
for %%f in (gamemodes\core\item\*.pwn) do (
    echo [INFO] Füge hinzu: core\item\%%f
    echo. >> "gamemodes\skg_merged.pwn"
    echo // ======================================== >> "gamemodes\skg_merged.pwn"
    echo // Datei: core\item\%%f >> "gamemodes\skg_merged.pwn"
    echo // ======================================== >> "gamemodes\skg_merged.pwn"
    type "gamemodes\core\item\%%f" >> "gamemodes\skg_merged.pwn"
    echo. >> "gamemodes\skg_merged.pwn"
)

echo [INFO] Füge Vars-Dateien hinzu...

REM Vars
for %%d in (vars\*) do (
    if exist "gamemodes\%%d\*.pwn" (
        echo [INFO] Füge hinzu: %%d
        for %%f in (gamemodes\%%d\*.pwn) do (
            echo. >> "gamemodes\skg_merged.pwn"
            echo // ======================================== >> "gamemodes\skg_merged.pwn"
            echo // Datei: %%d\%%f >> "gamemodes\skg_merged.pwn"
            echo // ======================================== >> "gamemodes\skg_merged.pwn"
            type "gamemodes\%%d\%%f" >> "gamemodes\skg_merged.pwn"
            echo. >> "gamemodes\skg_merged.pwn"
        )
    )
)

echo [INFO] Füge Cmds-Dateien hinzu...

REM Commands
for %%d in (cmds\*) do (
    if exist "gamemodes\%%d\*.pwn" (
        echo [INFO] Füge hinzu: %%d
        for %%f in (gamemodes\%%d\*.pwn) do (
            echo. >> "gamemodes\skg_merged.pwn"
            echo // ======================================== >> "gamemodes\skg_merged.pwn"
            echo // Datei: %%d\%%f >> "gamemodes\skg_merged.pwn"
            echo // ======================================== >> "gamemodes\skg_merged.pwn"
            type "gamemodes\%%d\%%f" >> "gamemodes\skg_merged.pwn"
            echo. >> "gamemodes\skg_merged.pwn"
        )
    )
)

echo [INFO] Füge Mappings hinzu...

REM Mappings
for %%f in (gamemodes\mappings\*.pwn) do (
    echo [INFO] Füge hinzu: mappings\%%f
    echo. >> "gamemodes\skg_merged.pwn"
    echo // ======================================== >> "gamemodes\skg_merged.pwn"
    echo // Datei: mappings\%%f >> "gamemodes\skg_merged.pwn"
    echo // ======================================== >> "gamemodes\skg_merged.pwn"
    type "gamemodes\mappings\%%f" >> "gamemodes\skg_merged.pwn"
    echo. >> "gamemodes\skg_merged.pwn"
)

echo [INFO] Füge Pending hinzu...

REM Pending
for %%f in (gamemodes\pending\*.pwn) do (
    echo [INFO] Füge hinzu: pending\%%f
    echo. >> "gamemodes\skg_merged.pwn"
    echo // ======================================== >> "gamemodes\skg_merged.pwn"
    echo // Datei: pending\%%f >> "gamemodes\skg_merged.pwn"
    echo // ======================================== >> "gamemodes\skg_merged.pwn"
    type "gamemodes\pending\%%f" >> "gamemodes\skg_merged.pwn"
    echo. >> "gamemodes\skg_merged.pwn"
)

REM Abschluss
echo. >> "gamemodes\skg_merged.pwn"
echo // ======================================== >> "gamemodes\skg_merged.pwn"
echo // Zusammenführung abgeschlossen >> "gamemodes\skg_merged.pwn"
echo // Erstellt am %date% %time% >> "gamemodes\skg_merged.pwn"
echo // ======================================== >> "gamemodes\skg_merged.pwn"

echo.
echo [INFO] Zusammenführung abgeschlossen
echo.

REM Dateigröße überprüfen
for %%F in ("gamemodes\skg_merged.pwn") do echo [INFO] Dateigröße: %%~zF Bytes

echo.
echo ========================================
echo    Zusammenfassung
echo ========================================
echo.
echo [ERFOLG] Gamemode zusammengeführt als: skg_merged.pwn
echo [INFO] Original-Dateien bleiben erhalten
echo [INFO] Backup erstellt als: skg_backup_*.pwn
echo.
echo [NÄCHSTE SCHRITTE]
echo 1. Kompilieren: qawno\qawno.exe gamemodes\skg_merged.pwn
echo 2. Testen: Server mit skg_merged.amx starten
echo 3. Bei Erfolg: skg_merged.pwn als skg.pwn verwenden
echo.

set /p choice="Möchten Sie die zusammengeführte Datei als Haupt-Gamemode verwenden? (j/N): "

if /i "%choice%"=="j" (
    echo.
    echo [INFO] Sichere aktuelle skg.pwn...
    copy "gamemodes\skg.pwn" "gamemodes\skg_original.pwn" >nul
    
    echo [INFO] Ersetze skg.pwn mit zusammengeführter Version...
    copy "gamemodes\skg_merged.pwn" "gamemodes\skg.pwn" >nul
    
    echo [ERFOLG] skg.pwn wurde ersetzt!
    echo [INFO] Original gesichert als skg_original.pwn
)

echo.
echo [INFO] Vorgang abgeschlossen
pause
