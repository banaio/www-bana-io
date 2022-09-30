# `www-bana-io`

[![Netlify Status](https://api.netlify.com/api/v1/badges/79a33623-c57c-489d-a9be-1ce5105f5a0f/deploy-status)](https://app.netlify.com/sites/www-bana-io/deploys)

* [`https://bana.io`](https://bana.io)
* [`https://www.bana.io`](https://www.bana.io)
* [`http://bana.io`](http://bana.io)
* [`http://www.bana.io`](http://www.bana.io)
* [`https://www-bana-io.netlify.app/`](https://www-bana-io.netlify.app/)

## Run

```sh
git clone git@github.com:banaio/www-bana-io.git
cd www-bana-io
yarn install --frozen-lockfile
source ./.env && yarn docs:dev
... # Make changes
yarn lint-md
```

---

# `openssl.conf`

See:

1. <https://stackoverflow.com/a/69476335/16361002>.
2. <https://stackoverflow.com/questions/72866798/node-openssl-legacy-provider-is-not-allowed-in-node-options>.

I.e.,

```
[provider_sect]
default = default_sect
legacy = legacy_sect

[default_sect]
activate = 1

[legacy_sect]
activate = 1
```

vs `export OPENSSL_CONF=./openssl.conf` and `./openssl.conf` containing:

```
openssl_conf = openssl_init

[openssl_init]
providers = provider_sect

[provider_sect]
default = default_sect
legacy = legacy_sect

[default_sect]
activate = 1

[legacy_sect]
activate = 1
```
