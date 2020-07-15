NAME=bambora/devbamboracom
VERSION=latest

# Can specify arbitrary docker arguments on the command line.  Ex:
# make DOCKERBUILDARGS=--no-cache build
# will pass --no-cache to the docker build command
DOCKERBUILDARGS?=

build:
	docker build $(DOCKERBUILDARGS) -t $(NAME):$(VERSION) --rm .

run: build
	docker run --rm -v $(shell pwd):/usr/src/app/ -p 4567:4567 -w /usr/src/app $(NAME):$(VERSION) development_server

clean:
	# preceding dash is to prevent the makefile from erroring if the file/image doesn't exist
	# see: https://superuser.com/a/523510/150897
	-docker rmi $(NAME):$(VERSION)
