FROM ruby:2.6.2-alpine
WORKDIR /opt
ENV LANG C.UTF-8
RUN apk add --no-cache git g++ musl-dev make libstdc++
COPY . .
RUN bundle install
RUN ls -alh
RUN bundle exec middleman build

FROM nginx:latest
COPY nginx.conf /etc/nginx/conf.d/default.conf
WORKDIR /usr/share/nginx/html
COPY --from=0 /opt/build/ .
RUN ls -alh
EXPOSE 8080
