# Rosalife-2025 Anti-Cheat System

Ich habe ein umfassendes Anti-Cheat-System für den Rosalife-2025 Server erstellt.

## ??? System-Übersicht

### Geschützte Cheat-Typen
- **Weapon Hack** - Ungültige Waffen erkennen
- **Money Hack** - Große Geldänderungen überwachen
- **Health Hack** - Unmögliche Health-Regeneration
- **Armor Hack** - Unmögliche Armor-Regeneration
- **Speed Hack** - Überhöhte Geschwindigkeit
- **Teleport Hack** - Unmögliche Positionsänderungen
- **Aimbot** - (Erweiterbar)
- **Car Hack** - Fahrzeug-Manipulation
- **Admin Abuse** - Missbrauch von Admin-Rechten
- **Chat Spam** - Übermäßiges Chatten
- **Bug Abuse** - Ausnutzung von Bugs

### Strafmaßnahmen
- **Warning** - Verwarnungssystem
- **Kick** - Temporärer Ausschluss
- **Ban** - Permanenter Ausschluss
- **Jail** - Gefängnisstrafe
- **Money Reset** - Geld zurücksetzen

## ?? Erstellt Dateien

### `anticheat_system.pwn` - Haupt-System
- **Vollständige Cheat-Erkennung**
- **Automatische Strafvergabe**
- **Admin-Befehle** zur Steuerung
- **Logging-System** mit Datenbank

### `anticheat_database.sql` - Datenbank-Struktur
- **Cheat-Logs** - Alle Vorfälle
- **Statistiken** - Täglich/Wöchentlich
- **Suspicious IPs** - Verdächtige IP-Adressen
- **Player Status** - Spieler-Historie

### `README_AntiCheat.md` - Diese Anleitung
- **Installationsanleitung**
- **Konfigurationsmöglichkeiten**
- **Admin-Befehle**

## ?? Installation

### 1. Anti-Cheat System integrieren
```pawn
// In skg.pwn hinzufügen
#include "core/server/anticheat_system.pwn"

// In OnGameModeInit()
AntiCheat_Initialize();
```

### 2. Datenbank einrichten
```bash
# SQL-Datei importieren
mysql -u root -p rosalife2025 < gamemodes/core/server/anticheat_database.sql
```

### 3. Spieler-Callbacks anbinden
```pawn
public OnPlayerConnect(playerid)
{
    // Bestehenden Code...
    AntiCheat_PlayerConnect(playerid);
    return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
    AntiCheat_PlayerDisconnect(playerid);
    // Bestehenden Code...
    return 1;
}
```

## ?? Konfiguration

### Schwellenwerte anpassen
```pawn
// In anticheat_system.pwn
#define MAX_SPEED_WARNINGS 3           // Max Speed-Warnungen
#define MAX_TELEPORT_WARNINGS 2         // Max Teleport-Warnungen
#define MAX_CHAT_MESSAGES_PER_MINUTE 10 // Max Chat-Nachrichten
#define SPEED_LIMIT_THRESHOLD 250.0     // Geschwindigkeitslimit
#define TELEPORT_DISTANCE_THRESHOLD 100.0 // Teleport-Distanz
#define MONEY_CHANGE_THRESHOLD 50000     // Geldänderungs-Schwelle
```

### Admin-Rechte anpassen
```pawn
// Admin-Level für verschiedene Funktionen
if(SpielerInfo[playerid][sAdmin] < 3) return 0; // Basic Anti-Cheat
if(SpielerInfo[playerid][sAdmin] < 4) return 0; // Logs einsehen
if(SpielerInfo[playerid][sAdmin] < 5) return 0; // Ban-Rechte
```

## ?? Admin-Befehle

### `/anticheat` - Hauptmenü
Zeigt alle verfügbaren Anti-Cheat Befehle

### `/ac_status` - System-Status
```
/ac_status
Admin Level 3 erforderlich
Zeigt: Anzahl geschützter Spieler, System-Status
```

### `/ac_logs` - Cheat-Logs einsehen
```
/ac_logs
Admin Level 4 erforderlich
Zeigt: Letzte 10 Cheat-Vorfälle mit Details
```

### `/ac_ban [player] [grund]` - Manuelles Bannen
```
/ac_ban 47 Money Hack
Admin Level 5 erforderlich
Bannt Spieler sofort und loggt den Vorfall
```

## ?? Überwachungs-Funktionen

### Echtzeit-Überwachung
- **Jede Sekunde** werden alle Spieler überprüft
- **Positions-Tracking** für Teleport-Erkennung
- **Health/Armor-Monitoring** für Regen-Erkennung
- **Geld-Überwachung** für Hack-Erkennung

### Intelligente Erkennung
- **Admin-Ausnahme** - Admins werden nicht überprüft
- **Fahrzeug-Logik** - Unterscheidung Fahrer/Beifahrer
- **Zeitfenster-Analyse** - Plausible Zeitdifferen
- **Distanz-Berechnung** - Unmögliche Bewegungen

### Automatische Strafvergabe
- **Warnungssystem** - Mehrere Warnungen vor Strafe
- **Stufenweise Eskalation** - Warning ? Kick ? Ban
- **Server-weite Benachrichtigung** - Alle Spieler werden informiert
- **Detailliertes Logging** - Für spätere Analyse

## ??? Datenbank-Struktur

### `anti_cheat_logs`
- **Alle Cheat-Vorfälle** mit Zeitstempel
- **Spieler-Informationen** und IP-Adressen
- **Cheat-Typ** und ergriffene Maßnahme

### `anti_cheat_stats`
- **Tägliche Statistiken** über Cheat-Aktivität
- **Aufschlüsselung nach Cheat-Typen**
- **Ban/Kick-Statistiken**

### `suspicious_ips`
- **Verdächtige IP-Adressen**
- **Mehrfach-Erkennung** mit Zähler
- **Automatische Ban-Überlegung**

### `player_anticheat_status`
- **Spieler-Historie** von Cheat-Vorfällen
- **Warnungszähler** und Gesamtstatistiken
- **Notizen** für Admin-Kommentare

## ?? Erweiterungsmöglichkeiten

### Aimbot-Erkennung (zukünftig)
```pawn
stock CheckAimbot(playerid)
{
    // Headshot-Rate analysieren
    // Zielverfolgung überwachen
    // Unmögliche Präzision erkennen
}
```

### Fly-Hack-Erkennung (zukünftig)
```pawn
stock CheckFlyHack(playerid)
{
    // Flugmuster analysieren
    // Schwerkraft-Verletzung erkennen
    // Height-Tracking überwachen
}
```

### Bug-Abuse-Erkennung (zukünftig)
```pawn
stock CheckBugAbuse(playerid)
{
    // Bekannte Exploits überwachen
    // Anomalie-Erkennung
    // Pattern-Matching für Bug-Nutzung
}
```

## ?? Performance-Optimierung

### Effiziente Überprüfung
- **Timer-Optimierung** - 1 Sekunde Intervall
- **Nur verbundene Spieler** - Keine unnötigen Checks
- **Admin-Ausnahme** - Admins werden übersprungen
- **Datenbank-Indizes** - Schnelle Abfragen

### Speicher-Management
- **Variablen-Reset** bei Disconnect
- **Effiziente Datentypen** - Float statt Double wo möglich
- **Timer-Limitierung** - Überlastung vermeiden

## ?? Fehlalarme

### False Positives vermeiden
- **Admin-Immunität** - Admins werden nicht bestraft
- **Lag-Kompensation** - Netzwerk-Lag berücksichtigen
- **Legitime Aktionen** - Admin-Commands, Teleporter etc.
- **Test-Modus** - Debug-Modus für Tests

### Logging für Analyse
- **Detaillierte Logs** mit allen relevanten Daten
- **Statistische Auswertung** für Trend-Analyse
- **IP-Tracking** für Multi-Account-Erkennung
- **Zeitstempel** für genaue Analyse

## ?? Beispiel-Logs

### Console-Ausgabe
```
[ANTI-CHEAT] Cheat erkannt: Speed Hack - Spieler: TestPlayer - Details: Speed: 350.5 m/s (Limit: 250.0)
[ANTI-CHEAT] Spieler bestraft: TestPlayer - Grund: Speed Hack - Typ: 2
```

### Datenbank-Einträge
```sql
INSERT INTO anti_cheat_logs VALUES (
    NULL, 'TestPlayer', 'Speed Hack', 'KICK', '192.168.1.100', NOW()
);
```

### Chat-Nachrichten
```
[ANTI-CHEAT] TestPlayer wurde gekickt (Grund: Speed Hack)
[ANTI-CHEAT] Warnung: Geschwindigkeit zu hoch! (1/3)
```

## ?? Wartung und Pflege

### Regelmäßige Aufgaben
- **Logs überprüfen** - Täglich Cheat-Vorfälle prüfen
- **Statistiken analysieren** - Wöchentliche Auswertung
- **IP-Blacklist pflegen** - Verdächtige IPs bannen
- **Schwellen anpassen** - Bei Bedarf anpassen

### Performance-Monitoring
- **Server-Performance** überwachen
- **Anti-Cheat-Impact** messen
- **Optimierung bei Bedarf** - Timer anpassen

## ??? Troubleshooting

### Häufige Probleme

#### "Zu viele False Positives"
**Lösung**: Schwellenwerte anpassen
```pawn
#define SPEED_LIMIT_THRESHOLD 300.0  // Erhöhen
#define TELEPORT_DISTANCE_THRESHOLD 150.0  // Erhöhen
```

#### "Performance-Probleme"
**Lösung**: Timer-Intervall anpassen
```pawn
SetTimer("AntiCheat_UpdateAll", 2000, true);  // Auf 2 Sekunden
```

#### "Admins werden gebannt"
**Lösung**: Admin-Check verbessern
```pawn
if(SpielerInfo[playerid][sAdmin] > 0) return 0;  // Am Anfang jeder Check-Funktion
```

---

**Hinweis**: Dieses Anti-Cheat-System ist als Grundlage gedacht und kann bei Bedarf erweitert werden. Regelmäßige Updates und Anpassungen sind empfohlen.
