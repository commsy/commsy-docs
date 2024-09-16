# Getting started

## Using docker compose

CommSy development setup is greatly assisted by using docker for bootstrapping. There is also a Makefile that will
simplify the use of common commands. The Makefile uses Docker Compose V2 (docker compose) syntax. So make sure
it is enabled.

```
# Builds the docker images
make build

# Starts containers with debugging functions
make up

# Connect to the php fpm container
make sh
```

Open your browser at https://localhost