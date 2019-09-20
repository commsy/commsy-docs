Tests
=====

In CommSy werden automatische Tests mit Codecept ausgeführt, einer Testsuite für PHP. Diese umfasst under anderem Unit-, Acceptance- und Functional- Tests.

Tests ausführen
---------------
Tests verwenden in einer dedizierte Datenbank und einem gesonderten Nginx-Dienst ausgeführt. Außerdem werden Browsertests über Selenium ausgeführt. Um die entsprechenden Container in der Entwicklungs zusätzlich zu starten muss die entsprechende docker-compose file zusätzlich geladen werden:

.. code-block:: bash
        :linenos:
        
        docker-compose -f docker-compose.yml -f docker/docker-compose.testsuite.yml up

Tests können dann aus dem php-Container heraus ausgeführt werden:

.. code-block:: bash
        :linenos:
        
        # Auf dem PHP-Container anmelden
        docker exec -it commsy_php_1 bash

        # Auf dem PHP-Container in /var/www/html
        vendor/bin/codecept run