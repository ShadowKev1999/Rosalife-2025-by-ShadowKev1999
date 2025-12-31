<?php
/**
 * Rosalife-2025 Single Gamemode Creator V2
 * Fügt alle Ordner in eine einzige .pwn Datei zusammen
 */

// Konfiguration
$gamemodePath = __DIR__ . '/gamemodes/';
$outputFile = $gamemodePath . 'skg_single.pwn';
$backupFile = $gamemodePath . 'skg_backup_' . date('Y-m-d_H-i-s') . '.pwn';

echo "========================================\n";
echo "Rosalife-2025 Single Gamemode Creator V2\n";
echo "========================================\n\n";

// Überprüfen ob Verzeichnisse existieren
if (!is_dir($gamemodePath)) {
    die("[FEHLER] gamemodes Verzeichnis nicht gefunden!\n");
}

echo "[INFO] Starte Zusammenführung aller Ordner...\n";

// Backup erstellen
if (file_exists($gamemodePath . 'skg.pwn')) {
    copy($gamemodePath . 'skg.pwn', $backupFile);
    echo "[INFO] Backup erstellt: " . basename($backupFile) . "\n";
}

// Output-Datei öffnen
$output = fopen($outputFile, 'w');
if (!$output) {
    die("[FEHLER] Konnte Output-Datei nicht erstellen!\n");
}

// Header schreiben
fwrite($output, "// Rosalife-2025 - Single Gamemode File (V2)\n");
fwrite($output, "// Automatisch erstellt am " . date('Y-m-d H:i:s') . "\n");
fwrite($output, "// Alle Ordner in einer Datei zusammengeführt\n");
fwrite($output, "// ================================================\n\n");

// Funktion zum Verarbeiten von Verzeichnissen
function processDirectory($dirPath, $output, $prefix, $excludePatterns = []) {
    $fullPath = $gamemodePath . $dirPath;
    
    if (!is_dir($fullPath)) {
        echo "[WARNUNG] Verzeichnis $dirPath nicht gefunden\n";
        return;
    }
    
    echo "[INFO] Verarbeite Verzeichnis: $dirPath\n";
    
    $files = glob($fullPath . '/*.pwn');
    
    foreach ($files as $file) {
        $filename = basename($file);
        
        // Ausschlussmuster prüfen
        $skip = false;
        foreach ($excludePatterns as $pattern) {
            if (strpos($filename, $pattern) !== false) {
                $skip = true;
                break;
            }
        }
        
        if ($skip) {
            echo "[INFO]  - Überspringe: $filename (Ausschlussmuster)\n";
            continue;
        }
        
        echo "[INFO]  - Füge hinzu: $prefix$filename\n";
        
        // Dateiinhalt lesen und schreiben
        $content = file_get_contents($file);
        if ($content !== false) {
            fwrite($output, "\n// ================================================\n");
            fwrite($output, "// Datei: $prefix$filename\n");
            fwrite($output, "// ================================================\n");
            fwrite($output, $content);
            fwrite($output, "\n");
        } else {
            echo "[WARNUNG] Konnte $filename nicht lesen\n";
        }
    }
}

// Haupt-Gamemode zuerst (ohne #include)
echo "[INFO] Verarbeite Haupt-Gamemode...\n";
if (file_exists($gamemodePath . 'skg.pwn')) {
    $content = file_get_contents($gamemodePath . 'skg.pwn');
    
    // #include Zeilen entfernen und durch Dateiinhalte ersetzen
    $lines = explode("\n", $content);
    $newContent = "";
    
    foreach ($lines as $line) {
        if (strpos(trim($line), '#include') === 0) {
            // Include-Zeile überspringen
            continue;
        }
        $newContent .= $line . "\n";
    }
    
    fwrite($output, $newContent);
    fwrite($output, "\n");
}

// Verzeichnisse in der richtigen Reihenfolge verarbeiten
$directories = [
    'core/utils' => 'core/utils/',
    'core/server' => 'core/server/',
    'core/admin' => 'core/admin/',
    'core/ui' => 'core/ui/',
    'core/item' => 'core/item/',
    'core/faction' => 'core/faction/',
    'core/vehicles' => 'core/vehicles/',
    'vars' => 'vars/',
    'cmds' => 'cmds/',
    'mappings' => 'mappings/',
    'pending' => 'pending/'
];

// Ausschlussmuster für wichtige Dateien (werden separat behandelt)
$excludePatterns = [
    'config.pwn',      // Wird am Anfang eingefügt
    'anticheat.pwn',   // Wird am Ende eingefügt
    'database_setup.pwn' // Wird am Ende eingefügt
];

foreach ($directories as $dir => $prefix) {
    processDirectory($dir, $output, $prefix, $excludePatterns);
}

// Wichtige Dateien am Ende hinzufügen
echo "[INFO] Füge wichtige Systemdateien hinzu...\n";

$importantFiles = [
    'core/server/config.pwn',
    'core/server/anticheat_system.pwn',
    'core/server/database_setup.pwn'
];

foreach ($importantFiles as $file) {
    $filePath = $gamemodePath . $file;
    if (file_exists($filePath)) {
        $filename = basename($file);
        echo "[INFO]  - Füge hinzu: $filename (wichtig)\n";
        
        $content = file_get_contents($filePath);
        if ($content !== false) {
            fwrite($output, "\n// ================================================\n");
            fwrite($output, "// WICHTIGE DATEI: $filename\n");
            fwrite($output, "// ================================================\n");
            fwrite($output, $content);
            fwrite($output, "\n");
        }
    }
}

// Abschluss schreiben
fwrite($output, "\n// ================================================\n");
fwrite($output, "// Zusammenführung abgeschlossen\n");
fwrite($output, "// Erstellt am " . date('Y-m-d H:i:s') . "\n");
fwrite($output, "// ================================================\n");

fclose($output);

echo "\n[INFO] Zusammenführung abgeschlossen!\n";

// Dateiinformationen
$fileSize = filesize($outputFile);
echo "[INFO] Output-Datei: " . basename($outputFile) . "\n";
echo "[INFO] Dateigröße: " . number_format($fileSize) . " Bytes\n";

// Statistik
$processedFiles = 0;
foreach ($directories as $dir) {
    $fullPath = $gamemodePath . $dir;
    if (is_dir($fullPath)) {
        $processedFiles += count(glob($fullPath . '/*.pwn'));
    }
}

echo "[INFO] Verarbeitete Dateien: $processedFiles\n";

// Nächste Schritte
echo "\n========================================\n";
echo "NÄCHSTE SCHRITTE\n";
echo "========================================\n";
echo "1. Kompilieren: qawno\\qawno.exe gamemodes\\skg_single.pwn\n";
echo "2. Testen: Server mit skg_single.amx starten\n";
echo "3. Bei Erfolg: skg_single.pwn als skg.pwn verwenden\n\n";

// Frage ob ersetzen
echo "Möchten Sie die zusammengeführte Datei als Haupt-Gamemode verwenden? (j/N): ";
$handle = fopen("php://stdin", "r");
$line = fgets($handle);
fclose($handle);

if (trim(strtolower($line)) === 'j') {
    echo "\n[INFO] Sichere aktuelle skg.pwn...\n";
    copy($gamemodePath . 'skg.pwn', $gamemodePath . 'skg_original.pwn');
    
    echo "[INFO] Ersetze skg.pwn mit zusammengeführter Version...\n";
    copy($outputFile, $gamemodePath . 'skg.pwn');
    
    echo "[ERFOLG] skg.pwn wurde ersetzt!\n";
    echo "[INFO] Original gesichert als skg_original.pwn\n";
    
    // Statistik in Datei schreiben
    $statsFile = $gamemodePath . 'merge_stats.txt';
    $statsContent = "Zusammenführungs-Statistik\n";
    $statsContent .= "Datum: " . date('Y-m-d H:i:s') . "\n";
    $statsContent .= "Verarbeitete Dateien: $processedFiles\n";
    $statsContent .= "Ausgabedatei: " . basename($outputFile) . "\n";
    $statsContent .= "Dateigröße: " . number_format($fileSize) . " Bytes\n";
    file_put_contents($statsFile, $statsContent);
    
    echo "[INFO] Statistik gespeichert: merge_stats.txt\n";
}

echo "\n[INFO] Vorgang abgeschlossen\n";
echo "========================================\n";
?>
