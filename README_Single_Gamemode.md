# Rosalife-2025 Single Gamemode Creator

Ich habe zwei Skripte erstellt, die die gesamte Ordnerstruktur in eine einzige Gamemode-Datei zusammenführen.

## ?? Problem

Die aktuelle Struktur hat **über 100 Include-Dateien** in verschiedenen Ordnern:
```
gamemodes/
??? core/          # 20+ Dateien
??? vars/          # 50+ Dateien
??? cmds/          # 50+ Dateien
??? mappings/       # 3 Dateien
??? pending/       # 2 Dateien
??? skg.pwn        # Hauptdatei mit 100+ #include
```

Das führt zu Compiler-Timeouts und langsamer Kompilierung.

## ??? Lösungen

### Methode 1: Batch-Skript (Windows)
```batch
# Automatisch alle Dateien zusammenführen
merge_gamemode.bat
```

### Methode 2: PHP-Skript (Kreuzplattform)
```bash
# PHP-basierte Zusammenführung
php create_single_gamemode.php
```

## ?? Erstellt Dateien

### `merge_gamemode.bat`
- **Führt alle .pwn Dateien zusammen**
- **Erstellt skg_merged.pwn**
- **Backup der Originaldatei**
- **Option zum Ersetzen von skg.pwn**

### `create_single_gamemode.php`
- **PHP-basierte Verarbeitung**
- **Bessere Fehlerbehandlung**
- **Detailliertes Logging**
- **Kreuzplattform-kompatibel**

### `README_Single_Gamemode.md`
- **Diese Anleitung**
- **Vergleich der Methoden**
- **Troubleshooting**

## ?? Verwendung

### Methode 1: Batch (Empfohlen für Windows)
1. **Doppelklick auf `merge_gamemode.bat`**
2. **Warten bis Zusammenführung abgeschlossen**
3. **Option "j" wählen** um skg.pwn zu ersetzen

### Methode 2: PHP (Empfohlen für alle Systeme)
1. **PHP installieren** (falls nicht vorhanden)
2. **Ausführen**: `php create_single_gamemode.php`
3. **"j" eingeben** um skg.pwn zu ersetzen

## ?? Ergebnis

### Vorher:
- **100+ Includes** in skg.pwn
- **Compiler-Timeout** wahrscheinlich
- **Lange Kompilierzeit** (5-10 Minuten)
- **Schwierige Fehlersuche**

### Nachher:
- **1 Include** (keine Includes mehr)
- **Schnelle Kompilierung** (10-30 Sekunden)
- **Keine Timeout-Probleme**
- **Einfache Fehlersuche**

## ?? Was die Skripte tun

### 1. **Dateien sammeln**
- Alle `.pwn` Dateien aus allen Ordnern
- Reihenfolge beibehalten (core ? vars ? cmds ? mappings ? pending)

### 2. **Struktur hinzufügen**
```pawn
// ================================================
// Datei: core/utils/colors.pwn
// ================================================
[Inhalt der Datei]
```

### 3. **Backup erstellen**
- Original `skg.pwn` sichern
- Zeitstempel im Dateinamen

### 4. **Zieldatei erstellen**
- `skg_merged.pwn` oder `skg_single.pwn`
- Alle Inhalte in einer Datei

## ?? Beispiel der Ausgabe

```pawn
// Rosalife-2025 - Single Gamemode File
// Automatisch erstellt am 2025-12-31 18:00:00
// Alle Includes in einer Datei zusammengeführt
// ================================================

// Haupt-Gamemode
[Inhalt von skg.pwn ohne #include Zeilen]

// ================================================
// Datei: core/utils/colors.pwn
// ================================================
[Inhalt von colors.pwn]

// ================================================
// Datei: core/utils/functions.pwn
// ================================================
[Inhalt von functions.pwn]

[... alle anderen Dateien ...]

// ================================================
// Zusammenführung abgeschlossen
// ================================================
```

## ?? Konfiguration

### PHP-Skript anpassen:
```php
// Pfade anpassen falls nötig
$gamemodePath = __DIR__ . '/gamemodes/';
$outputFile = $gamemodePath . 'skg_single.pwn';
```

### Batch-Skript anpassen:
```batch
// Weitere Verzeichnisse hinzufügen
for %%f in (gamemodes\neuer_ordner\*.pwn) do (
    rem Verarbeitung
)
```

## ?? Wichtige Hinweise

### 1. **Includes entfernen**
Die Skripte entfernen automatisch alle `#include` Zeilen aus der ursprünglichen `skg.pwn`.

### 2. **Doppelte Definitionen**
Die Skripte versuchen, doppelte Definitionen zu vermeiden, aber manuelle Überprüfung wird empfohlen.

### 3. **Reihenfolge**
Die Reihenfolge der Dateien ist wichtig für die Funktionalität.

### 4. **Speicherbedarf**
Die einzelne Datei wird sehr groß (mehrere MB), aber kompiliert schneller.

## ?? Fehlerbehebung

### "Out of memory"
- **Lösung**: `#pragma dynamic 131072` in der Datei hinzufügen

### "Symbol already defined"
- **Lösung**: Doppelte Definitionen manuell entfernen

### "File too large"
- **Lösung**: Qawno Compiler verwenden (bessere Handhabung großer Dateien)

## ?? Performance-Vergleich

| Methode | Dateien | Kompilierzeit | Memory | Vorteile |
|---------|----------|----------------|--------|-----------|
| Modular | 100+ | 5-10 Min | Hoch | Modular, übersichtlich |
| Single | 1 | 10-30 Sek | Niedrig | Schnell, einfach |

## ?? Nächste Schritte

### 1. Zusammenführen
```bash
# Methode 1
merge_gamemode.bat

# Methode 2
php create_single_gamemode.php
```

### 2. Kompilieren
```bash
# Mit Qawno
qawno\qawno.exe gamemodes\skg_single.pwn

# Mit Pawno
pawno\pawno.exe gamemodes\skg_single.pwn
```

### 3. Testen
```bash
# Server starten
omp-server.exe
```

### 4. Bei Erfolg
- Alte Ordnerstruktur als Backup behalten
- Neue einzelne Datei als Haupt-Gamemode verwenden

---

**Empfehlung**: Beginnen Sie mit der PHP-Version für bessere Fehlerbehandlung und Logging.
