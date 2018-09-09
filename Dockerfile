FROM golang:1.10-alpine as build
COPY . /go/src/github.com/mholt/caddy
WORKDIR /go/src/github.com/mholt/caddy/caddy
RUN go build

FROM alpine:latest
COPY --from=build /go/src/github.com/mholt/caddy/caddy/caddy /usr/local/bin/caddy
