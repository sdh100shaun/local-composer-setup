FROM php:5.6-alpine
RUN mkdir /.composer
RUN mkdir /.composer/cache/
RUN chmod -R 777 /.composer
RUN apk update && apk add bash git openssh rsync
EXPOSE 22
COPY --from=composer:1.5 /usr/bin/composer /usr/bin/composer




