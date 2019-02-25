# base image
FROM node:8.15-alpine as builder

# create work dir
WORKDIR /usr/app

#copy 
COPY ./package.json ./

# run commands
RUN npm install

#copy files
COPY ./ ./

RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /usr/app/build /usr/share/nginx/html
