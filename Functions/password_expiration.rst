Automatisches Ablaufen von Passwörtern
======================================
Diese Portalfunktion erlaubt die Konfiguration von erweiterten Passwortrichtlinien für alle Benutzer.

.. attention::
    Diese Funktion steht nur für die lokale Benutzerdatenbank zur Verfügung und unterstützt keine zusätzlichen externen Authentifizierungsquellen.

Konfiguration
-------------
Die Funktion ist aktiviert, wenn ein Wert für die Anzahl der Passwortgültigkeit in Tagen gesetzt ist.

Ablauf des Passworts in Tagen
    Anzahl der Tage, wie lange ein Passwort seine Gültigkeit besitzt.

Meldung vor Ablauf in Tagen (Standart 14 Tage)
    Anzahl der Tage, die der Benutzer vor dem eigentlich Ablaufen des Passworts gesondert informiert wird.

Ablauf
------
1. Beim Aktivieren der Funktion wird für alle aktiven Benutzer ein Ablaufdatum Ihres Passworts gesetzt (Bei jedem Speichern ergibt sich dieser Wert aus dem aktuellen Datum + der gesetzten Ablaufzeit)
2. Per Cron wird der Benutzer über den anstehenden Ablauf des Passworts informiert
3. Zum Zeitpunkt des Ablaufs wird per Cron ein neues zufälliges Passwort gesetzt und der Benutzer abschließend informiert. Dabei hat er die Möglichkeit sein Passwort über die "Passwort vergessen"-Funktion neu zu setzen.