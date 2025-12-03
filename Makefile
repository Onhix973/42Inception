NAME = Inception

all : build
	docker compose -f srcs/docker-compose.yml up -d

build :
	docker compose -f srcs/docker-compose.yml build

logs :
	docker compose -f srcs/docker-compose.yml logs nginx

down:
	docker compose -f srcs/docker-compose.yml down