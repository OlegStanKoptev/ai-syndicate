FROM node:16.13.2-alpine
WORKDIR /usr/src/app
COPY . ./
RUN npm ci
RUN npm run validate
RUN npx prisma migrate reset --force
RUN npm run build
CMD ["sh", "-c", "PORT=80 npm start"]
