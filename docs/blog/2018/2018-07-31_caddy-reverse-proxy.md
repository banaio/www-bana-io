---
title: "Caddy: Reverse Proxy"
date: "2018-07-31"
tag: ["blog"]
category: ["blog"]
type: post
permalink: /blog/caddy-reverse-proxy
---
# Caddy: Reverse Proxy

[Caddy](https://caddyserver.com/) makes setting up a reverse proxy with [Automatic HTTPS
](https://caddyserver.com/docs/automatic-https) very trivial as the examples below show. They both:

* Proxy all, including WebSocket, traffic from [https://bana.io/api] to a server called `backend` listening on port `8080`, see [http.proxy](https://caddyserver.com/docs/proxy).
* Enables directory browsing, see [http.browse](https://caddyserver.com/docs/browse).
* Enables gzip compression [http.gzip](https://caddyserver.com/docs/gzip).
* Turn on request logging, see [http.log](https://caddyserver.com/docs/log).
* Enable error logging.  Although this isn't strictly needed, it helps to turn it on, see [http.errors](https://caddyserver.com/docs/errors).

## Prerequisites

* Setup DNS records to point to the server that is going to run Caddy. This is the simpler approach and that used in the examples. See [DNS Challenge](https://caddyserver.com/docs/automatic-https#dns-challenge).
* The certificates obtained are stored on disk in the folder `$HOME/.caddy` or, if `$HOME` is not set, in the current working directory of the `caddy` process in a folder named `.caddy`. If you're running Caddy via Docker, it's a good idea to make sure you use volumes for this.

## Development Caddyfile

When you're initially developing it's a good idea to test against the staging/development url, see [Testing, developing, and advanced setups](https://caddyserver.com/docs/automatic-https#testing).  We do this by specifying the `ca` as `https://acme-staging-v02.api.letsencrypt.org/directory`, otherwise it is identical to the production `Caddyfile`.

```Caddyfile
bana.io www.bana.io {
  proxy /api backend:8080 {
    websocket
    transparent
  }

  tls bana@bana.io {
    ca https://acme-staging-v02.api.letsencrypt.org/directory
  }

  log stdout
  errors stderr

  browse
  gzip
}
```

## Production Caddyfile

```Caddyfile
bana.io www.bana.io {
  proxy /api backend:8080 {
    websocket
    transparent
  }

  tls bana@bana.io

  log stdout
  errors stderr

  browse
  gzip
}
```

## Run

Use the [caddy-docker](https://github.com/abiosoft/caddy-docker) Docker image or:

```bash
caddy --conf Caddyfile --log stdout --agree=yes
```
