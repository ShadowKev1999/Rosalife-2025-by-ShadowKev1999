1.  **Datenbank-Funktionen anpassen (`functions.pwn`)**:
    *   Ich werde die SQL-Abfragen in `CreateObjectEx`, `SetObjectMaterialEx` und `SetObjectMaterialTextEx` deaktivieren (auskommentieren). Das verhindert:
        *   Das doppelte Einfügen von Objekten in die Datenbank bei jedem Serverstart (Spam/Duplikate).
        *   Die SQL-Fehler (Unknown column 'MaterialText0', invalid ID), da die Skripte teilweise nicht-Datenbank-Objekte aktualisieren wollen.
    *   Ich werde trotzdem die `createObjectTable` Funktion korrigieren, um die fehlenden Spalten `MaterialText0` und `MaterialText1` hinzuzufügen, falls die Tabelle doch mal genutzt wird.

2.  **Stadthalle Interior aktivieren (`_mappings.pwn`)**:
    *   Ich werde die auskommentierten Zeilen für `cityhall_int_risq.pwn` in `gamemodes/mappings/_mappings.pwn` aktivieren. Damit werden die fehlenden Boden-Objekte geladen und man fällt nicht mehr durch.

3.  **Server neu starten**:
    *   Kompilieren und Server neustarten, damit die Änderungen wirksam werden.