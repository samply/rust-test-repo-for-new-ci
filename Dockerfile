FROM rust:1 AS builder
WORKDIR /usr/src/app
COPY . .
RUN --mount=type=cache,target=/usr/src/app/target \
    --mount=type=cache,target=/usr/local/cargo/registry \
    cargo install --path .

FROM debian:stable-slim
# RUN apt-get update && apt-get install -y extra-runtime-dependencies && rm -rf /var/lib/apt/lists/*
COPY --from=builder /usr/local/cargo/bin/rust-test-repo-for-new-ci /usr/local/bin/
CMD ["rust-test-repo-for-new-ci"]
