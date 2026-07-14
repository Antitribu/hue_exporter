FROM golang:1.20-alpine AS build

RUN apk add --no-cache git ca-certificates

WORKDIR /src
COPY . .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -mod=vendor \
    -ldflags="-s -w" \
    -o /hue_exporter .

FROM alpine:3.20

RUN apk add --no-cache ca-certificates

COPY --from=build /hue_exporter /bin/hue_exporter
COPY hue_exporter.example.yml /etc/hue_exporter/config.yml

EXPOSE 9366
ENTRYPOINT ["/bin/hue_exporter"]
CMD ["--config.file=/etc/hue_exporter/config.yml"]
