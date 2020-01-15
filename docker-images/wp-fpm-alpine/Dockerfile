FROM wordpress:fpm-alpine

RUN apk add --no-cache libmemcached-dev ${PHPIZE_DEPS} zlib-dev \
    && pecl install memcached \
    && docker-php-ext-enable memcached \
    && apk del ${PHPIZE_DEPS}
