# syntax=docker/dockerfile:1
# FROM golang:alpine AS build
ARG VERSION=latest
FROM --platform=$BUILDPLATFORM golang:alpine AS build
ARG TARGETOS
ARG TARGETARCH
ARG VERSION
WORKDIR /app
RUN GOOS=${TARGETOS} GOARCH=${TARGETARCH} go install github.com/minio/minio@{VERSION}
# RUN go install github.com/minio/minio@latest

FROM $TARGETPLATFORM
COPY --from=build /go/bin/minio /usr/bin/minio

EXPOSE 9000
EXPOSE 9001

ENTRYPOINT ["/usr/bin/minio"]