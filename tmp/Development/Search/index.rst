Search
======

CommSy uses ElasticSearch for advanced search functionality. Due to file index and mapping limitations we are currently limited to ElasticSearch version 5.x.

Bundles and Libraries
---------------------
- friendsofsymfony/elastica-bundle

Docker
------
To start an ElasticSearch instance with the mapper-attachment plugin along your usual docker stack, use the following compose files:

.. code-block:: bash
        :linenos:
        
        docker-compose -f docker-compose.yml -f docker/docker-compose.elastic.yml up

Configuration
-------------
The main configuration file (including the mapping types, analyzer and filter configuration) is config/packages/fos_elastica.yaml.

Rebuilding the index
--------------------
Rebuilding the index is done from inside the php container using a CLI command. Open a shell inside the container or execute the command directly via compose.

.. code-block:: bash
        :linenos:
        
        docker-compose exec php bin/console fos:elastica:populate