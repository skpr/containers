FROM circleci/golang:1.13

ENV GORELASER_VERSION=v0.146.0

RUN mkdir -p /home/circleci/.local/bin
RUN curl -L https://github.com/goreleaser/goreleaser/releases/download/${GORELASER_VERSION}/goreleaser_Linux_x86_64.tar.gz | tar -xz -C /home/circleci/.local/bin/
