IMAGE_NAME="mentatlabs/base"

## Build image from Dockerfile
build:
	docker build --rm -t $(IMAGE_NAME) .

## Push image to hub
push:
	docker push $(IMAGE_NAME)

## Run container with default command
run: build_env
	@docker run -it \
		--log-driver=syslog \
		$(IMAGE_NAME)

