# Studi-nodejs-alpine

## Installation

### Clone project
```bash
git clone git@github.com:Aucante/Studi-nodejs-alpine.git
```

### Build container

```bash
docker build -t studi-nodejs-alpine-image .
```

### Run container on port 8080 for example

```bash
docker run -p 8080:3000 --name studi-nodejs-alpine-container -d studi-nodejs-alpine-image
```

### Pull image from Dockerhub

```bash
docker pull aucante/studi-nodejs-alpine:latest
```