include .env

.PHONY: up

up:
	docker compose up -d

.PHONY: up with build

build:
	docker compose up --build -d

.PHONY: down

down:
	docker compose down

.PHONY: logs

logs:
	docker compose logs -f
