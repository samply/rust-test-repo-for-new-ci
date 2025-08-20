FROM rust:1.89 AS builder
WORKDIR /usr/src/app
COPY . .
RUN --mount=type=cache,target=/usr/src/app/target/ \
    # --mount=type=cache,target=/usr/local/cargo/git/db \
    # --mount=type=cache,target=/usr/local/cargo/registry/ \
    cargo install --path .

# FROM debian:trixie-slim
# # RUN apt-get update && apt-get install -y extra-runtime-dependencies && rm -rf /var/lib/apt/lists/*
# COPY --from=builder /usr/local/cargo/bin/rust-test-repo-for-new-ci /usr/local/bin/rust-test-repo-for-new-ci
CMD ["rust-test-repo-for-new-ci"]

# FROM ubuntu:22.04
# ENV DEBIAN_FRONTEND=noninteractive
# RUN \
#   --mount=type=cache,target=/var/cache/apt,sharing=locked \
#   --mount=type=cache,target=/var/lib/apt,sharing=locked \
#   rm -f /etc/apt/apt.conf.d/docker-clean && \
#   echo 'Binary::apt::APT::Keep-Downloaded-Packages "true";' >/etc/apt/apt.conf.d/keep-cache && \
#   apt-get update && \
#   apt-get install -y gcc
