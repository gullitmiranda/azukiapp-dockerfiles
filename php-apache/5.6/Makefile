# `adocker` is alias to `azk docker`
all: php

php:
	adocker build -t azukiapp/php-apache:5.6 .

php-no-cache:
	adocker build --rm --no-cache -t azukiapp/php-apache:5.6 .
