FROM nginx:1.29-alpine
COPY nginx.conf /etc/nginx/conf.d/default.conf
WORKDIR /usr/share/nginx/html
COPY . .
RUN ls -alh
EXPOSE 8080
