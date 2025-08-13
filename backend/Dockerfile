FROM node:20-alpine
RUN apk update && apk add --no-cache python3 make g++
WORKDIR /app/backend
COPY package.json .
COPY package-lock.json .
RUN npm install --loglevel=error
COPY . .
RUN chmod +x ./develop.sh
ENTRYPOINT ["./develop.sh", "develop"]