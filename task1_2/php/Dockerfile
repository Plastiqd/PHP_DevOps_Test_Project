FROM php:8.1-fpm-alpine

# Установка зависимостей и инструментов сборки
RUN apk add --no-cache \
    postgresql-dev \
    autoconf \
    make \
    g++ \
    && docker-php-ext-install pdo pdo_pgsql \
    && pecl install redis \
    && docker-php-ext-enable redis \
    # Удаляем инструменты сборки после установки
    && apk del autoconf make g++

# Установка Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Рабочая директория
WORKDIR /var/www/html

# копируем composer.json
COPY ./src/composer.json ./

# Устанавливаем зависимости (без dev-пакетов)
RUN composer install --no-dev --no-interaction --optimize-autoloader

# Копируем исходный код
COPY ./src/public ./public/
