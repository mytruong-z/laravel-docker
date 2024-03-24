# Project Name
> A short description of your project.

This project is built using Laravel v11.0.8, PHP v8.2.17, MySql 8, Docker, and Nginx. Below you will find detailed instructions on how to set up, install, run, test, and troubleshoot your project environment.

## Prerequisites

Before you begin, ensure you have the following installed on your machine:
- Docker
- PHP v8.2.17 (for local development)
- Ngnix
- MySql 8

## Setup Instructions

### Starting the Docker Environment

To set up your Docker environment, execute the following commands in your terminal:

```shell
docker-compose up --build -d
docker-compose exec app bash
docker exec -it <container_name> bash # Replace <container_name> with your Laravel app's container name.
```
## Application Setup

```shell
composer install
cp .env.example .env  # Copy the example environment file to a new .env file
php artisan key:generate  # Generate a new application key
php artisan migrate  # Run the database migrations
php artisan db:seed  # Seed the database with records
```

## Running the Application

```shell
http://localhost:8081
```

## Monitoring and Troubleshooting
Viewing Logs
To view the logs of your Docker containers, use the following commands:

```shell
docker logs nginx
docker logs app
docker logs db
```

### Checking the Ports

```shell
sudo lsof -i :8001
sudo lsof -i :3306
```