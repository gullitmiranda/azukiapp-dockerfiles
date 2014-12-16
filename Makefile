# `adocker` is alias to `azk docker`
all:
	# base
	adocker build -t azukiapp/ubuntu         ./base/ubuntu
	adocker build -t azukiapp/web-based      ./base/web

	# latest
	adocker build -t azukiapp/node           ./node/0.10
	adocker build -t azukiapp/php-apache     ./php-apache/5.6
	adocker build -t azukiapp/ruby           ./ruby/2.1

	# version tagged
	adocker build -t azukiapp/php-apache:5.5 ./php-apache/5.5
	adocker build -t azukiapp/php-apache:5.6 ./php-apache/5.6
	adocker build -t azukiapp/ruby:1.9       ./ruby/1.9
	adocker build -t azukiapp/ruby:2.1       ./ruby/2.1

--no-cache:
	# base
	adocker build --rm --no-cache -t azukiapp/ubuntu         ./base/ubuntu
	adocker build --rm --no-cache -t azukiapp/web-based      ./base/web

	# latest
	adocker build --rm --no-cache -t azukiapp/node           ./node/0.10
	adocker build --rm --no-cache -t azukiapp/php-apache     ./php-apache/5.6
	adocker build --rm --no-cache -t azukiapp/ruby           ./ruby/2.1

	# version tagged
	adocker build --rm --no-cache -t azukiapp/php-apache:5.5 ./php-apache/5.5
	adocker build --rm --no-cache -t azukiapp/php-apache:5.6 ./php-apache/5.6
	adocker build --rm --no-cache -t azukiapp/ruby:1.9       ./ruby/1.9
	adocker build --rm --no-cache -t azukiapp/ruby:2.1       ./ruby/2.1
