FROM ruby:2.6.3-alpine
WORKDIR /opt
ENV LANG C.UTF-8
RUN apk add --no-cache git build-base libxml2-dev libxslt-dev

COPY . .
RUN bundle install
RUN bundle exec middleman build

FROM nginx:latest
COPY nginx.conf /etc/nginx/conf.d/default.conf
WORKDIR /usr/share/nginx/html
COPY --from=0 /opt/build/ .
RUN ls -alh
EXPOSE 8080
