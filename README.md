*This project has been created as part of the 42 curriculum by tlutz*

# Description

Inception is a school project that aims to introduce Docker. The student needs to automate the building of three docker containers: 

- One container with nginx that redirects http to https and forwards php request to php-fpm and wordpress
- One container running mariadb
- One last container with wordpress and php-fpm

A docker bridge network is used for this project.

The nginx container is available through port 443 on the host machine. It connects to the Wordpress container through port 9000 inside of the docker network.
The wordpress container connects to the Mariadb through port 3306 inside the docker network.

Mariadb and Wordpress have their own named volumes to store persistent data. The volumes content is stored in "/home/${USER}/data" on the host machine.

Each container is launched with a custom image based on alpine. No prebuilt docker images are used.

# Instructions

First of all, Docker, Docker compose and make are needed run this project.

From the project root, a simple make command will launch every container.

The wordpress website is then available at https://localhost or https://${USER}.42.fr if the hosts file has been correctly set up.

The make down command will shut down all the containers but not delete any persistent data.

The make fclean command will shut down all the containers, deletes every docker images and containers, remove the docker volumes, and delete persistent data on the host machine.

The make re calls fclean and the main rule, it will delete everything and rebuild the project from the ground up.

# Resources

AI was not used during this project, Docker's documentation is beautifully made and peer to peer communication helped me answers my specific questions.

Docker's documentation, a goldmine of informations about docker and docker compose
https://docs.docker.com/

Nginx's documentation, everything needed about nginx is here
https://nginx.org/en/docs/

Mariadb's documentation, in this project mariadb just needs to be installed and launched, the official documentation gives everything for that
https://mariadb.com/docs

# Project Description

Virtual Machines or Docker ?
- Docker shares Kernel, filesystem, network, and resources with the host, but it isolate processes. A Virtual Machine isolates much more with it's own separate kernel and virtual hardware layer. VMs are fully isolated but much heavier. On top of that, separate kernel and hardware layer means a higher cpu overhead, more memory usage.
Docker is better when fast startup and density is needed. VMs are better when a full isolation is required.

Docker secrets or env variables ?
- Environment variables are available to every process in the container, they are useful for non-sensitive configuration.
Docker secrets are only available for specific containers/processes, they are useful for credentials, private keys, tokens and other sensitive informations.

Docker Network or Host Network ?
- Host network means the container shares the host network settings, everything is shared, like IP, port forwarding etc...
Docker Network means a separated network is created by docker, the container has his own subnet. This means that port collision is less likely to happen, it's much more isolated than the host network.

Docker Volumes or Bind Mounts ?
- A docker volume is a storage managed by Docker, docker controls where it lives on the host, and manages it with docker commands. It's more portable and better for persistent data.
A bind mount maps a specific host path into the container. It gives direct access to the host filesystem, pretty useful for development, but less portable and couples the container to a specific machine path.