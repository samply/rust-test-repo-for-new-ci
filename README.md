### New Rust/Docker CI

What has been tested:

- [ ] Images should be pushed to Docker Hub
- [ ] Images should not be pushed to Docker Hub if triggered by a pull request
- [ ] Rust dependencies should be cached in build cache
- [ ] The build cache is shared between branches
- [ ] Images should be built for AMD64 and ARM64
- [ ] Images triggered by a schedule event should get the `nightly` tag
- [ ] Images triggered by push to a branch should get the branch name as tag
- [ ] Images triggered by push of a git tag of the format `vX.Y.Z` should get the tags `X.Y.Z`, `X.Y`, `X` (if not zero) and `latest`
- [ ] Images triggered by push of a git tag of the format `vX.Y.Z-prerelease` should get the tag `X.Y.Z-prerelease`
