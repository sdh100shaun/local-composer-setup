FROM php:7.1-alpine
RUN mkdir /.composer
RUN mkdir /.composer/cache/
RUN chmod -R 777 /.composer
RUN apk update && apk add bash git openssh rsync tini
EXPOSE 22
COPY --from=composer:latest usr/bin/composer /usr/bin/composer

COPY docker-entrypoint.sh /docker-entrypoint.sh

RUN chmod 755 /docker-entrypoint.sh

WORKDIR /app

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["composer"]




