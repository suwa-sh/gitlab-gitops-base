#!make
.DEFAULT_GOAL := push

include .env
export $(shell sed 's/=.*//' .env)

login:
	@echo "docker login..." >&2
	@echo ${DOCKER_PASS} | docker login -u ${DOCKER_USER} --password-stdin

build:
	@echo "docker build..." >&2
	@docker build . -f Dockerfile -t ${DOCKER_USER}/${IMAGE_NAME}:${IMAGE_TAG}
	@docker image tag ${DOCKER_USER}/${IMAGE_NAME}:${IMAGE_TAG} ${DOCKER_USER}/${IMAGE_NAME}:latest

push: login build
	@echo "docker push..." >&2
	@docker push ${DOCKER_USER}/${IMAGE_NAME}:${IMAGE_TAG}
	@docker push ${DOCKER_USER}/${IMAGE_NAME}:latest
