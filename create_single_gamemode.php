<?php
/**
 * Rosalife-2025 Single Gamemode Creator
 * Erstellt eine einzige Gamemode-Datei aus allen Includes
 */

// Konfiguration
$gamemodePath = __DIR__ . '/gamemodes/';
$outputFile = $gamemodePath . 'skg_single.pwn';
$backupFile = $gamemodePath . 'skg_backup_' . date('Y-m-d_H-i-s') . '.pwn';

echo "========================================\n";
echo "Rosalife-2025 Single Gamemode Creator\n";
echo "========================================\n\n";

// Überprüfen ob Verzeichnisse existieren
if (!is_dir($gamemodePath)) {
    die("[FEHLER] gamemodes Verzeichnis nicht gefunden!\n");
}

if (!is_dir($gamemodePath . 'core')) {
    die("[FEHLER] core Verzeichnis nicht gefunden!\n");
}

echo "[INFO] Starte Zusammenführung...\n";

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
fwrite($output, "// Rosalife-2025 - Single Gamemode File\n");
fwrite($output, "// Automatisch erstellt am " . date('Y-m-d H:i:s') . "\n");
fwrite($output, "// Alle Includes in einer Datei zusammengeführt\n");
fwrite($output, "// ================================================\n\n");

// Haupt-Gamemode zuerst
echo "[INFO] Verarbeite Haupt-Gamemode...\n";
if (file_exists($gamemodePath . 'skg.pwn')) {
    $content = file_get_contents($gamemodePath . 'skg.pwn');
    fwrite($output, $content);
    fwrite($output, "\n// ================================================\n");
}

// Funktion zum Verarbeiten von Verzeichnissen
function processDirectory($dir, $output, $prefix) {
    global $gamemodePath;
    
    if (!is_dir($gamemodePath . $dir)) {
        echo "[WARNUNG] Verzeichnis $dir nicht gefunden\n";
        return;
    }
    
    echo "[INFO] Verarbeite Verzeichnis: $dir\n";
    
    $files = glob($gamemodePath . $dir . '/*.pwn');
    foreach ($files as $file) {
        $filename = basename($file);
        echo "[INFO]  - Füge hinzu: $prefix$filename\n";
        
        fwrite($output, "\n// ================================================\n");
        fwrite($output, "// Datei: $prefix$filename\n");
        fwrite($output, "// ================================================\n");
        
        $content = file_get_contents($file);
        fwrite($output, $content);
        fwrite($output, "\n");
    }
}

// Core-Verzeichnisse verarbeiten
$coreDirs = [
    'utils' => 'core/utils/',
    'server' => 'core/server/',
    'admin' => 'core/admin/',
    'ui' => 'core/ui/',
    'item' => 'core/item/'
];

foreach ($coreDirs as $dir => $prefix) {
    processDirectory($dir, $output, $prefix);
}

// Vars-Verzeichnisse verarbeiten
if (is_dir($gamemodePath . 'vars')) {
    echo "[INFO] Verarbeite vars Verzeichnisse...\n";
    
    $varsDirs = glob($gamemodePath . 'vars/*', GLOB_ONLYDIR);
    foreach ($varsDirs as $dir) {
        $dirName = basename($dir);
        processDirectory('vars/' . $dirName, $output, 'vars/' . $dirName . '/');
    }
}

// Cmds-Verzeichnisse verarbeiten
if (is_dir($gamemodePath . 'cmds')) {
    echo "[INFO] Verarbeite cmds Verzeichnisse...\n";
    
    $cmdsDirs = glob($gamemodePath . 'cmds/*', GLOB_ONLYDIR);
    foreach ($cmdsDirs as $dir) {
        $dirName = basename($dir);
        processDirectory('cmds/' . $dirName, $output, 'cmds/' . $dirName . '/');
    }
}

// Mappings verarbeiten
processDirectory('mappings', $output, 'mappings/');

// Pending verarbeiten
processDirectory('pending', $output, 'pending/');

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
}

echo "\n[INFO] Vorgang abgeschlossen\n";
echo "========================================\n";
?>
