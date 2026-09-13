# AGENTS.md

Guidance for coding agents working on resume.

## Project Overview

Static web presentation of Nat Welch's resume, served via Nginx in Docker.

## Commands

```sh
docker build -t resume .          # Build container image
python3 -m http.server 8080       # Preview static site locally
```

## Architecture & Layout

- `index.html` — Resume HTML document and content.
- `css/`, `js/` — Stylesheets and client scripts.
- `Dockerfile` — Nginx container definition serving static files.

## Conventions

- PR titles and commits must follow Conventional Commits with lowercase subjects.
