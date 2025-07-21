FROM node:20-alpine
WORKDIR /app/storefront
COPY package.json .
COPY package-lock.json .
RUN apk update && apk add --no-cache python3 make g++
RUN npm install -g npm@latest
RUN npm install --loglevel=error
COPY . .
RUN npm run build
EXPOSE 8000
CMD ["npm", "run", "start"]