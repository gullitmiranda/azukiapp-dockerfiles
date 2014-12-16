# `adocker` is alias to `azk docker`
all:
	# base
	adocker build -t azukiapp/ubuntu     ./ubuntu
	adocker build -t azukiapp/web-based  ./web

--no-cache:
	# base
	adocker build --rm --no-cache -t azukiapp/ubuntu    ./ubuntu
	adocker build --rm --no-cache -t azukiapp/web-based ./web
