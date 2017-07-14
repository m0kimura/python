lib = ../
prj = python
usr = kimura
default: build

dockerfile: $(lib)/*.m4
	m4 -I $(lib) ./Dockerfile.m4 > Dockerfile

composer: dockerfile
	m4 -I $(lib) -DProject=$(prj) -DUser=$(usr) ./docker-compose.m4 > docker-compose.yml

build: composer
	docker-compose up

