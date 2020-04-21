# Docker compose virtual environment

## Installation

```sh
mkdir documents

touch .env
echo "PASSWORD=password" >> .env
echo "SANDBOX_LOCATION=/home/user/sandbox-files" >> .env

docker compose up -d
```

Use DNS `127.0.0.1:53`

## Usage

Login to the urls:

- [jupyter.local](jupyter.local)
- [vscode.local](vscode.local)
- [openrefine.local](openrefine.local)
- [mongo.local](mongo.local)
- [neo4j.local](neo4j.local)
- [pgadmin.local](pgadmin.local)
- [phpmyadmin.local](phpmyadmin.local)
- [php.local](php.local)

Uses services on ports:

- `53`: DNS
- `2201`: SSH Debian
- `2202`: SSH Kali
- `8080`: Debian service
- `5432`: PostgreSQL
- `3306`: MariaDB
- `22017`: MongoDB
- `7687`: Neo4j
- `6379`: Redis
- `9092`: Kafka
