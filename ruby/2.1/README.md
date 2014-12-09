azuki/ruby:2.1
================

Base docker image to run Ruby applications

- Git
- Ruby 2.1.2
- RubyGems 2.3.0
- Bundler
- MySQL Client
- PostgreSQL Client
- MongoDB
- ImageMagick

Building the base image
-----------------------

To create the base image `azukiapp/ruby:2.1`, execute the following command on the `ruby/2.1` folder:

```sh
$ docker build -t azukiapp/azukiapp/ruby:2.1 .
```

Running your Ruby docker image
------------------------------------

Start your image binding the external ports 3000 in all interfaces to your container:

```sh
$ docker run -d -p 3000:3000 azukiapp/ruby:2.1
```

Test your deployment:

```sh
$ curl http://localhost:3000/

Hello world!
```
