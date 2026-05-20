*This project has been created as part of the 42 curriculum by tlutz*

# User Documentation

## Services provided

- This stack provides a fully working wordpress installation, connected to mariadb, with https support provided by nginx.

## Start and stop the project

Before starting the stack, create a `.env` file next to `docker-compose.yml` and define `DOMAIN_NAME` and `SITE_TITLE`.
An `.env.example` file is provided as a template.

Then create different secret files in a folder called "secrets" at the root of the project.

Required files:
- `mysql_user` containing the name of the user in the database
- `mysql_password` containing the password of the user in the database
- `mysql_name` containing the name of the database
- `wp_admin` containing the name of the administrator in wordpress
- `wp_admin_password` containing the password of the wordpress administrator
- `wp_user` containing the name of the simple wordpress user
- `wp_password` containing the password of the simple wordpress user

These files are used as Docker secrets and are mounted inside containers under `/run/secrets/<secret_name>`

Finally, the `make` command build every container with each services, using the credentials and variables that we just set.

To stop the project, the `make down` command stops the containers, and the `make fclean` command stops and cleans everything.

## Access the website and the admin panel

Edit the /etc/hosts file and add this line:

`127.0.0.1  tlutz.42.fr`

Then the website is accessible with https://tlutz.42.fr in any browser

To access the admin panel of the website, you need to go to https://tlutz.42.fr/wp-login.php, then login with your user or the admin user.
You can then access the admin panel at https://tlutz.42.fr/wp-admin.

## Check that the services are running correctly

To check if the containers are running well, the command 'docker ps -a' will list every container running on the host machine, and display the status for each one.

Furthermore, the 'docker logs container_name' shows all the errors/logs messages the docker container printed internally.

(where container_name can be nginx, mariadb or wordpress)