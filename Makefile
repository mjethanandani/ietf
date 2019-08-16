include setup.mk

container=mjethanandani/sol-006:latest

.PHONY: container push run all

leftover=$(shell docker ps -a -q -f status=exited)
leftover-image=$(shell docker images -a -q)

all: container

container:
	docker rmi $(leftover-image); docker rm $(leftover); docker build -t $(container) .; docker run $(container)

push:
	docker push $(container):$(VER)

run:
	docker run -it $(container) bash

clean: packages-clean
	-docker rm $(leftover)
	-docker rmi $(leftover-image)

start: stop
	if [ ! -d ncs-cdb ]; then mkdir ncs-cdb; fi
	if [ ! -d init_data ]; then mkdir init_data; fi
	cp init_data/* ncs-cdb/. > /dev/null 2>&1 || true
	ncs

stop:
	ncs --stop || true
