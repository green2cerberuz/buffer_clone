DOCKERFILE_PATH?= ./provision/Dockerfile
CONTAINER_NAME?=buffer_clone_app_1
IMAGE_NAME?= ruby-set


init:
	docker-compose run --no-deps --rm app rails new . --force --database=postgresql --skip-javascript

app.populate_db:
	docker-compose run --rm app rake db:create

app.command:
	./scripts/run_command.sh $(filter-out $@,$(MAKECMDGOALS))

app.start:
	docker-compose down && docker-compose up

app.shell:
	docker-compose run --rm app rails c

app.stop:
	docker-compose down

docker.shell:
	docker-compose run --rm --no-deps app /bin/sh 

docker.build:
	docker build $(cache) -t $(IMAGE_NAME) --build-arg USER_ID=$(shell id -u) --build-arg GROUP_ID=$(shell id -g) -f $(DOCKERFILE_PATH) .

ruby.linter:
	docker-compose run --rm --no-deps app rubocop --config rubocop.yml ./app

%:
	@: