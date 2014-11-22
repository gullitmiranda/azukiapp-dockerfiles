azuki/php
================

Base docker image to run PHP applications on Apache


Building the base image
-----------------------

To create the base image `azukiapp/php-apache:5.5`, execute the following command on the azuki-docker-php folder:

  docker build -t azukiapp/php-apache:5.5 .


Running your Apache+PHP docker image
------------------------------------

Start your image binding the external ports 80 in all interfaces to your container:

  docker run -d -p 80:80 azukiapp/php-apache:5.5

Test your deployment:

  curl http://localhost/

Hello world!


Loading your custom PHP application
-----------------------------------

This image can be used as a base image for your PHP application. Create a new `Dockerfile` in your 
PHP application folder with the following contents:

  FROM azukiapp/php-apache:5.5

After that, build the new `Dockerfile`:

  docker build -t username/my-php-app .

And test it:

  docker run -d -p 80:80 username/my-php-app

Test your deployment:

  curl http://localhost/

That's it!


Loading your custom PHP application with composer requirements
--------------------------------------------------------------

Create a Dockerfile like the following:

  FROM azukiapp/php-apache:5.5
  RUN apt-get update \
      apt-get install -yq php5-pgsql \
      rm -rf /var/lib/apt/lists/*
  RUN composer install

Replacing `php5-pgsql` with any dependencies that your composer packages might need.


