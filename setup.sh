#!/bin/bash

FOLDER_BEDROCK="wordpress-$1"
FOLDER_THEME="theme-$1"
THEME_NAME="${1^}"

# Install Bedrock architecture
composer create-project roots/bedrock $FOLDER_BEDROCK

# Install Sage theme
cd "./$FOLDER_BEDROCK/web/app/themes"
composer create-project roots/sage $FOLDER_THEME

cd ../../../

# Add Docker configuration files
wget https://gist.githubusercontent.com/Treast/cfebc89ce361f988fd45fe91d8d618b0/raw/Dockerfile
wget https://gist.githubusercontent.com/Treast/cfebc89ce361f988fd45fe91d8d618b0/raw/docker-compose.yml

# Add .htaccess
cd ./web
wget https://gist.githubusercontent.com/Treast/cfebc89ce361f988fd45fe91d8d618b0/raw/.htaccess

# Change configuration
cd ../../
CONFIG_MATCH="Config::define('DISALLOW_INDEXING', true);"
CONFIG_INSERT="Config::define('FS_METHOD', 'direct');\n\n\/\/ Redis configuration\nConfig::define('WP_REDIS_HOST', 'redis');\nConfig::define('WP_REDIS_PORT', 6379);\nConfig::define('WP_REDIS_TIMEOUT', 1);\nConfig::define('WP_REDIS_READ_TIMEOUT', 1);\nConfig::define('WP_REDIS_DATABASE', 0);"

sed -i -e "s/$CONFIG_MATCH/$CONFIG_MATCH\n$CONFIG_INSERT/" "./$FOLDER_BEDROCK/config/environments/development.php"

# Fix permission
sudo chown treast:www-data -R "./$FOLDER_BEDROCK"
sudo chmod 775 -R "./$FOLDER_BEDROCK"
sudo chmod 777 -R "./$FOLDER_BEDROCK/web/app/uploads"
