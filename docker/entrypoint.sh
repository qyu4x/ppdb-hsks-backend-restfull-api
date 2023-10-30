#!/bin/bash

if [ ! -f "vendor/autoload.php" ]; then
    composer install --no-progress --no-interaction
fi

if [ ! -f ".env" ]; then
    echo "Creating env file for env $APP_ENV"
    cp .env.example .env
else
    echo "env file exists."
fi


php /var/www/artisan config:clear
php /var/www/artisan cache:clear
#php /var/www/artisan migrate
php /var/www/artisan optimize
#php /var/www/artisan view:cache

#php-fpm -D
