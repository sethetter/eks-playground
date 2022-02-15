.PHONY: build
build:
	docker build \
		--platform linux/amd64 \
		--tag ${ECR_REPO_URL}:latest \
		.

.PHONY: push
push:
	docker push ${ECR_REPO_URL}:latest
