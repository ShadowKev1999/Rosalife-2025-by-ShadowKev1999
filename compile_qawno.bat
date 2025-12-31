@echo off
chcp 65001 >nul
title Rosalife-2025 Qawno Compiler

echo.
echo ========================================
echo    Rosalife-2025 Qawno Compiler
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

REM Compiler-Einstellungen optimieren
set COMPILER_FLAGS=
set COMPILER_FLAGS=%COMPILER_FLAGS% -r
set COMPILER_FLAGS=%COMPILER_FLAGS% -O2
set COMPILER_FLAGS=%COMPILER_FLAGS% -Z
set COMPILER_FLAGS=%COMPILER_FLAGS% -v0

echo [INFO] Starte optimierten Qawno Compiler...
echo.

REM Temporäres Verzeichnis für kompilierte Dateien
if not exist "compiled" mkdir compiled

REM Gamemode kompilieren mit erhöhtem Timeout
echo [INFO] Kompiliere gamemodes\skg.pwn...
echo.

qawno\qawno.exe -t300 -r gamemodes\skg.pwn

if %errorlevel% equ 0 (
    echo.
    echo [ERFOLG] Gamemode erfolgreich kompiliert!
    
    REM Verschiebe kompilierte Datei
    if exist "gamemodes\skg.amx" (
        move "gamemodes\skg.amx" "gamemodes\compiled\skg.amx" >nul
        echo [INFO] skg.amx nach compiled\ verschoben
    )
    
    echo.
    echo [INFO] Gamemode ist bereit: gamemodes\compiled\skg.amx
) else (
    echo.
    echo [FEHLER] Kompilierung fehlgeschlagen!
    echo.
    echo [TIPPS] 
    echo 1. Überprüfen Sie die Fehlermeldung oben
    echo 2. Kommentieren Sie einige Includes aus
    echo 3. Verwenden Sie die minimale Version
    echo.
)

echo.
echo ========================================
echo    Zusätzliche Optionen
echo ========================================
echo.
echo [1] Minimale Version kompilieren
echo [2] Includes überprüfen
echo [3] Cache leeren
echo [4] Beenden
echo.

set /p choice="Wählen Sie eine Option (1-4): "

if "%choice%"=="1" goto minimal_compile
if "%choice%"=="2" goto check_includes
if "%choice%"=="3" goto clear_cache
if "%choice%"=="4" goto end

:minimal_compile
echo.
echo [INFO] Erstelle minimale Gamemode-Version...
echo.

REM Erstelle minimale Version
copy "gamemodes\skg.pwn" "gamemodes\skg_minimal.pwn" >nul

REM Ersetze Includes mit minimaler Version
echo. > "gamemodes\skg_minimal.pwn"
echo #define SAMP_COMPAT >> "gamemodes\skg_minimal.pwn"
echo #include ^<open.mp^> >> "gamemodes\skg_minimal.pwn"
echo #include ^<a_mysql^> >> "gamemodes\skg_minimal.pwn"
echo #include ^<Pawn.CMD^> >> "gamemodes\skg_minimal.pwn"
echo #include ^<sscanf2^> >> "gamemodes\skg_minimal.pwn"
echo #include ^<streamer^> >> "gamemodes\skg_minimal.pwn"
echo. >> "gamemodes\skg_minimal.pwn"
echo // Minimale Gamemode-Version >> "gamemodes\skg_minimal.pwn"
echo #include "core/database_simple.pwn" >> "gamemodes\skg_minimal.pwn"
echo. >> "gamemodes\skg_minimal.pwn"
echo main() { print("Minimale Gamemode geladen"); } >> "gamemodes\skg_minimal.pwn"
echo. >> "gamemodes\skg_minimal.pwn"
echo public OnGameModeInit() { DatabaseSimple_Initialize(); return 1; } >> "gamemodes\skg_minimal.pwn"
echo public OnPlayerConnect(playerid) { return 1; } >> "gamemodes\skg_minimal.pwn"

echo [INFO] Kompiliere minimale Version...
qawno\qawno.exe gamemodes\skg_minimal.pwn

if %errorlevel% equ 0 (
    echo [ERFOLG] Minimale Version kompiliert!
) else (
    echo [FEHLER] Minimale Version fehlgeschlagen!
)

goto end

:check_includes
echo.
echo [INFO] Überprüfe Includes...
echo.

REM Zähle Includes
find /c "#include" "gamemodes\skg.pwn" > temp_count.txt
set /p include_count=<temp_count.txt
del temp_count.txt

echo [INFO] Gefunden: %include_count% Includes

if %include_count% gtr 50 (
    echo [WARNUNG] Zu viele Includes! (%include_count% ^> 50)
    echo.
    echo [LÖSUNG] Kommentieren Sie einige Includes aus:
    echo.
    echo // Deaktivieren Sie nicht benötigte Systeme:
    echo //#include "vars/jobs/mining.pwn"
    echo //#include "vars/jobs/lumberjack.pwn"
    echo //#include "cmds/jobs/mining.pwn"
    echo //#include "cmds/jobs/lumberjack.pwn"
    echo.
    echo // Oder verwenden Sie die minimale Version
)

goto end

:clear_cache
echo.
echo [INFO] Leere Compiler-Cache...
echo.

REM Lösche temporäre Dateien
if exist "*.p~" del "*.p~"
if exist "*.bak" del "*.bak"
if exist "gamemodes\*.amx" del "gamemodes\*.amx"
if exist "compiled\*.*" del "compiled\*.*"

echo [INFO] Cache geleert
goto end

:end
echo.
echo [INFO] Qawno Compiler abgeschlossen
pause
