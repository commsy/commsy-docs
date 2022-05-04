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

Event Listener
--------------
Note on how hashtags and tags properties are generated. Setting the property path to false will disable transformation of that value.
In this case the mapping will be created but no value will be populated while indexing. The value is populated by listening to the POST_TRANSFORM event.

This is done in App\EventListener\ElasticCustomPropertyListener.

How the index is populated at runtime
-------------------------------------
Because we still heavily rely on the legacy code, espacially on the database managers, the index is not yet updated with Doctrine events. All major legacy `cs_..._item` classes include an updateElastic() method which mimics this behaviour.

.. code-block:: php
        :linenos:
        
        global $symfonyContainer;
        $objectPersister = $symfonyContainer->get('fos_elastica.object_persister.commsy.user');
        $em = $symfonyContainer->get('doctrine.orm.entity_manager');
        $repository = $em->getRepository('App:User');

        $this->replaceElasticItem($objectPersister, $repository);

Rebuilding the index
--------------------
Rebuilding the index is done from inside the php container using a CLI command. Open a shell inside the container or execute the command directly via compose.

.. code-block:: bash
        :linenos:
        
        docker-compose exec php bin/console fos:elastica:populate