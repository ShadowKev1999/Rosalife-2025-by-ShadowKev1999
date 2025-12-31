# Rosalife-2025 by ShadowKev1999

Ein deutscher SA-MP Server basierend auf Open.MP mit umfangreichen Funktionen und Befehlen.

## Server Informationen

- **Plattform**: Open.MP
- **Sprache**: Deutsch/German
- **Max. Spieler**: 100
- **Port**: 7777
- **Status**: In Entwicklung (keine aktiven Updates, Updates geplant für 2026)

## Inhaltsverzeichnis

1. [Allgemeine Befehle](#allgemeine-befehle)
2. [Admin Befehle](#admin-befehle)
3. [Fraktions Befehle](#fraktions-befehle)
4. [Fahrzeug Befehle](#fahrzeug-befehle)
5. [Job Befehle](#job-befehle)
6. [Haus & Geschäft Befehle](#haus--geschäft-befehle)
7. [Sonstige Befehle](#sonstige-befehle)

---

## Allgemeine Befehle

### Spieler Informationen
- `/help` oder `/hilfe` - Zeigt die Hilfeübersicht
- `/stats` - Zeigt deine Statistiken
- `/admins` - Zeigt alle Online Admins
- `/afklist` - Zeigt alle AFK Spieler
- `/missionen` - Zeigt verfügbare Missionen
- `/startbonus` - Holt dir den Startbonus (Level 1-2)
- `/knastzeit` - Zeigt deine verbleibende Knastzeit
- `/prisonzeit` - Zeigt deine verbleibende Prisonzeit

### Navigation & Transport
- `/navi` oder `/gps` - Öffnet das Navigationsmenü
- `/stadtplan` - Öffnet den Stadtplan
- `/roller` - Mietet einen Roller (max. Level 6)
- `/delroller` - Löscht deinen gemieteten Roller
- `/spawnchange` - Ändert deinen Spawn-Punkt

### Lizenzen & Dokumente
- `/fahrschule` - Öffnet die Fahrschule
- `/lizenzen` oder `/licenses` oder `/scheine` - Zeigt deine Lizenzen
- `/waffenschein` - Beantragt einen Waffenschein
- `/fahrzeugschein` - Zeigt den Fahrzeugschein des aktuellen Fahrzeugs
- `/showperso` - Zeigt deinen Personalausweis

### Interaktion
- `/afk` - Setzt dich auf AFK
- `/back` - Meldet dich von AFK zurück
- `/knacken` - Versucht Handschellen zu knacken
- `/delcp` - Löscht alle Checkpoints

### Fahrzeuge
- `/carsell` - Verkauft dein Fahrzeug
- `/freikaufen` - Kauft ein Fahrzeug frei

---

## Admin Befehle

### Moderator (Level 2+)
- `/warn [player] [grund]` - Verwarnt einen Spieler
- `/prison [player] [zeit] [grund]` - Sperrt einen Spieler ins Prison
- `/prisoncp [player] [anzahl] [grund]` - Gibt Prison-CPoints
- `/ban [player] [grund]` - Banned einen Spieler
- `/tban [player] [minuten] [grund]` - Temporärer Ban
- `/untimeban [name]` - Entfernt einen Timeban
- `/kick [player] [grund]` - Kicked einen Spieler
- `/givemoney [player] [betrag]` - Gibt einem Spieler Geld
- `/giveexp [player] [anzahl]` - Gibt einem Spieler EXP
- `/givepayday [player]` - Gibt einem Spieler PayDay
- `/giveall` - Geschenk an alle Spieler

### Fahrzeug Administration
- `/veh [model] [farbe1] [farbe2]` - Erstellt ein Fahrzeug
- `/respawncar [vehid]` - Respawnt ein Fahrzeug
- `/getcar [vehid]` - Holt ein Fahrzeug zu dir
- `/gotocar [vehid]` - Teleportiert dich zu einem Fahrzeug
- `/carrespawn` oder `/cr` - Respawnt alle Fahrzeuge
- `/refill` - Füllt alle Fahrzeuge auf
- `/fixveh` oder `/fixcar` - Repariert dein Fahrzeug
- `/carcontrol` - Fahrzeugkontrollmenü

### Server Administration
- `/gotopos [x] [y] [z]` - Teleportiert zu Koordinaten
- `/wetter` - Ändert das Wetter
- `/lottogewinn [betrag]` - Setzt Lottogewinn
- `/adminachiv [player] [beschreibung] [exp]` - Gibt Achievement
- `/defektliste` - Zeigt Defekte (Bankautomaten, Blitzer)
- `/areparieren` - Repariert einzelne Defekte
- `/areparierenall` - Repariert alle Defekte
- `/atankefill` - Füllt alle Tankstellen

### Spieler Management
- `/awiederbeleben [player]` - Belebt einen Spieler wieder
- `/lic [player] [lizenz]` - Gibt/Löscht Lizenzen
- `/getcarinfo [carid]` - Zeigt Fahrzeuginfo
- `/checkip [player]` - Überprüft IP eines Spielers

---

## Fraktions Befehle

### Polizei / FBI (Fraktion 2 & 6)
- `/suspect` oder `/su [player] [grund]` - Verhängt Wanteds
- `/clear [player]` - Löscht Wanteds
- `/hs [player]` - Zeigt Wanteds eines Spielers
- `/cuff [player]` - Fesselt einen Spieler
- `/uncuff [player]` - Entfesselt einen Spieler
- `/grab [player]` - Nimmt einen Spieler fest
- `/arrest [player] [zeit]` - Sperrt einen Spieler ein
- `/unarrest [player] [zeit]` - Lässt einen Spieler frei
- `/afkarrest [player] [zeit]` - AFK Arrest
- `/wanteds` oder `/gesuchte` - Zeigt gesuchte Spieler
- `/showammu [player]` - Durchsucht nach Munition
- `/showstore [player]` - Durchsucht nach Drogen
- `/unmask [player]` - Entmaskiert einen Spieler
- `/showmarke [player]` - Zeigt Kennzeichen
- `/knastinfo` - Zeigt Knastinformationen

### Polizei Ausrüstung
- `/cop` - Öffnet Polizeiausrüstung
- `/copbrille` - Setzt Polizei Sonnenbrille
- `/tcop` - Zieht Polizeiuniform an
- `/copman` - Setzt Polizeimantel
- `/copfrau` - Setzt Frauenuniform
- `/copcap` - Setzte Polizeikappe
- `/cophut` - Setzte Polizeihut
- `/copmuetze` - Setzte Polizeimütze
- `/copcapf` - Setzte Frauenkappe
- `/pcopcap` - Setzte Polizeikappe (Frau)
- `/pschild` - Setzte Polizeischild
- `/rank` - Setzte Rangabzeichen
- `/rankfrau` - Setzte Rangabzeichen (Frau)
- `/pdskin` - Ändert Polizeiskin
- `/swatduty` - SWAT Dienst

### Spezielle Funktionen
- `/beisatz` - Ruft Beisatz (nur im Helikopter)
- `/mautstationen` - Zeigt Mautstationen
- `/mautkontrolle` - Mautkontrolle

### Allgemeine Fraktionsbefehle
- `/fduty` - Fraktionsdienst
- `/fchat` - Fraktionschat
- `/fmembers` - Zeigt Fraktionsmitglieder
- `/fquit` - Fraktion kündigen
- `/fveh` - Fraktionsfahrzeug
- `/fbase` - Fraktionsbasis

---

## Fahrzeug Befehle

### Fahrzeug Steuerung
- `/lock` - Schließt/Aufschließt Fahrzeug
- `/motor` - Motor an/aus
- `/licht` - Licht an/aus
- `/fenster` - Fenstersteuerung
- `/fahrzeug` - Fahrzeugmenü
- `/carradio` - Autoradio
- `/neonschalter` - Neonlichter an/aus

### Fahrzeug Schlüssel
- `/givecarkey [player]` - Gibt Fahrzeugschlüssel
- `/takecarkey [player]` - Nimmt Fahrzeugschlüssel
- `/throwcarkey` - Wirft Zweitschlüssel weg

### Sirenen (nur Fraktionen)
- `/sirene` - Sirene an/aus
- `/usirene` - Unterbrechungssirene
- `/sirenehupe` - Sirenenglocke

---

## Job Befehle

### Allgemeine Job Befehle
- `/jobliste` - Zeigt verfügbare Jobs
- `/startjob` - Startet deinen Job
- `/beenden` - Beendet den aktuellen Job
- `/jobstats` - Zeigt Jobstatistiken
- `/jobbase` - Teleport zur Jobbasis
- `/kuendigen` - Kündigt den Job
- `/jc` - Job Chat

### Trucker (Job 1)
- `/truck` - Trucker Menü

### Pizzabote (Job 2)
- `/pizza` - Nimmt Pizza auf
- `/ausliefern` - Liefert Pizza aus
- `/reinlegen` - Legt Pizza in Kofferraum

### Busfahrer (Job 5)
- `/bus` - Startet Busroute

### Müllmann (Job 6)
- `/muell` - Müllabfuhr starten

### Landwirt (Job 7)
- `/aufsammeln` - Heuballen einsammeln

### Elektriker (Job 11)
- `/werkzeug` - Holt Werkzeug
- `/auftragsliste` - Zeigt Aufträge
- `/reparieren` - Repariert Defekte

### Fischer (Job 12)
- `/angeln` - Beginnt zu angeln
- `/stopangeln` - Hört auf zu angeln
- `/sellfish` - Verkauft Fische

### Bergmann (Job 13)
- `/mineveh` - Minenfahrzeug
- `/mineinfo` - Mine Informationen
- `/ore` - Erz Befehle

### Holzfäller (Job 14)
- `/chainsaw` - Kettensäge holen
- `/log` - Holz Befehle
- `/createtree` - Baum erstellen (Admin)
- `/edittree` - Baum bearbeiten (Admin)
- `/removetree` - Baum entfernen (Admin)

### Orangenpflücker (Job 15)
- `/pfluecken` - Orangen pflücken
- `/orangenverkaufen` - Orangen verkaufen

### Güterzugfahrer (Job 16)
- `/gueter` - Güterzug starten

---

## Haus & Geschäft Befehle

### Haus System
- `/house` - Hausmenü
- `/hbuy` - Haus kaufen
- `/hsell` - Haus verkaufen
- `/hlock` - Haus abschließen
- `/henter` - Haus betreten
- `/hexit` - Haus verlassen
- `/hstorage` - Hauslager
- `/hupgrade` - Hausupgrade

### Geschäft System
- `/biz` - Geschäftsmenü
- `/bbuy` - Geschäft kaufen
- `/bsell` - Geschäft verkaufen
- `/benter` - Geschäft betreten
- `/bexit` - Geschäft verlassen
- `/bproducts` - Produkte kaufen
- `/bstorage` - Geschäftslager

### Garage System
- `/garage` - Garagenmenü
- `/gbuy` - Garage kaufen
- `/gsell` - Garage verkaufen

### Gruppen System
- `/group` - Gruppenmenü
- `/gcreate` - Gruppe erstellen
- `/ginvite` - Spieler einladen
- `/gkick` - Spieler kicken
- `/gquit` - Gruppe verlassen
- `/gchat` - Gruppenchat
- `/gdeposit` - Geld einzahlen
- `/gwithdraw` - Geld abheben

---

## Sonstige Befehle

### Handy System
- `/handy` - Handymenü
- `/anrufen [nummer]` - Jemanden anrufen
- `/sms [nummer] [nachricht]` - SMS senden
- `/kontakte` - Kontaktliste
- `/handystatus` - Handystatus

### Animationen
- `/anim` - Animationsmenü
- `/sitzen` - Hinsetzen
- `/liegen` - Hinlegen
- `/winken` - Winken
- `/tanzen` - Tanzen

### VIP Befehle
- `/vip` - VIP Menü
- `/vcolor` - Fahrzeugfarbe ändern
- `/vrepair` - Fahrzeug reparieren
- `/vteleport` - Fahrzeug teleportieren

### Support Befehle
- `/support` - Support anfragen
- `/report [player] [grund]` - Spieler melden
- `/frage [text]` - Frage stellen

### Event Befehle
- `/event` - Eventmenü
- `/race` - Rennen starten
- `/derby` - Derby starten
- `/deathmatch` - Deathmatch starten

### Wirtschaft System
- `/atm` - Geldautomat
- `/bank` - Bankmenü
- `/überweisen [player] [betrag]` - Geld überweisen
- `/einzahlen [betrag]` - Geld einzahlen
- `/auszahlen [betrag]` - Geld auszahlen

### Item System
- `/items` - Itemmenü
- `/itemuse` - Item benutzen
- `/itemgive [player] [item] [anzahl]` - Item geben
- `/itemdrop [item] [anzahl]` - Item fallenlassen

---

## Server Features

### Roleplay System
- Komplettes Roleplay-System
- Fraktionen (Polizei, FBI, Sanitäter, etc.)
- Job-System mit verschiedenen Berufen
- Haus- und Geschäftssystem
- Fahrzeugsystem mit Tuning

### Wirtschaft
- Bankensystem mit Überweisungen
- Job-System zum Geld verdienen
- Handelssystem mit Items
- Immobilienmarkt

### Kommunikation
- Handysystem mit Anrufen und SMS
- Fraktionschat
- Gruppenchat
- Support-System

### Events & Aktivitäten
- Rennen
- Derby
- Deathmatch
- Missionen

---

## Installation

1. Lade die neueste Version von Open.MP herunter
2. Kopiere alle Dateien in dein Server-Verzeichnis
3. Konfiguriere die `config.json` nach deinen Wünschen
4. Importiere die `rosalife-reloaded.sql` in deine Datenbank
5. Starte den Server mit `omp-server.exe`

---

## Hinweise

- Der Server befindet sich noch in Entwicklung
- Es können noch Fehler vorhanden sein
- Aktive Updates sind derzeit nicht geplant
- Updates sind für 2026 geplant

---

## Kontakt & Support

Bei Fragen oder Problemen kannst du dich an das Support-Team auf dem Server wenden.

---

*Diese Dokumentation wurde automatisch erstellt und enthält alle verfügbaren Befehle und Funktionen des Rosalife-2025 Servers.*



