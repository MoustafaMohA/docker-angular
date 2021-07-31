FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
RUN ls
RUN cd dist
RUN ls

FROM nginx
COPY --from=builder /app/dist/hello /usr/share/nginx/html