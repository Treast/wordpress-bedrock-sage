# WordPress - Bedrock + Sage + Docker + Redis
A tool to setup Bedrock WordPress + Sage theme &amp; import Docker configuration in one command line.

## Installation

Execute these commands on your Linux server :
```bash
wget https://raw.githubusercontent.com/Treast/wordpress-bedrock-sage/main/setup.sh
chmod +x ./setup.sh
./setup.sh myproject
```
This script will create :
- a Bedrock installation into `./wordpress-myproject`
- a Sage theme into `./wordpress-myproject/web/app/themes/theme-myproject`
- a Docker build and configuration on `./wordpress-myproject/Dockerfile` & `./wordpress-myproject/docker-compose.yml`

## Configuration
Change the following elements on `./wordpress-myproject/.env` :
- DB_NAME (put what you want)
- DB_USER (put what you want)
- DB_PASSWORD (put what you want)
- DB_PORT (you need to add it, put what you want)
- DB_HOST='db' (to link the Docker MySQL instance)
- WP_HOME='http://localhost:8000' (to link the Docker Apache instance)

## Tools
Docker configuration included :
- Apache server on [http://localhost:8000](http://localhost:8000)
- MySQL server on the port you chose
- PHPMyAdmin on [http://localhost:8001](http://localhost:8001)
- Redis server on port `6379`
