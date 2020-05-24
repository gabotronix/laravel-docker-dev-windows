@ECHO OFF
TITLE Laravel Development Environment via Docker
docker-compose build
docker-compose up -d
docker exec laravel composer install
docker exec laravel php artisan key:generate
docker exec laravel php artisan migrate
ECHO Installation is finished. Access the Laravel page from your web browser at http://localhost:8383/
PAUSE