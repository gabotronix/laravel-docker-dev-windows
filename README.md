Work in progress

## A Simple Dockerized Laravel Development Environment for Windows 10 Pro

![laravel-docker-dev-windows](https://user-images.githubusercontent.com/9207205/82763077-731ea700-9e37-11ea-9002-7268133e21a3.png)

***

laravel-docker-dev-windows is a Docker-based package for Docker Desktop that aims to standardize the development and production environments by using the same set of Linux, Apache, MariaDB, and PHP configuration.

* [Requirements](https://github.com/gabotronix/laravel-docker-dev-windows/wiki/Requirements)
* [Installation](https://github.com/gabotronix/laravel-docker-dev-windows/wiki/Installation)
* [Usage](https://github.com/gabotronix/laravel-docker-dev-windows/wiki/Usage)
* Removal/Uninstall

***

**Docker images used in this package:**
- Web Server - [php:7.4-apache](https://hub.docker.com/_/php)
- Composer - [composer:latest](https://hub.docker.com/_/composer)
- Database - [mariadb:latest](https://hub.docker.com/_/mariadb)
- phpMyAdmin - [phpmyadmin/phpmyadmin:latest](https://hub.docker.com/r/phpmyadmin/phpmyadmin)

Disk Usage: approximately 2GB

***

_Credits:_

The configuration files in this package are based on the articles written by:

V Ng:
https://dev.to/veevidify/docker-compose-up-your-entire-laravel-apache-mysql-development-environment-45ea

Erika Heidi:
https://www.digitalocean.com/community/tutorials/how-to-containerize-a-laravel-application-for-development-with-docker-compose-on-ubuntu-18-04
