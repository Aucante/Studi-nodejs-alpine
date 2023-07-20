# STUDI ECF - NODEJS APP

## Requirements

- Docker

## Installation 

#### Create project

```bash
  mkdir studi-nodejs-alpine
  cd studi-nodejs-alpine
```


#### Run the application

##### Build Image

```bash
  docker build -t studi-nodejs-alpine-image .
```

##### Run the container

```bash
  docker run -p 8080:3000 --name studi-nodejs-alpine-container -d studi-nodejs-alpine-image
```

#### The application is now available on http://localhost:8080/

## Push image to DockerHub   
   
```bash
  docker login
```

```bash
  docker tag studi-nodejs-alpine-image aucante/studi-nodejs-alpine
```

```bash
  docker push aucante/studi-nodejs-alpine
```

## Kubernetes

#### Add config (rm config before)
   
```bash
  aws eks update-kubeconfig --region eu-west-1 --name studi-eks-ecf
```

#### Apply manifest from Nodejs Application
   
```bash
  kubectl apply -f k8s/deployment.yaml 
```

#### Bind service with kube
   
```bash
  kubectl port-forward svc/service-node 3000
```

#### Deploy Kube
   
```bash
  make deploy-cluster
```
