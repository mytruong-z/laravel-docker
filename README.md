- Laravel v11.0.8
- PHP v8.2.17
- MySql 8
- Docker
- Nginx

/**
 * Setup
 */
``shell
docker-compose up --build -d
docker-compose exec app
docker exec -it intercom-toole bash
``

/**
 * Install
 */
``shell
composer install
cp .env.example .env
php artisan key:generate
php artisan migrate
php artisan db:seed
``

/**
 * Run
 */
``shell
http://localhost:8001/
``

/**
 * Test
 */
``shell
php artisan test
``

/**
 * Logs
 */
``shell
- Check the logs:
docker logs nginx
docker logs app
docker logs db

- Check the ports:
sudo lsof -i :8001
``