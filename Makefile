TAG=$(shell git describe --tags --always)
VERSION=$(TAG:v%=%)
NAME=sslproxy
DOCKER_REGISTRY=ghcr.io
REPO=shawntoffel/$(NAME)

.PHONY: all docker-build docker-deploy

all: docker-build

docker-build:
	docker build -t $(DOCKER_REGISTRY)/$(REPO):$(VERSION) .

docker-push:
	docker push $(DOCKER_REGISTRY)/$(REPO):$(VERSION)