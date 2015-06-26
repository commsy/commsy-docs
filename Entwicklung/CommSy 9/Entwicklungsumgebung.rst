Entwicklungsumgebung einrichten
===============================

Die Version 9 von CommSy wird im Branch 9.0 des Git-Repositories verwaltet. Im Quellcode enthalten ist ebenfalls eine virtuelle Maschine (vagrant), die für die Entwicklung genutzt werden kann. Um diese virtuelle Umgebung zu nutzen, müssen folgende Abhängigkeiten installiert sein:

- Git (https://git-scm.com)
- VirtualBox (https://www.virtualbox.org/)
- Vagrant (https://www.vagrantup.com/)

    - vagrant-bindfs Plugin
    - vagrant-hostmanager Plugin

Installation von Git
--------------------

Die aktuellste Version von Git kann unter https://git-scm.com für alle gängigen Betriebssysteme heruntergeladen werden. Bei der Installation selbst können alle Einstellungen wie vorgeschlagen übernommen werden.

Installation von VirtualBox / Vagrant
-------------------------------------

Zusätzlich zu VirtualBox und Vagrant müssen einige Plugins installiert werden. Unter Windows erfolgt die Installation am besten über die Git Bash (MinGW). Dazu sind folgende Befehle auszuführen:

.. code-block:: bash
        :linenos:

        # vagrant-bindfs Plugin installieren
        vagrant plugin install vagrant-bindfs

        # vagrant-hostmanager Plugin installieren
        vagrant plugin install vagrant-hostmanager

CommSy 9 von GitHub clonen
--------------------------

Zuerst erzeugen wir uns ein zentrales Arbeitsverzeichnis, in das wir CommSy und andere Projekte anlegen können. Für die Arbeit mit Git kann jede beliebige grafische Oberfläche verwendet werden. Im Folgenden werden aber alle Befehle direkt auf der Konsole ausgeführt, um die Konfiguration möglichst einfach zu halten.

Im Terminal oder der Git Bash wechseln wir in das erstellte Arbeitverzeichnis wechseln und führen folgende Befehle aus:

.. code-block:: bash
        :linenos:

        # In das Arbeitsverzeichnis wechseln
        cd [PFAD]

        # CommSy in das Verzeichnis commsy9 clonen
        git clone https://github.com/commsy/commsy.git commsy9

        # In das neu angelegte Verzeichnis wechseln
        cd commsy9

        # Den Branch 9.0 auschecken
        git checkout 9.0

Starten der virtuellen Maschine
-------------------------------

Die virtuellen Maschine lässt sich einfach aus der Konsole heraus starten:

.. code-block:: bash
        :linenos:

        # In das vagrant/ Verzeichnis wechseln
        cd vagrant

        # virtuelle Maschine starten
        vagrant up

.. tip::

    Unter Windows öffnen sich ggf. mehrere Dialogo der Benutzerkontensteuerung, da einige Operationen Administrationsrechte erfordern. Alternativ kann Git Bash als Administrator ausgeführt werden.

Die Installation der virtuellen Maschine nimmt einige Zeit in Anspruch. Zuerst wird ein Image heruntergeladen und in VirtualBox konfiguriert. Nach dem ersten Start der VM wird diese provisioniert, entsprechende Softwarepakete werden heruntergeladen und eingerichtet.

Anmelden an der virtuellen Maschine
-----------------------------------

Mit dem Befehl ``vagrant ssh`` erfolgt die Anmeldung. CommSy befindet sich im Verzeichnis **/var/www/commsy**. Bevor die Installation unter der Domain **commsy.vm** im Browser erreichbar ist müssen noch einige Schritte ausgeführt werden:

.. code-block:: bash
        :linenos:

        # An der virtuellen Maschine anmelden
        vagrant ssh

        # In das commsy-Verzeichnis wechseln
        cd /var/www/commsy

        # Abhängigkeiten installieren
        php composer.phar install

        # Datenbankmigrationen ausführen
        php app/console doctrine:migrations:migrate

        # Elasticsearch Index aufbauen
        fos:elastica:popuplate

.. tip::

    Insbesondere unter Windows scheint es bei vielen Dateiaktionen Probleme mit dem NFS-Mounting zu geben. Wenn es während der Installation der Abhängigkeiten zu Problem oder Fehlerausgaben kommt, hilft es die virtuelle Maschine neu zu starten (alternativ manuell shared-Folder neu mounten):

    .. code-block:: bash
        :linenos:

        # Sitzung auf virtueller Maschine beenden
        exit

        # VM neustarten
        vagrant reload

        # Erneut anmelden
        vagrant ssh

Am Ende erfolgt ein Dialog zur Eingabe einiger Parameter. Nicht aufgeführte Werte können vom Standart übernommen werden.

- Datenbank

    - Host: 127.0.0.1
    - DB: commsy
    - User: commsy
    - Passwort: commsy
    - Port: 3306
- locale: de

Konfiguration von unmigrierten Einstellungen
--------------------------------------------

Derzeit sind noch nicht alle alten CommSy-Konfigurationen übernommen worden und es existiert noch keine Installations-Routine. Daher ist es notwendig insbesondere die Datenbankverbindung für den Legacy-Code zusätzlich zu konfigurieren.

1. Im CommSy-Projekt die Datei legacy/etc/cs_config.php_dist kopieren und in cs_config.php umbenennen
2. In der erzeugten Datei entsprechend Anpassungen vornehmen

Verwalten der Datenbank
-----------------------

Bei der konfiguration der virtuellen Maschine wird auch Adminer installiert, mit dem sich die Datenbank im Browser verwalten lässt und MySQL-Dumps eingespielt werden können. Adminer ist unter der Adresse http://192.168.56.101/adminer/ erreichbar.

Für den Login können die folgenden Daten verwendet werden:

- Server: localhost
- Benutzer: commsy
- Passwort: commsy
- Datenbank: commsy

CommSy im Browser öffnen
------------------------

Auf dem Wirtssystem kann CommSy jetzt über die Adresse http://commsy.vm aufgerufen werden.

Vagrant
-------

Um die virtuelle Maschine wieder zu beenden kann der Befehl ``vagrant halt`` aus dem commsy9/vagrant/-Verzeichnis heraus verwendet werden.