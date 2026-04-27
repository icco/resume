FROM nginx:1.29-alpine

LABEL org.opencontainers.image.source=https://github.com/icco/resume
LABEL org.opencontainers.image.description="Nat Welch's resume; a static HTML/CSS site served at resume.natwelch.com."
LABEL org.opencontainers.image.licenses=AGPL-3.0
COPY nginx.conf /etc/nginx/conf.d/default.conf
WORKDIR /usr/share/nginx/html
COPY . .
RUN ls -alh
EXPOSE 8080
