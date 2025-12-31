# Rosalife-2025 PAWN Datenbank Setup

Diese Anleitung erklärt, wie Sie das PAWN-Datenbank-Setup in Ihren Gamemode integrieren.

## ?? Dateien

### 1. `database_setup.pwn` - Vollständiges Setup
- **25+ Tabellen** werden automatisch erstellt
- **Admin-Account** wird eingerichtet
- **Standard-Daten** werden eingefügt
- **Fortschritts-Tracking** mit detaillierten Logs
- **Admin-Befehle** für manuelle Steuerung

### 2. `database_simple.pwn` - Vereinfachtes Setup
- **5 Haupttabellen** für schnellen Start
- **Grundfunktionalität** für Test-Server
- **Einfache Integration** in bestehende Gamemodes
- **Schnelle Einrichtung** in wenigen Minuten

### 3. `database_setup.inc` - Include-Datei
- **Forward-Deklarationen** für einfache Integration
- **Stock-Funktionen** für andere Systeme
- **Native-Funktionen** für Überprüfungen

## ?? Schnelle Integration

### Methode 1: Vollständiges Setup

1. **Include einbinden** (am Anfang Ihres Gamemodes):
```pawn
#include "database_setup"
```

2. **Setup initialisieren** (in `OnGameModeInit()`):
```pawn
public OnGameModeInit()
{
    // Ihre anderen Initialisierungen...
    
    // Datenbank-Setup starten
    Database_Initialize();
    
    return 1;
}
```

3. **Setup-Status überprüfen** (optional):
```pawn
public OnPlayerConnect(playerid)
{
    // Warten bis Setup abgeschlossen
    if(!IsDatabaseSetupComplete())
    {
        SendClientMessage(playerid, COLOR_YELLOW, "[INFO] Datenbank wird eingerichtet...");
    }
    return 1;
}
```

### Methode 2: Vereinfachtes Setup

1. **Datei einbinden**:
```pawn
#include "database_simple"
```

2. **Setup starten**:
```pawn
public OnGameModeInit()
{
    // Ihre anderen Initialisierungen...
    
    // Einfaches Datenbank-Setup
    DatabaseSimple_Initialize();
    
    return 1;
}
```

3. **Status überprüfen**:
```pawn
if(IsDatabaseReady())
{
    // Server ist bereit
}
```

## ?? Admin-Befehle

Nach der Integration stehen folgende Admin-Befehle zur Verfügung:

### `/setupdb`
- **Admin Level 5** erforderlich
- Startet das Datenbank-Setup manuell
- Nützlich bei Fehlern oder Neustarts

### `/checkdb`
- **Admin Level 3** erforderlich
- Überprüft alle Tabellen
- Zeigt fehlende Tabellen an

## ?? Erstellt Tabellen

### Vollständiges Setup (25+ Tabellen):
- **accounts** - Spielerdaten
- **vehicles** - Fahrzeuge
- **houses** - Häuser
- **businesses** - Geschäfte
- **garages** - Garagen
- **groups** - Gruppen
- **group_members** - Gruppenmitglieder
- **licenses** - Lizenzen
- **phone_contacts/messages** - Handy-System
- **items** - Inventar
- **job_stats** - Job-Statistiken
- **atm_machines** - Bankautomaten
- **speed_cameras** - Blitzer
- **admin_logs** - Admin-Logs
- **server_stats** - Server-Statistiken
- **achievements** - Achievements
- **faction_ranks/vehicles** - Fraktions-System

### Vereinfachtes Setup (5 Tabellen):
- **accounts** - Spielerdaten
- **vehicles** - Fahrzeuge
- **houses** - Häuser
- **businesses** - Geschäfte
- **admin_logs** - Admin-Logs

## ?? Anpassung

### Admin-Account ändern:
```pawn
// In database_setup.pwn oder database_simple.pwn
// Ändern Sie diese Zeile:
"INSERT INTO `accounts` (`Name`, `Passwort`, `Admin`, `Level`, ...) \
 VALUES ('IhrName', '$2y$10$...', 5, 10, ...)"
```

### Zusätzliche Tabellen hinzufügen:
```pawn
// In DatabaseTables Array hinzufügen:
{"neue_tabelle", "CREATE TABLE IF NOT EXISTS `neue_tabelle` (...)"}
```

### Passwort-Hash ändern:
```pawn
// Verwenden Sie bcrypt oder andere Hashing-Methoden
new hash[256];
bcrypt_hash(playerid, "neues_passwort", 0, "OnPasswordHashed");
```

## ?? Callbacks

### Wichtige Callbacks:
```pawn
// Wird aufgerufen wenn Setup abgeschlossen ist
public OnDatabaseSetupComplete()
{
    print("Datenbank bereit - Server kann starten");
    return 1;
}

// Nach Tabellen-Erstellung
public Database_OnTableCreated(table_index, table_name[])
{
    printf("Tabelle %s wurde erstellt", table_name);
    return 1;
}
```

## ?? Fehlerbehebung

### Häufige Probleme:

#### 1. "Table doesn't exist"
- **Lösung**: `/setupdb` Befehl verwenden
- **Ursache**: Tabellen wurden nicht erstellt

#### 2. "Connection failed"
- **Lösung**: MySQL-Verbindung überprüfen
- **Ursache**: Falsche Datenbank-Zugangsdaten

#### 3. "Setup already complete"
- **Lösung**: Server neustarten oder Tabellen manuell löschen
- **Ursache**: Setup wurde bereits ausgeführt

### Debug-Modus aktivieren:
```pawn
// In OnGameModeInit()
print("[DEBUG] Datenbank-Setup Debug aktiviert");
```

## ?? Sicherheit

### Wichtige Sicherheitshinweise:

1. **Admin-Passwort ändern**:
```pawn
// Standard-Passwort: admin123
// Ändern Sie es sofort nach dem ersten Login!
```

2. **MySQL-Zugangsdaten sichern**:
```pawn
// Verwenden Sie sichere Passwörter
// Beschränken Sie Datenbank-Rechte
```

3. **SQL-Injection verhindern**:
```pawn
// Immer mysql_escape_string verwenden
new escaped_name[MAX_PLAYER_NAME];
mysql_escape_string(g_SQLHandle, playername, escaped_name, sizeof(escaped_name));
```

## ?? Performance

### Optimierungstipps:

1. **Indizes verwenden**:
```sql
CREATE INDEX idx_name ON accounts(Name);
CREATE INDEX idx_owner ON vehicles(Besitzer);
```

2. **Asynchrone Queries**:
```pawn
// Immer mysql_tquery mit Callbacks verwenden
mysql_tquery(g_SQLHandle, query, "OnQueryComplete", "d", playerid);
```

3. **Caching**:
```pawn
// Häufig abgerufene Daten zwischenspeichern
new g_PlayerData[MAX_PLAYERS][E_PLAYER_DATA];
```

## ?? Support

Bei Problemen mit dem PAWNSetup:

1. **Server-Logs überprüfen**
2. **MySQL-Logs ansehen**
3. **Admin-Befehle verwenden**
4. **Debug-Modus aktivieren**

---

**Hinweis**: Das Setup wurde für Rosalife-2025 optimiert, kann aber an andere Gamemodes angepasst werden.
