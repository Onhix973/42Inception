*This project has been created as part of the 42 curriculum by tlutz*

# User Documentation

## Services provided

- This stack provides a fully working wordpress installation, connected to mariadb, with https support provided by nginx.

## Start and stop the project

First step is to create a .env file next to the docker-compose.yml file, with DOMAIN_NAME and SITE_TITLE set up. 
A .env.example is available with example values.

Next step is to create different secret files next to the docker-compose.yml file:

- A file named "mysql_user" containing the name of the user in the database
- A file named "mysql_password" containing the password of the user in the database
- A file named "mysql_name" containing the name of the database
- A file named "wp_admin" containing the name of the administrator in wordpress
- A file named "wp_admin_password" containing the password of the wordpress administrator
- A file named "wp_user" containing the name of the simple wordpress user
- A file named "wp_password" containing the password of the simple wordpress user

Finally, the "make" command build every container with each services, using the crendentials and variables that we just set

## Access the website and the admin panel

Edit the /etc/hosts file and add this line:
- 127.0.0.1  user.42.fr

Then the website is accessible with https://user.42.fr in any browser

(where 'user' is your username on the machine)

## Check that the services are running correctly

To check if the containers are running well, the command 'docker ps -a' will list every container running on the host machine, and display the status for each one.

Furthermore, the 'docker logs container_name' shows all the errors/logs messages the docker container printed internally.

(where container_name can be nginx, mariadb or wordpress)