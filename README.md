# Studi-nodejs-alpine

## Installation

### Clone project
```bash
git clone git@github.com:Aucante/Studi-nodejs-alpine.git
```

### Build container

```bash
docker build -t nodejs-alpine .
```

### Run container

```bash
docker run -p 3000:3000 --name studi-nodejs-alpine-container -d nodejs-alpine
```
