#!/usr/bin/env bash

/etc/init.d/php7.3-fpm start
nginx -g "daemon off;"
