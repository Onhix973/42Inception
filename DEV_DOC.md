# Developer Documentation

## Environnment from scratch

This project needs:
- Make
- Docker
- Docker compose

Before starting the stack, create a `.env` file next to `docker-compose.yml` and define `DOMAIN_NAME` and `SITE_TITLE`.
An `.env.example` file is provided as a template.

Then create different secret files in a folder called "secrets" at the root of the project.

Required files:
- "mysql_user" containing the name of the user in the database
- "mysql_password" containing the password of the user in the database
- "mysql_name" containing the name of the database
- "wp_admin" containing the name of the administrator in wordpress
- "wp_admin_password" containing the password of the wordpress administrator
- "wp_user" containing the name of the simple wordpress user
- "wp_password" containing the password of the simple wordpress user

Nginx config file is located at `srcs/requirements/nginx/nginx.conf`, everything can be changed and/or added, docker will replace the base nginx config with this one.

Same for the FastCgi config file, this one is located at `srcs/requirement/wordpress/conf/www.conf`.
To change wordpress config directly, the entrypoint script can be edited to change any parameters wp-cli can handle, the script is located at `/srcs/requirements/wordpress/`entrypoint/entrypoint.sh

Mariadb can also be configured via the init_sql template and the mariadb config file, those are located at `srcs/requirements/mariadb/init.sql.template` and `srcs/requirements/mariadb/my.cnf`

# Makefile and Docker Compose

The makefile has some useful commands to simplify the launch, restart, shutdown, and rebuild of the project:
- The main rule of the makefile will build the project and launch it 
- The `fclean` rule will down the containers, prune them and the images, removes the volumes and their associated folders
- The `re` rule will launch `fclean` and the main rule

The docker-compose.yml file can be edited to change port settings, volumes location, add/remove secrets and even change docker network settings.

## Useful commands

`docker exec -it <container_name> sh` to enter a docker container with sh launched, everything is doable like on a normal linux installation.

`docker logs <container_name>` to see logs/error messages from a container.

`docker ps -a` to list all containers, gives id uptime name and exposed ports.

`docker inspect <container_name>` or `docker network inspect <network_name>` to inspect all of the data of a container or network.

## Persistent Storage

Docker named volumes are used to store persistent data on the host machine, those volumes stores data in `/home/username/data/wordpress` or `/home/username/data/mariadb`

If you want to remove any volume you can use the make fclean command or 'docker volume rm name_of_the_volume', then you can delete the host folder.