group "default" {
  targets = ["base", "minio"]
}

variable "REPO" {
  default = ""
}

variable "VERSION" {
  default = "latest"
}

variable "OS" {
  default = "linux"
}

variable "ARCH" {
  default = "amd64"
}

target "base" {
  # Use the official Docker image for the base image
  context = "."
  dockerfile = "Dockerfile.base"
  args = {
    VERSION = "${VERSION}"
    GOOS = "${OS}"
    GOARCH = "${ARCH}"
  }
  output = ["type=cacheonly"]
  platforms = ["linux/${ARCH}"]
}

target "minio" {
  # Use the official Docker image for the base image
  contexts = {
    base = "target:base"
  }
  args = {
    REPO = "${REPO}"
    VERSION = "${VERSION}"
    GOOS = "${OS}"
    GOARCH = "${ARCH}"
  }
  dockerfile = "Dockerfile.${OS}"
  tags = [
    "ghcr.io/${REPO}:${OS}-${ARCH}-latest",
    "ghcr.io/${REPO}:${OS}-${ARCH}-${VERSION}"
  ]
  output = ["type=registry"]
  platforms = ["${OS}/${ARCH}"]
}

