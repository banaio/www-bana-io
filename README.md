# `www-bana-io-vue-js`

[![Netlify Status](https://api.netlify.com/api/v1/badges/5d30d5d2-c9b6-433d-9a47-691a83a7704e/deploy-status)](https://app.netlify.com/sites/www-bana-io-vue-js/deploys)

* [`https://www-bana-io`](https://www.bana.io)
* [`https://bana-io`](https://bana.io)
* [`http://bana-io`](http://bana.io)
* [`http://www-bana-io`](http://www.bana.io)
* [`www-bana-io-vue-js`](https://www-bana-io-vue-js.netlify.com/)

## run

```sh
./dev.sh
```

or

```sh
yarn install --frozen-lockfile --non-interactive
yarn docs:dev
```

## Node.js

```json
{
  "name": "www-bana-io-vue-js",
  "description": "https://bana.io",
  "private": true,
  "engines": {
    "node": ">=14.5.0"
  },
  "homepage": "https://github.com/banaio/www-bana-io-vue-js",
  "repository": {
    "type": "git",
    "url": "git@github.com:banaio/www-bana-io-vue-js.git"
  },
  "bugs": {
    "url": "https://github.com/banaio/www-bana-io-vue-js/issues"
  },
  "author": "Mohamed Bana <m@bana.io> and contributors",
  "license": "MIT",
  "scripts": {
    "docs:dev": "vuepress dev docs --cache docs/.cache --temp docs/.temp --no-clear-screen --no-cache --debug",
    "docs:dev2": "FORCE_COLOR=3 NODE_ENV=development VUEPRESS_ENV=developer vuepress dev docs --cache docs/.cache --temp docs/.temp --no-clear-screen --no-cache --debug",
    "docs:dev3": "VUE_CLI_MODERN_MODE=true VUE_CLI_MODERN_BUILD=true VUE_APP_NODE_ENV=development NODE_DEBUG=webpack FORCE_COLOR=3 NODE_ENV=development VUEPRESS_ENV=developer vuepress dev docs --cache docs/.cache --temp docs/.temp --no-clear-screen --debug",
    "docs:build": "vuepress build docs --no-cache --debug"
  },
  "devDependencies": {
    "@vue/cli": "^4.4.6",
    "@vue/cli-service-global": "^4.4.6",
    "markdown-it-footnote": "^3.0.1",
    "markdown-it-katex": "^2.0.3",
    "vuepress": "^v1.0.0-alpha.40"
  },
  "dependencies": {
    "acorn": "^6.4.1",
    "kind-of": "^6.0.3",
    "minimist": "^1.2.3",
    "serialize-javascript": "^2.1.1",
    "websocket-extensions": "^0.1.4"
  }
}
```

## `VuePress`

```sh
# Scaffold VuePress site
yarn create vuepress [directoryName]
# OR npx create-vuepress [directoryName]

# Navigate to your new VuePress directory
cd [directoryName]

# Start local dev server
yarn dev
# OR npm run dev

# Build static files
yarn build
# OR npm run build
```
