---
title: REST
permalink: /docs/rest/
---

## Authentication
The REST-API uses JSON Web Token (JWT) for authentication. This is a JSON-based open standard for creating access
tokens that assert some number of claims.

For signing you need to create a pair of public and private keys. Choose a random passphrase for key generation and
provide it as an environment variable to CommSy as `JWT_PASSPHRASE`.

.. code-block:: sh
        :linenos:
        
        docker-compose exec php openssl genpkey -out config/jwt/private.pem -aes256 -algorithm rsa -pkeyopt rsa_keygen_bits:4096
        docker-compose exec php openssl pkey -in config/jwt/private.pem -out config/jwt/public.pem -pubout

## Obtain the token
You can get a token by sending a POST request to the /api/v2/login_check endpoint

.. code-block:: sh
        :linenos:

        curl -X POST -H "Content-Type: application/json" /api/v2/login_check -d '{"username":"api","password":"secret"}'

There is currently only one user with full privileges called "api". The password *must* be set as an environment variable `API_SECRET`.

## Use the token
The JWT must be passed on each request as an authorization header: `Authorization: Bearer {token}`.

The API endpoint is /api/v2.

## Documentation
A documentation is automatically generated in the OpenAPI format under /api/v2/doc.



This is the development focused part of the API documentation. If you are looking for how to use it, see /API.