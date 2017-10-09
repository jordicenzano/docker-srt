# DOCKER TASKS
# Build the container

# Import docker repo (docker hub creds)
include ./secrets/docker-creds.secrets

DOCKER_IMAGE_NAME = docker-srt
DOCKER_IMAGE_VERSION = 1.0

# Import docker repo (docker hub creds)

.PHONY: build tag_latest push push_latest last_built_date shell

build: Dockerfile
	docker build -t $(DOCKER_REPO_USER)/$(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_VERSION) --rm .

build_nocache: Dockerfile
	docker build --no-cache -t $(DOCKER_REPO_USER)/$(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_VERSION) --rm .

tag_latest:
	docker tag $(DOCKER_REPO_USER)/$(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_VERSION) $(DOCKER_REPO_USER)/$(DOCKER_IMAGE_NAME):latest

push:
	docker login -u $(DOCKER_REPO_USER) -p $(DOCKER_REPO_PASS)
	docker push $(DOCKER_REPO_USER)/$(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_VERSION)
	docker logout

push_latest:
	docker login -u $(DOCKER_REPO_USER) -p $(DOCKER_REPO_PASS)
	docker push $(DOCKER_REPO_USER)/$(DOCKER_IMAGE_NAME):latest
	docker logout

last_built_date:
	docker inspect -f '{{ .Created }}' $(DOCKER_REPO_USER)/$(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_VERSION)

shell:
	docker run --rm -i -t --entrypoint "/bin/bash" $(DOCKER_REPO_USER)/$(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_VERSION)

default: build