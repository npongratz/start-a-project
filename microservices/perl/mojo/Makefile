ROOT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

all: build

build:
		docker build -t perl-app .

run:
		docker run -it -p 8080:3000 -v $(ROOT_DIR):/srv/www:rw perl-app:latest

clean: clean_untagged

clean_untagged:
	    for i in `docker ps --no-trunc -a -q`;do docker rm $$i;done
			    docker images --no-trunc | grep none | awk '{print $$3}' | xargs -r docker rmi                                                                                                                      
.PHONY: build run clean clean_untagged
