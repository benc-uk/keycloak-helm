# Common variables
VERSION := 0.0.1
BUILD_INFO := Manual build 

# Most likely want to override these when calling `make image`
IMAGE_REG ?= ghcr.io
IMAGE_REPO ?= benc-uk/keycloak
IMAGE_TAG ?= latest
IMAGE_PREFIX := $(IMAGE_REG)/$(IMAGE_REPO)

KC_USER ?= admin
KC_PASSWORD ?= admin

# Things you don't want to change
REPO_DIR := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))

.PHONY: help image push
.DEFAULT_GOAL := help

help: ## 💬 This help message :)
	@figlet $@ || true
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

image: ## 📦 Build container image from Dockerfile
	@figlet $@ || true
	docker build --file ./Dockerfile \
	--build-arg BUILD_INFO="$(BUILD_INFO)" \
	--build-arg VERSION="$(VERSION)" \
	--tag $(IMAGE_PREFIX):$(IMAGE_TAG) . 

push: ## 📤 Push container image to registry
	@figlet $@ || true
	docker push $(IMAGE_PREFIX):$(IMAGE_TAG)

run: ## 🚀 Run the container locally
	@figlet $@ || true
	docker run --rm -it -p 8081:8080 \
	-e KEYCLOAK_ADMIN=$(KC_USER) -e KEYCLOAK_ADMIN_PASSWORD=$(KC_PASSWORD) \
	$(IMAGE_PREFIX):$(IMAGE_TAG)