export MAINTAINER:=klud
export NAME:=gitlab-runner
export IMAGE:=$(MAINTAINER)/$(NAME)
export VERSION:=$(shell ./ci/version)
export ARCHS:="armhf aarch64"

all: version build push
all-arm64: version build-alpine push

help:
	# General commands:
	# make all => build push
	# make version - show information about the current version
	#
	# Commands
	# make build - build the Runner image
	# make push - push the image to Docker Hub

version: FORCE
	@echo "---"
	@echo Version: $(VERSION)
	@echo Image: $(IMAGE):$(VERSION)
	@echo Platorms: $(ARCHS)
	@echo ""
	@echo Brought to you by ulm0
	@echo "---"

build: build-alpine build-ubuntu

build-alpine:
	@./ci/build-alpine

build-ubuntu:
	@./ci/build-ubuntu

push:
	@./ci/release

multi-arch:
	@./ci/multi-arch

FORCE:
