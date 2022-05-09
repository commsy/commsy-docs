---
title: Setup
sidebar: commsy_dev_sidebar
permalink: commsy_dev_installation_setup.html
---

Für die Einrichtung von CommSy empfiehlt es sich ein bestimmes Verzeichnisschema zu verwenden. Dadurch werden spätere Upgradeprozesse einfacher und Wartungsfenster minimiert.

Dazu legen wir im entsprechenden vHost-Verzeichnis des Webservers folgende Struktur an und installieren CommSy entsprechend.

- releases/
- releases/commsy-x.y.z
- shared/

.. code-block:: bash
    :linenos:

    cd [PATH_TO_VHOST]

    # Verzeichnisse anlegen
    mkdir releases
    mkdir shared

    # CommSy Release herunterladen und entpacken (hier 8.3.0)
    cd releases
    wget https://github.com/commsy/commsy/releases/download/8.3.0/commsy-8.3.0.tar.gz
    tar xfvz commsy-8.3.0.tar.gz
    rm commsy-8.3.0.tar.gz

    # Symlink auf aktuelle Version setzen
    ln -s commsy-8.3.0/ current

    # shared-Files auslagern
    cd current
    mv var ../../shared/
    ln -s ../../shared/var/

    # Verzeichnisrechte anpassen
    chown -R www-data:www-data ./*
    chmod -R 750 ./*