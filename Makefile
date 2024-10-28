# Build and start all containers
up:
	./generate_env.sh
	docker-compose -f srcs/docker-compose.yml up --build -d

# Stop and remove containers
down:
	docker-compose -f srcs/docker-compose.yml down

# Rebuild containers
rebuild:
	docker-compose -f srcs/docker-compose.yml up --build -d --force-recreate

# View logs of all services
logs:
	docker-compose -f srcs/docker-compose.yml logs -f

# Clean up (remove containers and volumes)
clean:
	docker-compose -f srcs/docker-compose.yml down -v
	rm -rf volumes/*
