FROM ghcr.io/cirruslabs/flutter:stable AS build-env
RUN mkdir /app/
COPY . /app/
WORKDIR /app/
RUN flutter build web
FROM nginx:1.21.1-alpine
COPY --from=build-env /app/build/web /usr/share/nginx/html
