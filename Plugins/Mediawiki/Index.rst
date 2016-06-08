Mediawiki
=========

Verzeichnis-Struktur auf dem Server
-----------------------------------

.. code-block:: bash
        :linenos:
        
        /var/www/
                |-mediawiki_base/
                |               |-mediawiki/
                |               |          |...
                |               |          |-LocalSettings_base.php (1)
                |               |          |-LocalSettings.php (2)
                |               |          |...
                |               |-LocalSettings.php (3)
                |
                |-mediawiki_wikis/
                                 |-550282/ (4)
                                         |-LocalSettings.php (5)
                                         |-uploads/ (6)

1) Umbenannte Kopie der ursprünglichen LocalSettings.php.
2) Link zu /var/www/mediawiki_base/LocalSettings.php (Anmerkung: In der mediawiki_base/LocalSettings.php steht eigener Code. Dieser Link existiert nur, um diesen aus dem MediaWiki-Installationsverzeichnis heraus zu halten.)
3) Weiche -> include_once(./mediawiki/LocalSettings.php) oder include_once('/var/www/mediawiki_wikis/<context_id>/LocalSettings.php').
4) Verzeichnis-Name = context_id
5) Konfiguration für das Family-Wiki. Z.B. die Anpassung der Upload-Pfade und der Datenbankanbindung.
6) Upload-Verzeichnis des Family-Wikis. Entspricht dem images-Verzeichnis einer Standard-Installation.

nginx vhost-Einstellungen
-------------------------

server-Definition für die Basis-Wiki-Installation (www.mediawiki.vm):

.. code-block:: bash
        :linenos:
        
        server {
          listen                *:80;
          server_name           mediawiki.vm www.mediawiki.vm
          client_max_body_size 1m;
        
          root /var/www/mediawiki_base/mediawiki;
            index  index.html index.htm index.php;
        
          access_log            /var/log/nginx/mediawiki.access.log;
          error_log             /var/log/nginx/mediawiki.error.log;
          
          location / {
            root  /var/www/mediawiki_base/mediawiki;
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
        
          root /var/www/mediawiki_base/mediawiki;
            index  index.html index.htm index.php;
        
          access_log            /var/log/nginx/mediawiki.access.log;
          error_log             /var/log/nginx/mediawiki.error.log;
        
          location / {
            root  /var/www/mediawiki_base/mediawiki;
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
            root  /var/www/mediawiki_wikis/$contextid;
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
            
            $wgUploadDirectory = "/var/www/mediawiki_wikis/<context_id>/uploads";
            
            $wgUploadPath = "/uploads";

Mediawiki CommSy-Plugin
-----------------------

...