FROM node:20-alpine
WORKDIR /app/medusa
COPY package.json .
RUN apk update && apk add --no-cache python3 make g++
RUN npm install -g npm@latest
RUN npm install --loglevel=error
COPY . .
RUN chmod +x ./develop.sh
ENTRYPOINT ["./develop.sh", "develop"]