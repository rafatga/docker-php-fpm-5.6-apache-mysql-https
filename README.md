# Introduction
I created this repository for other developers who may be looking to build this a similar dev infra.
(php-fpm 5.6, apache, mysql, https)

# Images
* httpd:2.4-alpine
* mariadb:10
* php:5.6-fpm-alpine
* lscr.io/linuxserver/phpmyadmin:latest

### Apache modules enabled
* socache_shmcb_module
* mod_headers
* ssl_module
* expires_module
* rewrite_module
* mod_deflate
* mod_proxy
* mod_proxy_fcgi

# Features
*The following modules are enabled by this image in addition to what the official php docker images provide*
### Modules enabled
* bash
* zip 
* unzip 
* curl 
* nodejs 
* npm

### PHP Modules enabled
* apcu
* bcmath
* bz2
* exif
* gd
* gmp
* iconv
* imagick
* intl
* mcrypt
* mysqli
* pdo_mysql
* pdo_pgsql
* pgsql
* redis
* soap
* ssh2
* xdebug
* zend-opcache
* zip

### Default PHP ini settings 
```
memory_limit = 512M
date.timezone = Europe/Paris
```

# Usage
### Start containers
```
make dev
site -> https://localhost/
phpmyadmin -> http://localhost:8081/
```
### Get into container
```
make enter
```
### Stop container
```
make kill
```
### Stop & delete container
```
make nodev
```

# Specifying containers name, database name, etc...
```
ops/docker/.env
```

# Default database imported
```
ops/docker/mysql/sample/schema.sql
```

# Specifying custom php.ini, php-fpm.conf & xdebug.ini settings
```
ops/docker/php/config/php.ini
ops/docker/php/config/php-fpm.conf
ops/docker/php/config/xdebug.ini
```

# Specifying a custom Apache vhost
```
ops/docker/apache/config/apache.vhost.conf
ops/docker/apache/config/httpd-ssl.conf
```

# Specifying a OpenSSH certificates
```
ops/docker/apache/certificates/certificate.pem
ops/docker/apache/certificates/certificate-key.pem
```
You can generate your own self-Signed Certificate:
```
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout selfsigned.key -out selfsigned.crt
```
