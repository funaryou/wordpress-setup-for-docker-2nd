#!/bin/bash
set -e

# wordpressディレクトリが空ならWordPress本体をコピー
if [ -z "$(ls -A /var/www/html)" ]; then
  cp -a /usr/src/wordpress/. /var/www/html/
  chown -R www-data:www-data /var/www/html
fi

exec docker-entrypoint.sh apache2-foreground