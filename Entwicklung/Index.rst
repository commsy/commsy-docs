Entwicklung
===========

CommSy benötigt für die lokale Entwicklung mindestens einen lokalen LAMP-Stack.

Alternativ kann auch die vorhandene Docker-Konfiguration benutzt werden. Dies bietet den Vorteil, dass keine zusätzliche
Konfiguration der Dienste vorgenommen werden muss. Außerdem wurde die diese so angelegt, dass es möglich ist
variabel ergänzende Container zu starten, die den Entwicklungs-Stack sinnvoll unterstützen.

Installation von Git
--------------------

Die aktuellste Version von Git kann unter https://git-scm.com für alle gängigen Betriebssysteme heruntergeladen werden. Bei der Installation selbst können alle Einstellungen wie vorgeschlagen übernommen werden.

CommSy 9 von GitHub clonen
--------------------------

Du kannst CommSy in ein beliebiges Arbeitsverzeichnis clonen. Für die Arbeit mit Git kann jede beliebige grafische Oberfläche verwendet werden.
Im Folgenden werden aber alle Befehle direkt auf der Konsole ausgeführt, um die Konfiguration möglichst einfach zu halten:

.. code-block:: bash
        :linenos:

        # In das Arbeitsverzeichnis wechseln
        cd [PFAD]

        # CommSy in das Verzeichnis commsy clonen
        git clone https://github.com/commsy/commsy.git commsy

        # In das neu angelegte Verzeichnis wechseln
        cd commsy

        # Git Konfiguration - Line Endings
        git config core.autocrlf input

        # Den Branch 9.0 auschecken
        git checkout 9.0


Umgebung
--------
.. toctree::
        :maxdepth: 1

        Lokal (XAMPP) <XAMPP>
        Docker
        Styling
        Zusätzliche Authentifizierungsquellen <Authentifizierungsquellen>