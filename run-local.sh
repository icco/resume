#! /bin/sh

open http://localhost:8080
docker build . -t tmp && docker run -p 8080:8080 tmp
