# Rails Dockerized API Backend Skeleton

This is rails api backend skeleton which is dockerized. You can clone it and make few changes and start working.

## Getting Started

### Setting up the Project
In the below listed files files, change all the instance of `backend` with the name of your application. You can also opt to keep it unchanged, but multiple container with same name will casue conflict.

- .backend.env
- Dockerfile
- docker-compose.yml


Also configure .backend.env with proper SECRET_TOKEN

### Setting up the volumes

You will need to create volume which will map to postgresql and redis with following command.
> Note: Change `backend` to your modified name, if applicable.

```bash
docker volume create --name drkiq-postgres
docker volume create --name drkiq-redis
```

### Initialize the database

```bash
docker­-compose run --­­user "$(id ­-u):$(id -­g)" drkiq rake db:reset
docker­-compose run --­­user "$(id ­-u):$(id -­g)" drkiq rake db:migrate
```

### Running

```bash
docker-compose up
```

Binding errors can be occur, they can be resolved.

- Due to local postgresql installation
```bash
sudo pkill postgres
```

- Due to already running docker container
```bash
docker ps
docker kill {image-id}
```
