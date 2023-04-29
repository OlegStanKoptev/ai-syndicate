FROM node:16.13.2-alpine
WORKDIR /usr/src/app
COPY . ./
RUN npm ci
RUN npm run validate
RUN DATABASE_URL="postgresql://syndycate2022vkr:YhP*x5xzQTNkZgcf@167.86.72.50:5432/syndycate2022vkr?schema=public" npx prisma migrate reset --force
RUN npm run build
CMD ["sh", "-c", "PORT=80 DATABASE_URL=postgresql://syndycate2022vkr:YhP*x5xzQTNkZgcf@167.86.72.50:5432/syndycate2022vkr?schema=public SESSION_SECRET=aa65f665ceb2626641a9ce7901b73f37 npm start"]
