TAG=$(shell git describe --tags --always)
VERSION=$(TAG:v%=%)
NAME=sslproxy
DOCKER_REGISTRY=ghcr.io
REPO=shawntoffel/$(NAME)
DOCKER=docker

.PHONY: all docker-build docker-deploy

all: docker-build

docker-build:
	$(DOCKER) build -t $(DOCKER_REGISTRY)/$(REPO):$(VERSION) .

docker-push:
	$(DOCKER) push $(DOCKER_REGISTRY)/$(REPO):$(VERSION)