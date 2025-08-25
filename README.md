### New Rust/Docker CI

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

Open questions:
* Is it okay that the Docker workflow does not depend on the Rust workflow? It is faster if they run in parallel but there is the danger that code with failing tests is pushed to Docker Hub. On the other hand this should have been caught before the PR was merged.
