Upgrade
=======

.. attention::

    Prinzipiell sollte vor jedem Update immer ein komplettes Backup der Datenbanken und Dateien des Webservers angelegt werden!!!

Update ohne Symlink-Struktur
----------------------------
1. Zuerst muss die aktuelle CommSy-Version heruntergeladen und entpackt werden. Wir legen das neue Release neben die aktuelle Version (CommSy-Wurzelverzeichnis).
2. Um alle Uploads aus der aktuellen Installation zu übernehmen, kopieren wir alle Dateien: [alteVersion]/var/\* -> [neueVersion]/var/\*
3. Kopieren der aktuellen Konfigurationsdateien [alteVersion]/etc/cs_config.php -> [neueVersion]/etc/ und [alteVersion]/etc/commsy/\*.php -> [neueVersion]/etc/commsy
4. [Optional] Kopieren von Portal-Themes: [alteVersion]/external_pages/ und [alteVersion]/htdocs/css/external_portal_styles/
5. Dateirechte für den Webbenutzer anpassen, insbesondere Schreibrechte auf var/
6. vHost Konfiguration anpassen, so dass die neue Version benutzt wird
7. Nach dem Austausch der Source-Dateien einloggen und prüfen, ob es auf Konfigurationsebene des Servers neue Updates gibt. Dort müssen alle Update-Skripte ausgeführt werden, um die Datenbank zu aktualisieren.

.. tip::
    
    Mit jedem Release kann es zu Änderungen in den Konfigurationsdateien kommen. Diese varrieren je nach Versionssprung mehr oder weniger stark. Es empfiehlt sich daher die einzelnden Dateien zu vergleichen. Optional kann das Kopieren der Konfiguration auch weggelassen werden, CommSy wird diese dann neu anlegen.

Update mit Symlink-Struktur (siehe :doc:`/Installation/setup`)
--------------------------------------------------------------

Upgrade von CommSy 7 auf CommSy 8
---------------------------------
Bei einem Upgrade von Commsy 7 auf Version 8 sollten die Konfigurationsdateien neu angelegt werden.

Upgrade von CommSy 8 auf CommSy 9
---------------------------------

.. warning::
    
    Vor der Migration auf CommSy 9 muss die derzeitige Installation unbedingt auf den neusten Stand der Versionsreihe 8.x aktualisiert werden!

Änderungen mit CommSy 9
-----------------------

Folgende Funktionen wurden im Zuge der CommSy 9 Entwicklung entfernt oder werden aktuell entfernt und sind nicht mehr Bestandteil von CommSy:

- Der FCKEditor wurde aus dem Portal entfernt
- CAS Authentifizierung wurde entfernt
- Verschiedene veraltete Ausgabemodi wurden entfernt (XML, BLANK, PDA, JSON, page help)