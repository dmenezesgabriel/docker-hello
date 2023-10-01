# Docker Hello

## Solves

- Ports conflicts on multiple services or applications on same cluster
- Versioning of applications
- System resource consumption
- Maintenance

## Docker vs Virtual Machines

- Docker containers does not have hypervisor or guest operational systems
- Docker containers are lightweight and share the host OS kernel

### Why containers are lightweight?

- Containers are just processes inside the system instead of a full virtualized OS
- Containers are not a full copy of the OS

### How it does provide isolation?

- Namespaces: Isolate an application's view of the operating environment, including process trees, network, user IDs and mounted file systems
- Control Groups: Limit an application to a specific set of resources, including CPU, memory, disk I/O and network bandwidth

## Container

- To a container keep alive it must be running a process. If the process ends the container will stop.
- Containers are ephemeral. If you want to keep the data you must use volumes.

## Images

- Images are read-only templates used to create containers.
- Images are immutable.

### Layers

- Images are composed by layers. Each layer is a set of files and directories that are created during the image build process.
- Each image has a Rw layer on top of the read-only layers. This layer is used to store the changes made to the container.

1. Layer: Kernel, binaries and libraries
2. Layer: Operating system packages
3. Layer: Application code

## Commands

- `docker images`: List all images
- `docker ps`: List all active containers
- `docker container ls`: List all active containers
- `docker ps -a`: List all containers including inactive ones
- `docker container ls -a`: List all containers including inactive ones
- `docker stop <container_id>`: Stop a container
- `docker stop <container_name>`: Stop a container
- `docker start <container_id>`: Start a container
- `docker start <container_name>`: Start a container
- `docker pause <container_id>`: Pause a container
- `docker pause <container_name>`: Pause a container
- `docker unpause <container_id>`: Unpause a container
- `docker unpause <container_name>`: Unpause a container
- `docker exec -it <container_id> <command>`: Execute a command inside a running container
- `docker exec -it <container_name> <command>`: Execute a command inside a running container
- `docker run --rm -it <image_name> <command>`: Run a command inside a container and remove it after it stops
- `docker run --rm -it <image_name> <command> <args>`: Run a command with arguments inside a container and remove it after it stops
- `docker run --rm -it <image_name> /bin/bash`: Run a container shell in interactive mode and remove it after it stops
- `docker rm <container_id>`: Remove a container
- `docker rm <container_name>`: Remove a container
- `docker rm -f <container_id>`: Force remove a container
- `docker rm -f <container_name>`: Force remove a container
- `docker inspect <container_id>`: Inspect a container
- `docker inspect <container_name>`: Inspect a container
- `docker logs <container_id>`: Show container logs
- `docker logs <container_name>`: Show container logs
- `docker history <image_name>`: Show image history
- `docker history <image_id>`: Show image history
- `docker stop $(docker container ls -q)`: Stop all containers
- `docker container prune`: Remove all stopped containers
- `docker rmi $(docker image ls -aq)`: Remove all images

### Sample

- `docker run --rm -d -P dockersamples/static-site`: Run a container in background
- `docker ports <container_id>`: List all ports exposed by a container

## Dockerfile

- Dockerfile is a recipe to build an image.

### Build

- `docker build -t <image_name>:<tag> .`: Build an image from a Dockerfile

- `docker build -t sample/node-server:1.0 .`: Build an image from a Dockerfile
- `docker run --rm -d -p 3000:6000 sample/node-server:1.0`: Run a container from an image

## Storage

### Bind Mounts

- Bind mounts are used to share files between the host and the container.

- `-mount`: Create a bind mount
- `-v`: Create a bind mount
- `docker run -it -v <host_path>:<container_path> <image_name>`: Create a container with a bind mount
- `docker run -it -mount type=bind,source=<host_path>,target=<container_path> <image_name>`: Create a container with a bind mount

### Volumes

- Volumes are managed by docker daemon, and don't depend on the host file system.
- `/var/lib/docker/volumes`

- `docker volume create <volume_name>`: Create a volume
- `docker volume ls`: List all volumes
- `docker volume inspect <volume_name>`: Inspect a volume
- `docker volume rm <volume_name>`: Remove a volume
- `docker volume prune`: Remove all unused volumes
- `docker run -it -v <volume_name>:<container_path> <image_name>`: Create a container with a volume

### tmpfs Mounts

- tmpfs mounts are stored in the host memory.

- `docker run -it --mount type=tmpfs,destination=<container_path> <image_name>`: Create a container with a tmpfs mount

## Network

- Containers can communicate with each other using networks.

- `docker network create <network_name>`: Create a network
- `docker network ls`: List all networks
- `docker network inspect <network_name>`: Inspect a network
- `docker network rm <network_name>`: Remove a network
- `docker network prune`: Remove all unused networks
- `docker run -it --network=<network_name> <image_name>`: Create a container with a network
- `docker run -it --network=host <image_name>`: Create a container with the host network
- `docker run -it --network=none <image_name>`: Create a container without network

## Docker Compose

- Docker compose is a tool for defining and running multi-container Docker applications.

- `docker-compose up`: Create and start containers
- `docker-compose up -d`: Create and start containers in background
- `docker-compose down`: Stop and remove containers
- `docker-compose ps`: List all containers
- `docker-compose logs`: Show containers logs
- `docker-compose logs -f`: Show containers logs in real time
- `docker-compose logs <service_name>`: Show a service logs
- `docker-compose logs -f <service_name>`: Show a service logs in real time
- `docker-compose exec <service_name> <command>`: Execute a command inside a running container
- `docker-compose exec <service_name> /bin/bash`: Execute a shell inside a running container
- `docker-compose build`: Build images
- `docker-compose build <service_name>`: Build a service image
- `docker-compose config`: Validate and view the compose file
- `docker-compose config --services`: List all services
- `docker-compose config --volumes`: List all volumes
- `docker-compose config --networks`: List all networks
- `docker-compose config --hash`: Show the compose file hash
- `docker-compose config --quiet`: Only validate the compose file
- `docker-compose config --resolve-image-digests`: Show the compose file hash
- `docker-compose pull`: Pull images
- `docker-compose push`: Push images
- `docker-compose rm`: Remove stopped containers
- `docker-compose stop`: Stop containers
- `docker-compose start`: Start containers
- `docker-compose restart`: Restart containers
- `docker-compose kill`: Kill containers
- `docker-compose pause`: Pause containers
- `docker-compose unpause`: Unpause containers
