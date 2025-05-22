# Makefile for Docker Compose commands

# Build the Docker images
build:
	docker-compose build

# Start the Docker containers
up:
	docker-compose up -d

# Stop and remove the Docker containers
down:
	docker-compose down

# View logs for all services
logs:
	docker-compose logs -f

# Restart all services
restart:
	docker-compose restart

# Run a specific service (e.g., make run SERVICE=web)
run:
	docker-compose run --rm $(SERVICE)