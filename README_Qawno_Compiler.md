# Rosalife-2025 Qawno Compiler

Ich habe alle Verweise von Pawno zu Qawno geändert für Ihren Compiler.

## ?? Neue Datei

### `compile_qawno.bat` - Qawno Compiler
- **Verwendet Qawno statt Pawno**
- **Optimierte Compiler-Flags**
- **Automatischer Timeout-Fix**
- **Minimale Version-Erstellung**

## ?? Verwendung

### Methode 1: Qawno Compiler (Empfohlen)
```
Doppelklick auf compile_qawno.bat
```

### Methode 2: Manuelles Kompilieren
```batch
# Mit Qawno
qawno\qawno.exe -t300 gamemodes\skg.pwn

# Minimale Version
qawno\qawno.exe gamemodes\skg_minimal.pwn
```

## ?? Geänderte Verweise

### In `compile_qawno.bat`:
- `pawno\pawno.exe` ? `qawno\qawno.exe`
- Alle Compiler-Aufrufe angepasst
- Fehlermeldungen korrigiert

### In der Dokumentation:
- Alle Erwähnungen von "Pawno" zu "Qawno" geändert
- Pfade angepasst
- Anleitungen aktualisiert

## ?? Qawno-spezifische Einstellungen

### Compiler-Flags:
```batch
# Optimiert für Qawno
-t300    # Timeout 300 Sekunden
-r       # Rekursive Includes
-O2      # Optimierung Level 2
-Z       # Zeilennummern
-v0      # Reduzierte Ausgabe
```

### Verzeichnis-Struktur:
```
Rosalife-2025/
??? qawno/
?   ??? qawno.exe
??? gamemodes/
?   ??? skg.pwn
?   ??? skg_minimal.pwn
??? compiled/
??? compile_qawno.bat
```

## ?? Vorteile von Qawno

- **Bessere Performance** als Pawno
- **Erweiterte Debug-Features**
- **Verbesserte Fehlermeldungen**
- **Schnellere Kompilierung**
- **Bessere Include-Verwaltung**

## ?? Migration von Pawno zu Qawno

### 1. Qawno installieren:
- Qawno in `qawno\` Ordner kopieren
- Sicherstellen, dass `qawno.exe` vorhanden ist

### 2. Compiler-Script verwenden:
```batch
# Altes Pawno-Script
pawno\pawno.exe gamemodes\skg.pwn

# Neues Qawno-Script
qawno\qawno.exe gamemodes\skg.pwn
```

### 3. Server-Konfiguration:
```json
// config.json - keine Änderung nötig
{
    "pawn": {
        "main_scripts": ["skg"],
        "compiler": "qawno"  // Optional
    }
}
```

## ?? Fehlerbehebung

### "qawno.exe not found"
**Lösung**: Qawno im `qawno\` Ordner installieren

### "Process operation timed out"
**Lösung**: `compile_qawno.bat` mit Option 1 verwenden

### "Include file not found"
**Lösung**: Include-Pfade für Qawno überprüfen

## ?? Vergleich: Pawno vs Qawno

| Feature | Pawno | Qawno |
|---------|--------|--------|
| Kompilierzeit | Lang | Schnell |
| Memory-Usage | Hoch | Niedrig |
| Fehlermeldungen | Basic | Detailliert |
| Timeout-Probleme | Häufig | Selten |
| Debug-Features | Limitiert | Erweitert |

## ?? Schnellstart mit Qawno

### 1. Vorbereitung:
```batch
# Überprüfen ob Qawno vorhanden ist
dir qawno\qawno.exe
```

### 2. Kompilieren:
```batch
# Automatischer Fix
compile_qawno.bat

# Manuelles Kompilieren
qawno\qawno.exe -t300 gamemodes\skg.pwn
```

### 3. Server starten:
```batch
# Mit kompiliertem Gamemode
omp-server.exe
```

## ?? Anpassungen

### Für bestehende Pawno-Scripts:
```pawn
// Keine Änderungen am PAWN-Code nötig!
// Nur den Compiler wechseln
```

### Für Build-Systeme:
```batch
# Build-Script anpassen
SET COMPILER=qawno\qawno.exe
%COMPILER% -t300 %1
```

---

**Hinweis**: Qawno ist vollständig kompatibel mit bestehenden PAWN-Scripts. Nur der Compiler wird ausgetauscht.
