FROM node:alpine as builder 
## builder above is a tag

WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .

RUN npm run build

## This is all above needed for the build process
## We need to copy the /app/build for our prod.

## Now we start the new block which is our run phase

FROM nginx

## here we are copying from builder phase from our /app/build directly to the ngix ROOT HTML DIR
COPY --from=builder /app/build /usr/share/nginx/html



