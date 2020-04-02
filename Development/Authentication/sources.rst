Zusätzliche Authentifizierungsquellen
=====================================

Voraussetzungen
---------------
Vor der Verwendung solltest du sicherstellen, dass alle Docker-Container aktuell sind und somit die benötigten PHP-Erweiterungen installiert sind.
**Insbesondere** das Paket php_ldap wird für den entsprechenden Verbindungsaufbau benötigt.

``docker-compose -f docker-compose.yml -f docker-compose.ldap.yml build``

LDAP-Container starten
----------------------
Um den LDAP-Container mitzustarten, muss die Konfiguration explizit beim Starten angegeben werden.

``docker-compose -f docker-compose.yml [-f ...] -f docker-compose.ldap.yml up``

CommSy-Konfiguration
--------------------
- Zusätzliche Authentifizierungsquelle auf dem CommSy-Portal anlegen
- Anbindung
    - Server: commsy_ldap
    - Port: 389
    - UserID (LDAP-Feld): uid
    - UserID (im Pfad): uid
    - Pfadname: DC=example,DC=org
    - Verschlüsselung: Keine
    - Nutzer dürfen Räume erstellen: Ja

Testdaten
---------
Beim Starten des Containers wird automatisch eine Testkonfiguration erzeugt.
Diese umfasst eine Organisation Example Inc., die Domain example.org und einen Benutzer **commsy** mit gleichnamigen Passwort.