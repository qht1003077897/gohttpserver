#!/bin/bash

:<<'EOF'
配置docker的镜像加速器：
gedit /etc/docker/daemon.json
{
  "registry-mirrors": ["https://docker.rainbond.cc"]
}
systemctl daemon-reload
systemctl restart docker

使用docker info 查看是否有mirror.
EOF

:<<'EOF'
错误：
go: github.com/alecthomas/kingpin@v2.2.6+incompatible: Get "https://proxy.golang.org/github.com/alecthomas/kingpin/@v/v2.2.6+incompatible.mod": dial tcp 172.217.160.81:443: i/o timeout
解决：
####export GOPROXY=https://mirrors.aliyun.com/goproxy/
go env -w GOPROXY=https://goproxy.cn/,direct
go mod tidy
go mod vendor
go mod download
EOF

#begin docker build
#编译端
docker build -t sietium/gohttpserver -f docker/Dockerfile .

docker save -o gohttpserver.tar sietium/gohttpserver:latest

#部署服务器端
#systemctl start docker

#docker load -i gohttpserver.tar

#docker run -it --rm -p 8000:8000 -v $PWD:/app/public --name gohttpserver sietium/gohttpserver --upload

