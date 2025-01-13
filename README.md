# minio-container

Individual docker images for running minio on different platforms and architectures.

This is NOT hardened for production, but is convenient for running in CI/CD systems where your code needs to run tests on multiple platforms.

## Windows

```bash
docker pull ghcr.io/proof-partners/minio:windows-amd64-latest
```

## x86-64

```bash
docker pull ghcr.io/proof-partners/minio:linux-amd64-latest
```

## arm/64

```bash
docker pull ghcr.io/proof-partners/minio:linux-arm64-latest
```
