[azukiapp/php-apache](https://registry.hub.docker.com/u/azukiapp/php-apache/)
================

Base docker image to run PHP applications on Apache with composer

- Git
- Apache2
- PHP Version 5.6.3
- Composer
- MySQL Client
- PostgreSQL Client
- MongoDB

##azk
Example of using that image with the [azk](http://azk.io):

```
/**
 * Documentation: http://docs.azk.io/Azkfile.js
 */

// Adds the systems that shape your system
systems({
  phpSample: {
    // Dependent systems
    depends: [], // postgres, mysql, mongodb ...
    // More images:  http://images.azk.io
    image: "azukiapp/php-apache:5.6",
    workdir: "/azk/#{manifest.dir}",
    shell: "/bin/bash",
    wait: {"retry": 20, "timeout": 1000},
    mounts: {
      '/azk/#{manifest.dir}': path("."),
    },
    scalable: {"default": 2},
    http: {
      // phpSample.azk.dev
      domains: [ "#{system.name}.#{azk.default_domain}" ]
    },
    ports: {
      // exports global variables
      http: "80/tcp",
    },
    envs: {
      // set instances variables
      // EXAMPLE: "value",
    },
    docker_extra: {
      // extra docker options
      start: {
        Privileged: "true",
      },
    },
  },
});

```

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
