# Rosalife-2025 Datenbank Setup

Diese Anleitung erklärt, wie Sie die Datenbank für den Rosalife-2025 Server automatisch einrichten.

## ?? Schnellstart (Windows)

### Methode 1: Batch-Datei (Empfohlen)
1. Doppelklicken Sie auf `setup_database.bat`
2. Folgen Sie den Anweisungen auf dem Bildschirm
3. Fertig!

### Methode 2: Manuelles PHP-Skript
1. Öffnen Sie Kommandozeile (CMD)
2. Navigieren Sie in das Server-Verzeichnis
3. Führen Sie aus: `php database_setup.php`

## ?? Voraussetzungen

### Benötigte Software:
- **PHP 7.4+** mit mysqli-Erweiterung
- **MySQL/MariaDB 5.7+** oder **10.2+**
- **Zugriff auf MySQL** mit CREATE DATABASE Rechten

### PHP Installation überprüfen:
```bash
php --version
```

### MySQL Installation überprüfen:
```bash
mysql --version
```

## ?? Konfiguration

### 1. Datenbank-Zugangsdaten anpassen
Bearbeiten Sie die Datei `database_config.php`:

```php
'database' => [
    'host' => 'localhost',        // MySQL Server
    'username' => 'root',        // MySQL Benutzer
    'password' => '',            // MySQL Passwort
    'database' => 'rosalife2025', // Datenbankname
    'charset' => 'utf8mb4'
]
```

### 2. Admin-Account Einstellungen
```php
'admin' => [
    'username' => 'ShadowKev1999',  // Admin-Name
    'password' => 'admin123',      // Admin-Passwort
    'email' => 'admin@rosalife2025.de',
    'level' => 10,                 // Spieler-Level
    'admin_level' => 5             // Admin-Level
]
```

## ??? Datenbank-Struktur

Das Setup erstellt automatisch folgende Tabellen:

### Haupttabellen:
- **accounts** - Spielerdaten und Statistiken
- **vehicles** - Fahrzeuge und Tuning
- **houses** - Häuser und Immobilien
- **businesses** - Geschäfte und Unternehmen
- **garages** - Garagen für Fahrzeuge

### Systemtabellen:
- **groups** - Spielergruppen
- **licenses** - Lizenzen (Auto, Waffe, etc.)
- **items** - Inventar-System
- **phone_contacts/messages** - Handy-System

### Job-System:
- **job_stats** - Job-Statistiken für alle 16 Jobs
- **mining_data** - Bergmann-Job
- **trees/log_buyers** - Holzfäller-Job
- **electrician_jobs** - Elektriker-Job

### Admin-System:
- **admin_logs** - Admin-Aktivitäten
- **server_stats** - Server-Statistiken
- **achievements** - Achievement-System

### Fraktions-System:
- **faction_ranks** - Fraktionsränge
- **faction_vehicles** - Fraktionsfahrzeuge

## ?? Manuelles Setup

Falls das automatische Setup nicht funktioniert:

### 1. Datenbank erstellen
```sql
CREATE DATABASE rosalife2025 CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci;
```

### 2. SQL-Datei importieren
```bash
mysql -u root -p rosalife2025 < rosalife-2025-database.sql
```

### 3. Admin-Account erstellen
```sql
INSERT INTO accounts (Name, Passwort, EMail, Admin, Level, Bargeld, Bankkonto, Perso, Registerdatum) 
VALUES ('ShadowKev1999', '$2y$10$...', 'admin@rosalife2025.de', 5, 10, 100000, 500000, 1, NOW());
```

## ?? Überprüfung

Nach dem Setup können Sie die erstellten Tabellen überprüfen:

```sql
USE rosalife2025;
SHOW TABLES;
SELECT COUNT(*) as tables_count FROM information_schema.tables WHERE table_schema = 'rosalife2025';
```

## ?? Fehlerbehebung

### Häufige Probleme:

#### 1. "Connection failed"
- Überprüfen Sie MySQL-Zugangsdaten in `database_config.php`
- Stellen Sie sicher, dass MySQL-Server läuft
- Prüfen Sie Firewall-Einstellungen

#### 2. "Access denied for user"
- Stellen Sie sicher, dass der Benutzer CREATE DATABASE Rechte hat
- Überprüfen Sie Benutzername und Passwort

#### 3. "PHP not found"
- Installieren Sie PHP von php.net
- Fügen Sie PHP zum System-PATH hinzu
- Starten Sie CMD neu

#### 4. "SQL file not found"
- Stellen Sie sicher, dass `rosalife-2025-database.sql` im selben Verzeichnis liegt
- Überprüfen Sie Dateiberechtigungen

## ?? Sicherheit

### Wichtige Sicherheitshinweise:

1. **Admin-Passwort ändern**: Ändern Sie das Standard-Passwort `admin123` sofort nach dem ersten Login
2. **Datenbank-Passwort**: Verwenden Sie ein sicheres MySQL-Passwort
3. **File-Berechtigungen**: Schützen Sie die Konfigurationsdateien
4. **Backups**: Erstellen Sie regelmäßig Backups der Datenbank

### Backup erstellen:
```bash
mysqldump -u root -p rosalife2025 > backup_$(date +%Y%m%d).sql
```

## ?? Support

Bei Problemen mit der Datenbank-Einrichtung:

1. Überprüfen Sie die Log-Datei `database_setup.log`
2. Stellen Sie sicher, dass alle Voraussetzungen erfüllt sind
3. Konsultieren Sie die Fehlerbehebung-Sektion

---

**Hinweis**: Dieses Setup ist für Entwicklungsumgebungen optimiert. Für Produktionsumgebungen sollten zusätzliche Sicherheitsmaßnahmen getroffen werden.
