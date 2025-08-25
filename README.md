### New Rust/Docker CI

Main changes compared to old CI:

* Component repositories contain multi-stage Dockerfiles that run `cargo build` (or `cargo install`) and use [cache mounts](https://docs.docker.com/build/cache/optimize/#use-cache-mounts) for build caching.
* The `samply-rust.yml` and `samply-docker.yml` workflows are decoupled. The latter is language-agnostic and contains no Rust-specific functionality.

Open questions:
* Is it okay that the Docker workflow does not depend on the Rust workflow? It is faster if they run in parallel but there is the danger that code with failing tests is pushed to Docker Hub. On the other hand this should have been caught before the PR was merged.
* If the Docker workflow does not depend on the Rust workflow, should we recommend that components have separate `rust.yml` and `docker.yml` workflows or should we recommend that they have one `ci.yml` where they include both `samply-rust.yml` and `samply-docker.yml`? Having separate workflows makes it easier to customize run conditons (`on: push`, `on: pull_request`, etc.) but it might make the Actions tab more convoluted.

What has been tested:

- [ ] Images triggered by a pull request should be pushed to GHCR
- [ ] Images triggered by events other than a pull request should be pushed to Docker Hub
- [ ] There should be an input to specify a custom Dockerfile path
- [ ] Rust build cache should be persisted in GitHub Actions cache
- [ ] The build cache should be shared between branches
- [ ] Images should be built for AMD64 and ARM64
- [ ] Images triggered by a schedule event should get the `nightly` tag
- [ ] Images triggered by push to a branch should get the branch name as tag
- [ ] Images triggered by push of a git tag of the format `vX.Y.Z` should get the tags `X.Y.Z`, `X.Y`, `X` (if not zero) and `latest`
- [ ] Images triggered by push of a git tag of the format `vX.Y.Z-prerelease` should get the tag `X.Y.Z-prerelease`
