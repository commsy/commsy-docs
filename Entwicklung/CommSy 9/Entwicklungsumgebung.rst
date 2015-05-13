Entwicklungsumgebung
====================

Die Version 9 von CommSy wird im Branch 9.0 des Git-Repositories verwaltet. Im Quellcode enthalten ist ebenfalls eine virtuelle Maschine (vagrant), die für die Entwicklung genutzt werden kann. Um diese virtuelle Umgebung zu nutzen, müssen folgende Abhängigkeiten installiert sein:

- VirtualBox (https://www.virtualbox.org/)
- Vagrant (https://www.vagrantup.com/)
    - vagrant-bindfs Plugin (OSX / Linux)
    - vagrant-hostmanager Plugin (OSX / Linux)

.. tip::

    Die Konfiguration der virtuellen Umgebung wurde mit PuPHPet (https://puphpet.com) generiert und nutzt für die Einbindung der CommSy-Sources vom Wirtssystem NFS. Für eine Nutzung unter Windows ist es daher erforderlich die Konfiguration anzupassen und manuell die lokale hosts Datei zu ergänzen.

Zum Starten der virtuellen Umgebung genügt es in der Eingabeaufforderung / im Terminal im Verzeichnis **/vagrant** den Befehl ``vagrant up`` auszuführen. Das initiale Installieren und Konfigurieren nimmt einige Zeit in anspruch, ist aber nur beim ersten Start erforderlich.

Nach erfolgreicher Konfiguration ist die virtuelle Maschine erreicbar. Mit dem Befehl ``vagrant ssh`` erfolgt die Anmeldung. CommSy befindet sich im Verzeichnis **/var/www/commsy**. Bevor die Installation unter der Domain **commsy.vm** im Browser erreichbar ist, müssen noch die PHP-Abhängigkeit via Composer installiert werden:

.. code-block:: bash
        :linenos:

        cd /var/www/commsy
        composer install

Am Ende der Installation erfolgt ein Dialog zur Eingabe einiger Parameter:

- Datenbank
    - Host: 127.0.0.1
    - DB: commsy
    - User: commsy
    - Passwort: commsy
    - Port: 3306
- locale: de