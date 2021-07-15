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
yarn install --frozen-lockfile
yarn docs:dev
... # Make changes
yarn lint-md
```

--

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
    // old
    "@textlint-rule/textlint-rule-no-unmatched-pair": "^1.0.7",
    "@types/markdown-it": "^0.0.8",
    "@vuepress/plugin-back-to-top": "^1.0.0-rc.1",
    "@vuepress/plugin-nprogress": "^1.0.0-rc.1",
    "@vuepress/plugin-search": "^1.0.0-rc.1",
    "markdown-it": "^9.1.0",
    "remark-cli": "^7.0.0",
    "remark-lint": "^6.0.5",
    "remark-preset-lint-consistent": "^2.0.3",
    "remark-preset-lint-recommended": "^3.0.3",
    "textlint": "^11.3.1",
    "textlint-filter-rule-comments": "^1.2.2",
    "textlint-rule-apostrophe": "^1.0.0",
    "textlint-rule-common-misspellings": "^1.0.1",
    "textlint-rule-diacritics": "^1.0.0",
    "textlint-rule-en-capitalization": "^2.0.2",
    "textlint-rule-stop-words": "^1.0.17",
    "textlint-rule-terminology": "^1.1.30",
    "textlint-rule-write-good": "^1.6.2",
    "vuepress": "^1.1.0",
    // new
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

---

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

---
