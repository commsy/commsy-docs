Mediawiki
=========

Verzeichnis-Struktur auf dem Server
-----------------------------------

.. code-block:: bash
        :linenos:
                                                 
        /var/www/
                |-mediawiki/
                           |-base/
                           |     |-mediawiki (1)
                           |     |-mediawiki_1.25/
                           |     |               |...
                           |     |               |-LocalSettings_base.php (2)
                           |     |               |-LocalSettings.php (3)
                           |     |               |...
                           |     |-LocalSettings.php (4)
                           |
                           /wikis/
                                 |-550282/ (5)
                                         |-LocalSettings.php (6)
                                         |-uploads/ (7)

1) Link auf das aktuelle Installationsverzeichnis, hier: mediawiki_1.25
2) Umbenannte Kopie der ursprünglichen LocalSettings.php.
3) Link zu /var/www/mediawiki/base/LocalSettings.php (Anmerkung: In der mediawiki/base/LocalSettings.php steht eigener Code (siehe unten). Dieser Link existiert nur, um diesen aus dem MediaWiki-Installationsverzeichnis heraus zu halten.)
4) Weiche -> include_once(./mediawiki/LocalSettings.php) oder include_once('/var/www/mediawiki/wikis/<context_id>/LocalSettings.php').
5) Verzeichnis-Name = context_id
6) Konfiguration für das Family-Wiki. Z.B. die Anpassung der Upload-Pfade und der Datenbankanbindung.
7) Upload-Verzeichnis des Family-Wikis. Entspricht dem images-Verzeichnis einer Standard-Installation.

Zu 3: Code in mediawiki/base/LocalSettings.php

.. code-block:: bash
        :linenos:

            <?php        
                $hostServerArray = explode('.', $_SERVER['HTTP_HOST']);
                if (sizeof($hostServerArray) == 3) {
                    include_once('../../wikis/'.$hostServerArray[0].'/LocalSettings.php');
                } else {
                    include_once('mediawiki/LocalSettings_base.php');
                }

nginx vhost-Einstellungen
-------------------------

server-Definition für die Basis-Wiki-Installation (www.mediawiki.vm):

.. code-block:: bash
        :linenos:
        
        server {
          listen                *:80;
          server_name           mediawiki.vm www.mediawiki.vm
          client_max_body_size 1m;
        
          root /var/www/mediawiki/base/mediawiki;
            index  index.html index.htm index.php;
        
          access_log            /var/log/nginx/mediawiki.access.log;
          error_log             /var/log/nginx/mediawiki.error.log;
          
          location / {
            root  /var/www/mediawiki/base/mediawiki;
            try_files $uri /app.php$is_args$args;
             autoindex off;
            index  index.html index.htm index.php;
          }
          
          location ~ \.php(/|$) {
            fastcgi_index index.php;
            fastcgi_split_path_info ^(.+\.php)(/.*)$;
            include /etc/nginx/fastcgi_params;
            fastcgi_pass 127.0.0.1:9000;
            fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
            fastcgi_param HTTPS off;
          }
          
          sendfile off;
        }
        
server-Definition für die Wiki-Family-Installationen (<context_id>.mediawiki.vm):

.. code-block:: bash
        :linenos:
        
        server {
          listen                *:80;
        
          server_name ~^(?<contextid>.+)\.mediawiki\.vm;
          client_max_body_size 1m;
        
          root /var/www/mediawiki/base/mediawiki;
            index  index.html index.htm index.php;
        
          access_log            /var/log/nginx/mediawiki.access.log;
          error_log             /var/log/nginx/mediawiki.error.log;
        
          location / {
            root  /var/www/mediawiki/base/mediawiki;
            try_files $uri /app.php$is_args$args;
             autoindex off;
            index  index.html index.htm index.php;
          }
        
          location ~ \.php(/|$) {
            fastcgi_index index.php;
            fastcgi_split_path_info ^(.+\.php)(/.*)$;
            include /etc/nginx/fastcgi_params;
            fastcgi_pass 127.0.0.1:9000;
        
            fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
            fastcgi_param HTTPS off;
          }
        
          location /uploads/ {
            root  /var/www/mediawiki/wikis/$contextid;
          }
        
          sendfile off;
        }

Anpassungen LocalSettings.php für ein Family-Wiki
-------------------------------------------------

.. code-block:: bash
        :linenos:
        
            $wgSitename = "<context_id>";
            
            $wgServer = "http://<context_id>.mediawiki.vm";
            
            $wgDBtype = "mysql";
            $wgDBserver = "...";
            $wgDBname = "mediawiki_<context_id>";
            $wgDBuser = "...";
            $wgDBpassword = "...";
            
            $wgUploadDirectory = "/var/www/mediawiki/wikis/<context_id>/uploads";
            
            $wgUploadPath = "/uploads";

Mediawiki CommSy-Plugin
-----------------------

...