### New Rust/Docker CI

What has been tested:

- [ ] Images should be pushed to Docker Hub
- [ ] Images should not be pushed to Docker Hub if triggered by a pull request
- [ ] Rust dependencies should be cached in build cache
- [ ] Images should be built for AMD64 and ARM64
- [ ] Images triggered by a schedule event should be tagged `nightly`
- [ ] Images triggered by push to a branch should be tagged with the branch name
- [ ] Images triggered by a git tag of the format `vX.Y.Z` should be tagged `X.Y.Z`, `X.Y`, `X` (if not zero) and `latest`
- [ ] Images triggered by a git tag of the format `vX.Y.Z-prerelease` should be tagged `X.Y.Z-prerelease`
