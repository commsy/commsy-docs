# Debugging with Xdebug and PHPStorm

## General
If not build for production, debugging capabilities are already build in.

Use a remote CLI Interpreter in PHPStorm:
Go to Settings -> PHP and click the three dots (...) on the right side of `CLI Interpreter`. Create a new entry `From Docker, ...` with the following parameters:

- Type: Docker Compose
- Server: Docker
- Configuration files: Select compose.yml and compose.override.yml
- Service: php

- Lifecycle: Connect to existing container
- General
    - PHP executable: Click refresh on the right side, it should update the PHP version and debugger information automatically.

Go to Settings -> PHP -> Test Frameworks and add a new configuration with type `Codeception by Remote Interpreter`. Select the docker compose interpreter created above. Unter Codeception library hit refresh on the right side. The Codeception version should be filled automatically.

Go to Settings -> PHP -> Servers and create a new configuration with the following parameters:

- Server
    - Name: commsy
    - Host: localhost
    - Port: 443
    - Debugger: Xdebug
    - Use path mappings: checked
    - Absolute path on the server: /var/www/html

![phpstorm_settings_server](phpstorm_settings_server.png)

Add the `XDEBUG_SESSION=PHPSTORM` query parameter to the URL of the page you want to debug, or use [other available triggers](https://xdebug.org/docs/step_debug#activate_debugger).

Alternatively, you can use [the **Xdebug extension**](https://xdebug.org/docs/step_debug#browser-extensions) for your preferred web browser.

## Debugging the command line

On command line, you need to tell PHPStorm which [path mapping configuration](https://www.jetbrains.com/help/phpstorm/zero-configuration-debugging-cli.html#configure-path-mappings) should be used, set the value of the PHP_IDE_CONFIG environment variable to `serverName=commsy`, where `commsy` is the name of the debug server configured in PHPStorm.

```console
XDEBUG_SESSION=1 PHP_IDE_CONFIG="serverName=commsy" php bin/console ...
```