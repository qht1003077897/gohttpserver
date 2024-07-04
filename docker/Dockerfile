FROM golang:1.16
WORKDIR /app/gohttpserver
ADD . /app/gohttpserver
RUN GOPROXY=https://goproxy.cn,direct CGO_ENABLED=0 GOOS=linux go build -ldflags '-X main.VERSION=docker' -o gohttpserver

FROM debian:stable
WORKDIR /app
RUN mkdir -p /app/public
RUN apt-get update && apt-get install -y ca-certificates
VOLUME /app/public
ADD assets ./assets
ADD dump2txt.sh ./dump2txt.sh
ADD minidump_stackwalk ./minidump_stackwalk
COPY --from=0 /app/gohttpserver/gohttpserver .
EXPOSE 8000
ENTRYPOINT [ "/app/gohttpserver", "--root=/app/public" ]
CMD []
