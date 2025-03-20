#-----------------------------------------------------------
# Docker version 28.0.1, build 068a01e
# Docker Compose version v2.33.1

.DEFAULT_GOAL := help

# Define Docker Compose command
DC := docker compose

##
##——————————————————————————————
##Display available commands
##——————————————————————————————
##

help: ## Outputs this help screen
	@grep -E '(^[a-zA-Z0-9\./_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}{printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'

##
##—————————————————————————————— Docker
##

run: build up ## Build and start the containers

build: ## Build the Docker images
	$(DC) build

up: ## Start the containers in detached mode
	$(DC) up -d

down: ## Stop and remove the containers, networks, and orphan containers
	$(DC) down --remove-orphans

down-clean: ## Stop, remove containers, and clean up
	$(MAKE) down

restart: ## Restart the containers
	$(MAKE) down-clean
	$(MAKE) up

rebuild: ## Rebuild the containers without using cache
	$(MAKE) down-clean
	$(DC) build --no-cache
	$(MAKE) up

##
##—————————————————————————————— SSL & Certificates
##

certs: ## Generate SSL certificates for Nginx
	./nginx/create-certificates.sh
