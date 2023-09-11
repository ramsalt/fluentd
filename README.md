# fluentd
Custom fluentd Docker image with elasticsearch output

## Upgrading

To upgrade the underlying version of fluentd, edit `Dockerfile` and push a corresponding git tag to GitHub:

```
ARG FLUENTD_VERSION=v1.16.2-1.0
FROM fluent/fluentd:${FLUENTD_VERSION}
```

```
git commit -m "Upgrade fluentd to 1.16.2" Dockerfile
git tag -m "Upgrade fluentd to 1.16.2" v1.16.2-0
git push && git push --tags

```
