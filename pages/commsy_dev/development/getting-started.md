---
title: Getting started
sidebar: commsy_dev_sidebar
permalink: commsy_dev_development_getting_started.html
---

# Using docker compose

CommSy development setup is greatly assisted by using docker for bootstrapping. There is also a Makefile that will
simplify the use of common commands. The Makefile uses Docker Compose V2 (docker compose) syntax. So make sure
it is enabled.

```
# Builds the docker images
make build

# Builds the docker images (debug)
make build-debug

# Starts containers with debugging functions
make debug

# Connect to the php fpm container
make sh
```

## Debugging with Xdebug and PHPStorm

Use `make debug` to start with xdebug capabilities. 

Create a PHP Remote Debug configuration with the following parameters:

- Server
  - Name: commsy
  - Host: _
  - Port: 80
  - Debugger: Xdebug
  - Absolute path on the server: /var/www/html

If necessary you can add this query parameter on your request: `XDEBUG_SESSION=PHPSTORM`.