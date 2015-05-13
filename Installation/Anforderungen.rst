Anforderungen
=============

Für die Installation von CommSy müssen folgende Bedingungen erfüllt sein.

Erforderlich:
-------------
* PHP ab Version 5.3.9 (nicht 5.3.16)
* JSON muss aktiviert sein
* ctype muss aktiviert sein
* In der php.ini muss der korrekte Wert für ``date.timezone`` gesetzt sein
* PDO

Optional:
---------
* PHP-XML Modul
* mindestens Version 2.6.21 der libxml Bibliothek
* PHP tokenizer aktiviert
* mbstring Funktionen aktiviert
* iconv aktiviert
* POSIX aktiviert
* Intl mit ICU 4+ installiert
* APC ab Version 3.0.17 oder ein anderer Opcode Cache
* empfohlene Einstellungen in der php.ini

    * ``short_open_tag = Off``
    * ``magic_quotes_gpc = Off``
    * ``register_globals = Off``
    * ``session.auto_start = Off``