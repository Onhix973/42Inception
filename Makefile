all : build
	docker compose -f srcs/docker-compose.yml -p inception up -d

build :
	docker compose -f srcs/docker-compose.yml -p inception build

down:
	docker compose -f srcs/docker-compose.yml -p inception down --remove-orphans

fclean: down
	docker system prune -a --volumes -f
	docker volume rm inception_mariadb_data
	docker volume rm inception_wordpress_data

re: fclean all