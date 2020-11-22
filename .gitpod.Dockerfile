FROM gitpod/workspace-full

USER gitpod

RUN grep ^HUGO_VERSION netlify.toml | tail -n 1 | cut -d '=' -f 2 | tr -d " \"\n" > HUGO_VERSION && \
    curl -L https://github.com/gohugoio/hugo/releases/download/v$(cat HUGO_VERSION)/hugo_extended_$(cat HUGO_VERSION)_Linux-64bit.tar.gz | tar -xz

EXPOSE 1313
# Install custom tools, runtime, etc. using apt-get
# For example, the command below would install "bastet" - a command line tetris clone:
#
# RUN sudo apt-get -q update && \
#     sudo apt-get install -yq bastet && \
#     sudo rm -rf /var/lib/apt/lists/*
#
# More information: https://www.gitpod.io/docs/config-docker/

# image:
#   file: Dockerfile
#   HUGO_VERSION      = $(shell grep ^HUGO_VERSION netlify.toml | tail -n 1 | cut -d '=' -f 2 | tr -d " \"\n")

#   	$(CONTAINER_ENGINE) build . \
# 		--network=host \
# 		--tag $(CONTAINER_IMAGE) \
# 		--build-arg HUGO_VERSION=$(HUGO_VERSION)
# tasks:
#   - init: hugo server --buildFuture --bind 0.0.0.0
