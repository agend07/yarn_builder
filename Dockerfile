FROM php:7.3-fpm

RUN apt-get update > /dev/null && apt-get install -y --no-install-recommends \
    git \
    gnupg \
    libzip-dev \
    libpng-dev \
    unzip \
    nano > /dev/null

# Install missing extensions
RUN docker-php-ext-install zip
RUN docker-php-ext-install gd

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer > /dev/null

# Install Node.js
RUN apt-get update || apt-get update
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - &&  apt-get install -y nodejs

# Install Gulp
RUN npm install --global gulp-cli

RUN apt-get update || apt-get update
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install yarn

# Install Xdebug
RUN pecl install xdebug-2.7.2 > /dev/null && docker-php-ext-enable xdebug > /dev/null

