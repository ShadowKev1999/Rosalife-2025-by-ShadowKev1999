@echo off
chcp 65001 >nul
title Anti-Cheat Qawno Compiler

echo.
echo ========================================
echo    Anti-Cheat Qawno Compiler
echo ========================================
echo.

REM Überprüfen ob qawno existiert
if not exist "qawno\qawno.exe" (
    echo [FEHLER] qawno.exe nicht gefunden!
    echo Bitte stellen Sie sicher, dass sich qawno.exe im qawno\ Ordner befindet.
    pause
    exit /b 1
)

echo [INFO] Qawno gefunden
echo.

REM Anti-Cheat System kompilieren
echo [INFO] Kompiliere Anti-Cheat System...
echo.

REM Temporäres Verzeichnis für kompilierte Dateien
if not exist "compiled" mkdir compiled

REM Anti-Cheat System kompilieren mit erhöhtem Timeout und Optimierung
qawno\qawno.exe -t600 -r -O2 -Z gamemodes\core\server\anticheat_system.pwn

if %errorlevel% equ 0 (
    echo.
    echo [ERFOLG] Anti-Cheat System erfolgreich kompiliert!
    
    REM Verschiebe kompilierte Datei
    if exist "gamemodes\core\server\anticheat_system.amx" (
        move "gamemodes\core\server\anticheat_system.amx" "gamemodes\compiled\anticheat_system.amx" >nul
        echo [INFO] anticheat_system.amx nach compiled\ verschoben
    )
    
    echo.
    echo [INFO] Anti-Cheat System ist bereit: gamemodes\compiled\anticheat_system.amx
) else (
    echo.
    echo [FEHLER] Kompilierung fehlgeschlagen!
    echo.
    echo [TIPPS] 
    echo 1. Überprüfen Sie die Fehlermeldung oben
    echo 2. Datei ist möglicherweise zu groß für Qawno
    echo 3. Versuchen Sie Pawno Compiler als Alternative
    echo.
)

echo.
echo ========================================
echo    Zusätzliche Optionen
echo ========================================
echo.
echo [1] Mit Pawno kompilieren
echo [2] Minimale Version erstellen
echo [3] In Haupt-Gamemode integrieren
echo [4] Beenden
echo.

set /p choice="Wählen Sie eine Option (1-4): "

if "%choice%"=="1" goto compile_with_pawno
if "%choice%"=="2" goto create_minimal
if "%choice%"=="3" goto integrate_main
if "%choice%"=="4" goto end

:compile_with_pawno
echo.
echo [INFO] Kompiliere mit Pawno Compiler...
pawno\pawno.exe -t600 -r gamemodes\core\server\anticheat_system.pwn

if %errorlevel% equ 0 (
    echo [ERFOLG] Mit Pawno kompiliert!
    if exist "gamemodes\core\server\anticheat_system.amx" (
        move "gamemodes\core\server\anticheat_system.amx" "gamemodes\compiled\anticheat_system_pawno.amx" >nul
    )
) else (
    echo [FEHLER] Pawno Kompilierung fehlgeschlagen!
)
goto end

:create_minimal
echo.
echo [INFO] Erstelle minimale Anti-Cheat Version...
echo.

REM Minimale Version erstellen
echo #define SAMP_COMPAT > "gamemodes\core\server\anticheat_minimal.pwn"
echo #include ^<open.mp^> >> "gamemodes\core\server\anticheat_minimal.pwn"
echo #include ^<a_mysql^> >> "gamemodes\core\server\anticheat_minimal.pwn"
echo. >> "gamemodes\core\server\anticheat_minimal.pwn"
echo // Minimale Anti-Cheat Version >> "gamemodes\core\server\anticheat_minimal.pwn"
echo new PlayerLastPos[MAX_PLAYERS][3]; >> "gamemodes\core\server\anticheat_minimal.pwn"
echo new PlayerLastHealth[MAX_PLAYERS]; >> "gamemodes\core\server\anticheat_minimal.pwn"
echo new PlayerLastMoney[MAX_PLAYERS]; >> "gamemodes\core\server\anticheat_minimal.pwn"
echo. >> "gamemodes\core\server\anticheat_minimal.pwn"
echo stock AntiCheat_Initialize() { print("[ANTI-CHEAT] Minimal System aktiv"); } >> "gamemodes\core\server\anticheat_minimal.pwn"
echo stock AntiCheat_PlayerConnect(playerid) { ResetAntiCheatVars(playerid); } >> "gamemodes\core\server\anticheat_minimal.pwn"
echo stock AntiCheat_PlayerDisconnect(playerid) { ResetAntiCheatVars(playerid); } >> "gamemodes\core\server\anticheat_minimal.pwn"
echo stock AntiCheat_PlayerUpdate(playerid) { return 1; } >> "gamemodes\core\server\anticheat_minimal.pwn"
echo stock ResetAntiCheatVars(playerid) { return 1; } >> "gamemodes\core\server\anticheat_minimal.pwn"
echo. >> "gamemodes\core\server\anticheat_minimal.pwn"

echo [INFO] Kompiliere minimale Version...
qawno\qawno.exe gamemodes\core\server\anticheat_minimal.pwn

if %errorlevel% equ 0 (
    echo [ERFOLG] Minimale Version kompiliert!
) else (
    echo [FEHLER] Minimale Version fehlgeschlagen!
)
goto end

:integrate_main
echo.
echo [INFO] Integriere Anti-Cheat in Haupt-Gamemode...
echo.

REM Prüfen ob skg.pwn existiert
if not exist "gamemodes\skg.pwn" (
    echo [FEHLER] skg.pwn nicht gefunden!
    goto end
)

REM Anti-Cheat Include hinzufügen
echo [INFO] Füge Anti-Cheat Include zu skg.pwn hinzu...
findstr /C:"#include \"core/server/config.pwn\"" "gamemodes\skg.pwn" >nul
if %errorlevel% equ 0 (
    REM Include nach der Config einfügen
    powershell -Command "(Get-Content 'gamemodes\skg.pwn') -replace '#include \"core/server/config.pwn\"', '#include \"core/server/config.pwn\"\n#include \"core/server/anticheat_system.pwn\"' | Set-Content 'gamemodes\skg.pwn'"
    echo [ERFOLG] Anti-Cheat Include hinzugefügt!
) else (
    echo [WARNUNG] Konnte Include nicht automatisch hinzufügen!
    echo [INFO] Bitte fügen Sie manuell hinzu: #include \"core/server/anticheat_system.pwn\"
)

echo [INFO] Initialisierungs-Aufruf hinzufügen...
findstr /C:"public OnGameModeInit()" "gamemodes\skg.pwn" >nul
if %errorlevel% equ 0 (
    REM AntiCheat Initialisierung nach OnGameModeInit hinzufügen
    powershell -Command "(Get-Content 'gamemodes\skg.pwn') -replace 'public OnGameModeInit()', 'public OnGameModeInit()\n{\n    AntiCheat_Initialize();' | Set-Content 'gamemodes\skg.pwn'"
    echo [ERFOLG] Anti-Cheat Initialisierung hinzugefügt!
) else (
    echo [WARNUNG] Konnte Initialisierung nicht automatisch hinzufügen!
    echo [INFO] Bitte fügen Sie manuell hinzu: AntiCheat_Initialize(); in OnGameModeInit()
)

echo [INFO] Player-Connect Callback hinzufügen...
findstr /C:"public OnPlayerConnect(playerid)" "gamemodes\skg.pwn" >nul
if %errorlevel% equ 0 (
    REM AntiCheat PlayerConnect hinzufügen
    powershell -Command "(Get-Content 'gamemodes\skg.pwn') -replace 'public OnPlayerConnect(playerid)', 'public OnPlayerConnect(playerid)\n{\n    AntiCheat_PlayerConnect(playerid);' | Set-Content 'gamemodes\skg.pwn'"
    echo [ERFOLG] Anti-Cheat PlayerConnect hinzugefügt!
) else (
    echo [WARNUNG] Konnte PlayerConnect nicht automatisch hinzufügen!
    echo [INFO] Bitte fügen Sie manuell hinzu: AntiCheat_PlayerConnect(playerid); in OnPlayerConnect
)

echo [INFO] Player-Disconnect Callback hinzufügen...
findstr /C:"public OnPlayerDisconnect(playerid, reason)" "gamemodes\skg.pwn" >nul
if %errorlevel% equ 0 (
    REM Anti-Cheat PlayerDisconnect hinzufügen
    powershell -Command "(Get-Content 'gamemodes\skg.pwn') -replace 'public OnPlayerDisconnect(playerid, reason)', 'public OnPlayerDisconnect(playerid, reason)\n{\n    AntiCheat_PlayerDisconnect(playerid);' | Set-Content 'gamemodes\skg.pwn'"
    echo [ERFOLG] Anti-Cheat PlayerDisconnect hinzugefügt!
) else (
    echo [WARNUNG] Konnte PlayerDisconnect nicht automatisch hinzufügen!
    echo [INFO] Bitte fügen Sie manuell hinzu: AntiCheat_PlayerDisconnect(playerid); in OnPlayerDisconnect
)

goto end

:end
echo.
echo ========================================
echo    Vorgang abgeschlossen
echo ========================================
echo.
echo [INFO] Anti-Cheat System wurde vorbereitet
echo [INFO] Bei Problemen: Verwenden Sie Pawno Compiler
echo [INFO] Bei Erfolg: System ist in skg.pwn integriert
echo.
pause
