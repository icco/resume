FROM ruby:3.0.0
WORKDIR /opt
ENV LANG C.UTF-8

# Update bundler
RUN gem install bundler:2.2.16
RUN bundle config set specific_platform true

COPY . .
RUN bundle install
RUN bundle exec middleman build

FROM nginx:alpine
COPY nginx.conf /etc/nginx/conf.d/default.conf
WORKDIR /usr/share/nginx/html
COPY --from=0 /opt/build/ .
RUN ls -alh
EXPOSE 8080
