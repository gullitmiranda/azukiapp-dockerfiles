azuki/php-apache:5.6
================

Base docker image to run PHP applications on Apache with composer

- Git
- Apache2
- PHP Version 5.6.3
- Composer
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

## License

Dockerfiles distributed under the [Apache License](https://github.com/azukiapp/dockerfiles/blob/master/LICENSE).
