# Build and start all containers
up:
	# Run the environment generation script
	srcs/./generate_env.sh || exit 1
	docker-compose -f srcs/docker-compose.yml up --build

# Stop and remove containers
down:
	docker-compose -f srcs/docker-compose.yml down

# Rebuild containers
re:
	# Run the environment generation script
	srcs/./generate_env.sh || exit 1
	docker-compose -f srcs/docker-compose.yml down
	docker-compose -f srcs/docker-compose.yml up --build --force-recreate

# View logs of all services
logs:
	docker-compose -f srcs/docker-compose.yml logs -f

# Clean up (remove containers and volumes)
clean:
	@read -p "Are you sure you want to delete all volumes and images? [y/N] " confirm; \
	if [ "$$confirm" = "y" ]; then \
		chmod 777 volumes/*; \
		docker-compose -f srcs/docker-compose.yml down -v --rmi all; \
		rm -rf volumes/*; \
	fi
