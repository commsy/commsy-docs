Alternative Umgebung mit XAMPP
==============================
Alternativ zur virtuellen Maschine mit vagrant, kann CommSy auch rein auf dem lokalen Rechner entwickelt werden. Der Nachteil bei dieser Methode besteht darin, dass die Entwicklungsplattform von der Produktiv-Platform abweicht und automatisch installierte Abhängigkeiten auf der VM nun manuell installiert werden müssen.

XAMPP
-----
In dieser Anleitung werden wir XAMPP verwenden, um Webserver, Datenbank und PHP bereitzustellen. XAMPP kann unter https://www.apachefriends.org heruntergeladen werden.

Bei der Installation sind nicht unbedingt alle Komponentent erforderlich, aber es schadet auch nicht Sie zu haben. Lediglich Bitnami kann getrost ausgelassen werden, da wir CommSy manuell installieren werden.

.. tip::

    XAMPP benötigt Administrationsrechte für einige Funktionen und sollte deshalb unter Windows nicht in die normalen Programmverzeichnisse installiert werden.

Nach der Installation öffnet sich das XAMPP Control Panel. Hier sind einige Einstellungen vorzunehmen. In der Zeile für das Apache-Modul wählen wir Config -> PHP (php.ini) und ändern/überprüfen die folgenden Einträge:

- error_reporting=E_ALL
- date.timezone=Europe/Berlin

Als nächstes konfigurieren wir den virtual Host für Apache. Dazu wählen wir Config -> <Browse> [Apache] und editieren die Datei conf/extra/httpd-vhosts.conf. Am Ende der Datei ist folgendes zu ergänzen, dabei ``[PFAD_ZUM_COMMSY_PROJEKT]`` entsprechend anpassen.

.. code-block:: apache
        :linenos:

        <VirtualHost *:80>
            ServerName commsy.dev
            ServerAlias www.commsy.dev

            # Hier den Pfad zum lokalen CommSy Projekt ohne abschließendem / eintragen
            Define PROJECT_PATH [PFAD_ZUM_COMMSY_PROJEKT]

            DocumentRoot ${PROJECT_PATH}/web
            <Directory ${PROJECT_PATH}/web>
                AllowOverride None
                Require all granted
                Allow from All

                <IfModule mod_rewrite.c>
                    Options -MultiViews
                    RewriteEngine On
                    RewriteCond %{REQUEST_FILENAME} !-f
                    RewriteRule ^(.*)$ app.php [QSA,L]
                </IfModule>
            </Directory>

            # uncomment the following lines if you install assets as symlinks
            # or run into problems when compiling LESS/Sass/CoffeScript assets
            <Directory ${PROJECT_PATH}>
                Options FollowSymlinks
            </Directory>

            ErrorLog logs/commsy_error.log
            CustomLog logs/commsy_access.log combined
        </VirtualHost>

Später benötigen wir php als Befehl auf der Kommandozeile. Dafür muss der Pfad zur Version, die wir mit XAMPP heruntergeladen haben, in die Umgebungsvariablen eingetragen werden. Unter Windows funktioniert dies über Systemsteuerung -> System und Sicherheit -> System -> Erweiterte Systemeinstellungen -> Umgebungsvariablen.

Im unteren Teil unter Systemvariablen suchen wir die Variable ``Path`` und ergänzen diese um ``;C:\xampp\mysql\bin;C:\xampp\php;``, entsprechend des Installationsverzeichnissen von XAMPP. Außerdem prüfen wir, ob ein Eintrag für nodejs vorhanden ist: ``C:\Program Files\nodejs\;``. Die Umgebungsvariablen werden erst geladen, wenn die Eingabeaufforderung neu gestartet wird.

Node.js
-------
Zusätzlich zu XAMPP benötigen wir außerdem Node.js und einige Pakete. Node.js kann von der offiziellen Seite https://nodejs.org heruntergeladen werden. Die Installation selbst kann mit den vorgeschlagenen Einstellungen übernommen werden.

Um die erforderlichen Pakete zu installieren, kann im Terminal / in der Eingabeaufforderung der folgende Befehl verwendet werden.

.. code-block:: bash
        :linenos:

        npm install -g bower less

Alles für CommSy vorbereiten
----------------------------
Als nächstes starten wir Apache und MySQL aus dem XAMPP Control Panel heraus. In der Zeile MySQL öffnen wir mit der Aktion ``Admin`` phpMyAdmin und erzeugen eine neue Datenbank mit dem Namen **commsy** und der Kollation **utf8mb4_general_ci**. An dieser stelle sollte auch ein Dump der Datenbank eingespielt werden. Anschließend navigieren wir im Terminal / der Eingabeaufforderung zum CommSy-Projekt. In der Konsole führen wir folgende Befehle aus:

.. code-block:: bash
        :linenos:

        # Abhängigkeiten installieren
        php composer.phar install

        # Datenbankmigrationen ausführen
        php app/console doctrine:migrations:migrate

        # Elasticsearch Index aufbauen
        php app/console fos:elastica:populate

Am Ende erfolgt ein Dialog zur Eingabe einiger Parameter. Nicht aufgeführte Werte können vom Standart übernommen werden.

- Datenbank

    - Host: 127.0.0.1
    - DB: commsy
    - User: root
    - Passwort: null
    - Port: 3306
- locale: de

Konfiguration von unmigrierten Einstellungen
--------------------------------------------

Derzeit sind noch nicht alle alten CommSy-Konfigurationen übernommen worden und es existiert noch keine Installations-Routine. Daher ist es notwendig insbesondere die Datenbankverbindung für den Legacy-Code zusätzlich zu konfigurieren.

1. Im CommSy-Projekt die Datei legacy/etc/cs_config.php_dist kopieren und in cs_config.php umbenennen
2. In der erzeugten Datei entsprechend Anpassungen vornehmen

Elasticsearch
-------------
Folgt noch...

CommSy im Browser öffnen
------------------------
Im Browser kann CommSy jetzt über die Adresse http://localhost oder http://commsy.dev (wenn man in der host-Datei einen entsprechenden Eintrag gesetzt hat) aufgerufen werden.