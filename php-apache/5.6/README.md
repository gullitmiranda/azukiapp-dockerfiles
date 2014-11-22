azuki/php-apache
================

Base docker image to run PHP applications on Apache with composer

- Git
- Composer
- PHP Version 5.6.3
- MySQL Client
- PostgreSQL Client
- MongoDB

Building the base image
-----------------------

To create the base image `azukiapp/php-apache:5.6`, execute the following command on the azuki-docker-php folder:

```sh
$ docker build -t azukiapp/php-apache:5.6 .
```

Running your Apache+PHP docker image
------------------------------------

Start your image binding the external ports 80 in all interfaces to your container:

```sh
$ docker run -d -p 80:80 azukiapp/php-apache:5.6
```

Test your deployment:

```sh
$ curl http://localhost/

Hello world!
```

Loading your custom PHP application
-----------------------------------

This image can be used as a base image for your PHP application. Create a new `Dockerfile` in your 
PHP application folder with the following contents:

```sh
$ FROM azukiapp/php-apache:5.6
```

After that, build the new `Dockerfile`:

```sh
$ docker build -t username/my-php-app .
```

And test it:

```sh
$ docker run -d -p 80:80 username/my-php-app
```

Test your deployment:

```sh
$ curl http://localhost/
```


Loading your custom PHP application with composer requirements
--------------------------------------------------------------

Create a Dockerfile like the following:

```go
FROM azukiapp/php-apache:5.6
RUN apt-get update \
    apt-get install -yq php5-pgsql \
    rm -rf /var/lib/apt/lists/*
RUN composer install
```

Replacing `php5-pgsql` with any dependencies that your composer packages might need.
