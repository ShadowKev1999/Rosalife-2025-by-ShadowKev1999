@echo off
chcp 65001 >nul
title Rosalife-2025 Database Setup

echo.
echo ========================================
echo    Rosalife-2025 Database Setup
echo ========================================
echo.

REM Überprüfen ob PHP installiert ist
php --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [FEHLER] PHP ist nicht installiert oder nicht im PATH gefunden!
    echo.
    echo Bitte installieren Sie PHP von https://www.php.net/downloads.php
    echo und stellen Sie sicher, dass PHP im System-PATH ist.
    echo.
    pause
    exit /b 1
)

echo [INFO] PHP gefunden
echo.

REM Überprüfen ob MySQL-Verbindung möglich ist
echo [INFO] Teste MySQL-Verbindung...
php -r "
try {
    \$config = include 'database_config.php';
    \$conn = new mysqli(\$config['database']['host'], \$config['database']['username'], \$config['database']['password']);
    if (\$conn->connect_error) {
        throw new Exception(\$conn->connect_error);
    }
    echo '[OK] MySQL-Verbindung erfolgreich' . PHP_EOL;
    \$conn->close();
} catch (Exception \$e) {
    echo '[FEHLER] ' . \$e->getMessage() . PHP_EOL;
    exit(1);
}
" 2>nul

if %errorlevel% neq 0 (
    echo.
    echo [FEHLER] Konnte keine Verbindung zur MySQL-Datenbank herstellen!
    echo.
    echo Bitte überprüfen Sie Ihre MySQL-Zugangsdaten in der database_config.php
    echo und stellen Sie sicher, dass der MySQL-Server läuft.
    echo.
    pause
    exit /b 1
)

echo.
echo [INFO] Starte Datenbank-Setup...
echo.

REM PHP-Skript ausführen
php database_setup.php

if %errorlevel% neq 0 (
    echo.
    echo [FEHLER] Setup wurde mit Fehlern abgeschlossen!
    echo.
    pause
    exit /b 1
)

echo.
echo ========================================
echo    Setup abgeschlossen!
echo ========================================
echo.
echo [INFO] Datenbank wurde erfolgreich erstellt und konfiguriert.
echo.
echo [NÄCHSTE SCHRITTE]
echo 1. Überprüfen Sie die config.json Datei und passen Sie die Datenbank-Zugangsdaten an
echo 2. Starten Sie den Server mit: omp-server.exe
echo 3. Loggen Sie sich mit dem Admin-Account ein und ändern Sie das Passwort
echo.
echo [ADMIN-ACCOUNT]
echo Benutzername: ShadowKev1999
echo Passwort: admin123
echo.
echo [WICHTIG] Ändern Sie das Admin-Passwort nach dem ersten Login!
echo.
pause
