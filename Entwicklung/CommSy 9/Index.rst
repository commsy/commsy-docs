CommSy 9
========

CommSy lässt sich sowohl in einer virtuellen Maschine entwickeln (Vagrant), als auch lokal. Im folgenden wird kurz beschrieben, welche schritte zur Installation notwendig sind.

Unabhängig davon welchen Weg wir wählen, gelten einige Schritte generell.

Installation von Git
--------------------

Die aktuellste Version von Git kann unter https://git-scm.com für alle gängigen Betriebssysteme heruntergeladen werden. Bei der Installation selbst können alle Einstellungen wie vorgeschlagen übernommen werden.

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

        # Git Konfiguration - Line Endings
        git config core.autocrlf input

        # In das neu angelegte Verzeichnis wechseln
        cd commsy9

        # Den Branch 9.0 auschecken
        git checkout 9.0

.. toctree::
    :maxdepth: 1

    VM mit Vagrant <VM>
    Lokal (XAMPP) <XAMPP>