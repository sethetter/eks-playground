.PHONY: default
default: ecr-login build push

.PHONY: ecr-login
ecr-login:
	aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin $(ECR_REPO_URL)

.PHONY: build
build:
	docker build \
		--platform linux/amd64 \
		--tag $(ECR_REPO_URL):latest \
		.

.PHONY: push
push:
	docker push $(ECR_REPO_URL):latest
