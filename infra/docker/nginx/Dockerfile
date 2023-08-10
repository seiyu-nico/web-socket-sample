FROM nginx:1.25.1-alpine

WORKDIR /data

ENV TZ=UTC

COPY ./infra/docker/nginx/*.conf /etc/nginx/conf.d/
