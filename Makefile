IMAGE_NAME := studi-nodejs-alpine-image
CONTAINER_NAME := studi-nodejs-alpine-container
CLUSTER_NAME := studi-eks-ecf
CLUSTER_REGION := eu-west-1

build:
	docker build -t $(IMAGE_NAME) .

run-container:
	@if docker inspect -f '{{.State.Running}}' $(CONTAINER_NAME) 2>/dev/null | grep -q "true"; then \
		docker stop $(CONTAINER_NAME) ; \
	fi
	@if docker inspect -f '{{.State.Running}}' $(CONTAINER_NAME) 2>/dev/null | grep -q "false"; then \
		docker rm $(CONTAINER_NAME) ; \
	fi
	docker run -p 8080:3000 --name $(CONTAINER_NAME) -d $(IMAGE_NAME)


exec-test:
	docker exec -it $(CONTAINER_NAME) npx jest

stop:
	docker stop $(CONTAINER_NAME)

clean:
	@if docker inspect -f '{{.State.Running}}' $(CONTAINER_NAME) | grep -q "true"; then \
		make stop ; \
	fi
	docker rm $(CONTAINER_NAME)
	docker rmi $(IMAGE_NAME)

build-and-run: build run-container

build-and-run-tests:
	@if ! docker images $(IMAGE_NAME) | awk '{ print $$2 }' | grep -q -F "latest"; then \
		docker build -t $(IMAGE_NAME) . ; \
	fi
	@if ! docker ps -a --format '{{.Names}}' | grep -q -F "$(CONTAINER_NAME)"; then \
		docker run -p 8080:3000 --name $(CONTAINER_NAME) -d $(IMAGE_NAME) ; \
	fi
	@if docker inspect -f '{{.State.Running}}' $(CONTAINER_NAME) | grep -q "true"; then \
		make exec-test ; \
	else \
		docker start $(CONTAINER_NAME) && make exec-test ; \
	fi

update-kube-config:
	aws eks update-kubeconfig --region $(CLUSTER_REGION) --name $(CLUSTER_NAME)

install-eck:
	kubectl create -f https://download.elastic.co/downloads/eck/2.8.0/crds.yaml
	kubectl apply -f https://download.elastic.co/downloads/eck/2.8.0/operator.yaml


