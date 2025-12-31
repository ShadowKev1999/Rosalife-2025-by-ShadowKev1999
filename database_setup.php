<?php
/**
 * Rosalife-2025 Database Setup Script
 * Erstellt automatisch die Datenbank und alle Tabellen
 */

// Konfiguration
$config = [
    'host' => 'localhost',
    'username' => 'root',
    'password' => '',
    'database' => 'rosalife2025',
    'charset' => 'utf8mb4'
];

// Farben für Konsolenausgabe
const COLOR_RESET = "\033[0m";
const COLOR_RED = "\033[31m";
const COLOR_GREEN = "\033[32m";
const COLOR_YELLOW = "\033[33m";
const COLOR_BLUE = "\033[34m";
const COLOR_CYAN = "\033[36m";

// Funktion für farbige Ausgabe
function coloredOutput($text, $color = COLOR_RESET) {
    echo $color . $text . COLOR_RESET . PHP_EOL;
}

// Funktion zum Überprüfen, ob Skript über CLI läuft
function isCli() {
    return php_sapi_name() === 'cli';
}

// Funktion zur Verbindung mit MySQL
function connectToMySQL($host, $username, $password) {
    try {
        $conn = new mysqli($host, $username, $password);
        if ($conn->connect_error) {
            throw new Exception("Verbindung fehlgeschlagen: " . $conn->connect_error);
        }
        coloredOutput("? Verbindung zum MySQL-Server erfolgreich", COLOR_GREEN);
        return $conn;
    } catch (Exception $e) {
        coloredOutput("? Fehler bei der Verbindung: " . $e->getMessage(), COLOR_RED);
        return null;
    }
}

// Funktion zum Erstellen der Datenbank
function createDatabase($conn, $database) {
    try {
        // Prüfen ob Datenbank bereits existiert
        $result = $conn->query("SHOW DATABASES LIKE '$database'");
        if ($result->num_rows > 0) {
            coloredOutput("! Datenbank '$database' existiert bereits", COLOR_YELLOW);
            $choice = isCli() ? readline("Datenbank löschen und neu erstellen? (j/N): ") : 'n';
            if (strtolower(trim($choice)) !== 'j') {
                coloredOutput("Datenbank wird nicht neu erstellt", COLOR_BLUE);
                return true;
            }
            $conn->query("DROP DATABASE `$database`");
            coloredOutput("? Alte Datenbank gelöscht", COLOR_GREEN);
        }
        
        // Neue Datenbank erstellen
        $sql = "CREATE DATABASE `$database` CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci";
        if ($conn->query($sql)) {
            coloredOutput("? Datenbank '$database' erfolgreich erstellt", COLOR_GREEN);
            return true;
        } else {
            throw new Exception("Fehler beim Erstellen der Datenbank: " . $conn->error);
        }
    } catch (Exception $e) {
        coloredOutput("? " . $e->getMessage(), COLOR_RED);
        return false;
    }
}

// Funktion zum Ausführen der SQL-Datei
function executeSqlFile($conn, $database, $sqlFile) {
    try {
        coloredOutput("Lese SQL-Datei: $sqlFile", COLOR_BLUE);
        
        if (!file_exists($sqlFile)) {
            throw new Exception("SQL-Datei nicht gefunden: $sqlFile");
        }
        
        $sql = file_get_contents($sqlFile);
        if ($sql === false) {
            throw new Exception("Fehler beim Lesen der SQL-Datei");
        }
        
        // Datenbank auswählen
        $conn->select_db($database);
        
        // SQL in einzelne Statements aufteilen
        $statements = array_filter(array_map('trim', explode(';', $sql)));
        
        coloredOutput("Führe " . count($statements) . " SQL-Statements aus...", COLOR_BLUE);
        
        $executed = 0;
        $errors = 0;
        
        foreach ($statements as $statement) {
            if (empty($statement)) continue;
            
            // Kommentare und leere Zeilen überspringen
            if (preg_match('/^(--|#|\/\*)/', $statement)) continue;
            
            if ($conn->query($statement)) {
                $executed++;
            } else {
                $errors++;
                coloredOutput("? Fehler bei Statement: " . substr($statement, 0, 50) . "...", COLOR_RED);
                coloredOutput("  Fehler: " . $conn->error, COLOR_RED);
            }
        }
        
        coloredOutput("? $executed Statements erfolgreich ausgeführt", COLOR_GREEN);
        if ($errors > 0) {
            coloredOutput("! $errors Statements mit Fehlern", COLOR_YELLOW);
        }
        
        return $errors === 0;
        
    } catch (Exception $e) {
        coloredOutput("? " . $e->getMessage(), COLOR_RED);
        return false;
    }
}

// Funktion zum Überprüfen der erstellten Tabellen
function verifyTables($conn, $database) {
    try {
        $conn->select_db($database);
        $result = $conn->query("SHOW TABLES");
        $tables = [];
        
        while ($row = $result->fetch_row()) {
            $tables[] = $row[0];
        }
        
        coloredOutput("? " . count($tables) . " Tabellen erstellt:", COLOR_GREEN);
        
        foreach ($tables as $table) {
            $result = $conn->query("SELECT COUNT(*) FROM `$table`");
            $count = $result->fetch_row()[0];
            coloredOutput("  - $table ($count Einträge)", COLOR_CYAN);
        }
        
        return true;
    } catch (Exception $e) {
        coloredOutput("? Fehler bei der Überprüfung: " . $e->getMessage(), COLOR_RED);
        return false;
    }
}

// Funktion zum Erstellen eines Admin-Accounts
function createAdminAccount($conn, $database) {
    try {
        $conn->select_db($database);
        
        coloredOutput("Erstelle Admin-Account...", COLOR_BLUE);
        
        $username = 'ShadowKev1999';
        $password = password_hash('admin123', PASSWORD_DEFAULT);
        $email = 'admin@rosalife2025.de';
        
        $sql = "INSERT INTO `accounts` (`Name`, `Passwort`, `EMail`, `Admin`, `Level`, `Bargeld`, `Bankkonto`, `Perso`, `Registerdatum`) 
                VALUES (?, ?, ?, 5, 10, 100000, 500000, 1, NOW())";
        
        $stmt = $conn->prepare($sql);
        $stmt->bind_param('sss', $username, $password, $email);
        
        if ($stmt->execute()) {
            coloredOutput("? Admin-Account '$username' erstellt", COLOR_GREEN);
            coloredOutput("  Passwort: admin123", COLOR_YELLOW);
            coloredOutput("  Bitte ändere das Passwort nach dem ersten Login!", COLOR_YELLOW);
            return true;
        } else {
            coloredOutput("! Admin-Account existiert bereits oder Fehler bei Erstellung", COLOR_YELLOW);
            return false;
        }
        
    } catch (Exception $e) {
        coloredOutput("? Fehler beim Erstellen des Admin-Accounts: " . $e->getMessage(), COLOR_RED);
        return false;
    }
}

// Hauptfunktion
function main() {
    global $config;
    
    if (!isCli()) {
        echo "<pre>";
        coloredOutput("Rosalife-2025 Database Setup", COLOR_BLUE);
        coloredOutput("=============================", COLOR_BLUE);
        coloredOutput("Dieses Skript sollte über die Kommandozeile ausgeführt werden:", COLOR_YELLOW);
        coloredOutput("php database_setup.php", COLOR_CYAN);
        echo "</pre>";
        return;
    }
    
    coloredOutput("Rosalife-2025 Database Setup", COLOR_BLUE);
    coloredOutput("=============================", COLOR_BLUE);
    coloredOutput("Konfiguration:", COLOR_CYAN);
    coloredOutput("  Host: " . $config['host'], COLOR_CYAN);
    coloredOutput("  Datenbank: " . $config['database'], COLOR_CYAN);
    coloredOutput("  Benutzer: " . $config['username'], COLOR_CYAN);
    echo PHP_EOL;
    
    // Schritt 1: Verbindung zum MySQL-Server
    $conn = connectToMySQL($config['host'], $config['username'], $config['password']);
    if (!$conn) {
        coloredOutput("Setup abgebrochen wegen Verbindungsfehlern", COLOR_RED);
        return;
    }
    
    // Schritt 2: Datenbank erstellen
    if (!createDatabase($conn, $config['database'])) {
        coloredOutput("Setup abgebrochen wegen Datenbankfehlern", COLOR_RED);
        $conn->close();
        return;
    }
    
    // Schritt 3: SQL-Datei ausführen
    $sqlFile = __DIR__ . '/rosalife-2025-database.sql';
    if (!executeSqlFile($conn, $config['database'], $sqlFile)) {
        coloredOutput("Setup mit Fehlern abgeschlossen", COLOR_YELLOW);
    }
    
    // Schritt 4: Tabellen überprüfen
    verifyTables($conn, $config['database']);
    
    // Schritt 5: Admin-Account erstellen
    createAdminAccount($conn, $config['database']);
    
    $conn->close();
    
    echo PHP_EOL;
    coloredOutput("=============================", COLOR_BLUE);
    coloredOutput("Setup abgeschlossen!", COLOR_GREEN);
    coloredOutput("=============================", COLOR_BLUE);
    coloredOutput("Nächste Schritte:", COLOR_CYAN);
    coloredOutput("1. Server konfigurieren (config.json)", COLOR_CYAN);
    coloredOutput("2. Datenbank-Zugangsdaten in Server eintragen", COLOR_CYAN);
    coloredOutput("3. Server starten: omp-server.exe", COLOR_CYAN);
    coloredOutput("4. Mit Admin-Account einloggen und Passwort ändern", COLOR_CYAN);
    echo PHP_EOL;
}

// Bei Web-Ausführung auch HTML-Header ausgeben
if (!isCli()) {
    header('Content-Type: text/html; charset=utf-8');
    echo '<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rosalife-2025 Database Setup</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; background: #f5f5f5; }
        .container { max-width: 800px; margin: 0 auto; background: white; padding: 20px; border-radius: 8px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
        .header { text-align: center; color: #333; border-bottom: 2px solid #007DFF; padding-bottom: 10px; margin-bottom: 20px; }
        .success { color: #28a745; }
        .error { color: #dc3545; }
        .warning { color: #ffc107; }
        .info { color: #17a2b8; }
        pre { background: #f8f9fa; padding: 15px; border-radius: 4px; overflow-x: auto; }
        .btn { display: inline-block; padding: 10px 20px; background: #007DFF; color: white; text-decoration: none; border-radius: 4px; margin: 5px; }
        .btn:hover { background: #0056b3; }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Rosalife-2025 Database Setup</h1>
            <p>Automatische Datenbank-Einrichtung</p>
        </div>';
}

// Skript ausführen
main();

if (!isCli()) {
    echo '
        <div class="info">
            <h3>?? Wichtiger Hinweis</h3>
            <p>Dieses Setup-Skript sollte über die Kommandozeile ausgeführt werden:</p>
            <pre><code>php database_setup.php</code></pre>
            <p>Stellen Sie sicher, dass Sie die richtigen MySQL-Zugangsdaten in der config.php haben.</p>
        </div>
        <div class="warning">
            <h3>?? Sicherheit</h3>
            <p>Ändern Sie nach der Einrichtung unbedingt das Standard-Admin-Passwort!</p>
        </div>
    </div>
</body>
</html>';
}

?>
