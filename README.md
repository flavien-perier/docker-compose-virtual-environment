![license](https://badgen.net/github/license/flavien-perier/docker-compose-virtual-environment)

# Docker Compose Virtual Environment

## Installation

```sh
echo 'DOMAIN=domain.lan
PASSWORD=password
SANDBOX_LOCATION=/home/user/sandbox-files' > .env

docker compose up -d
```

Use Proxy `127.0.0.1:3128`

## Usage

Login to urls:

- [jupyter.domain.lan](https://jupyter.domain.lan/)
- [website.domain.lan](https://website.domain.lan/)

Uses services on ports:

- `53`: DNS
- `3128`: Proxy
- `2201`: SSH Debian
- `2202`: SSH Kali
