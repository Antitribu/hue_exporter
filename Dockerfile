FROM golang:1.20-bookworm AS build

RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /src
COPY go.mod go.sum ./
COPY vendor/ vendor/
COPY *.go hue_exporter.example.yml ./

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -mod=vendor \
    -ldflags="-s -w" \
    -o /hue_exporter .

FROM debian:bookworm-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates \
    && rm -rf /var/lib/apt/lists/*

COPY --from=build /hue_exporter /bin/hue_exporter
COPY hue_exporter.example.yml /etc/hue_exporter/config.yml

EXPOSE 9366
ENTRYPOINT ["/bin/hue_exporter"]
CMD ["--config.file=/etc/hue_exporter/config.yml"]
