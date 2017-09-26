FROM ruby:2.4.2

COPY . .
RUN bundle install
RUN bundle exec middleman build

FROM nginx:latest

COPY nginx.conf /etc/nginx/conf.d/default.conf
WORKDIR /usr/share/nginx/html
COPY --from=0 build/ .
RUN ls -alh
EXPOSE 8080
