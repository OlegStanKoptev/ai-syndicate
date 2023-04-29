#Stage 1 - Install dependencies and build the app in a build environment
FROM ghcr.io/cirruslabs/flutter:stable AS build-env
# Copy files to container and build
RUN mkdir /app/
COPY . /app/
WORKDIR /app/
RUN flutter build web
# Stage 2 - Create the run-time image
FROM nginx:1.21.1-alpine
COPY --from=build-env /app/build/web /usr/share/nginx/html
