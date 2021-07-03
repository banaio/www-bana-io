---
title: "Go Language Server: using golsp or bingo"
date: "2019-02-14"
tags: ["blog"]
type: post
permalink: /blog/go-language-server
---

# Go Language Server: using golsp or bingo <Badge text="needs updating" type="warn"/>

How to setup `vscode-go` to use [`golsp`](https://github.com/golang/tools/tree/master/cmd/gopls) or [`bingo`](https://github.com/saibing/bingo).

## `golsp`

### install

```bash
$ go get -u golang.org/x/tools/...
$ go get -u golang.org/x/tools/cmd/golsp/...
$ which golsp
/Users/mbana/go/bin/golsp
```

### `settings.json`

```json
...
  "go.useLanguageServer": true,
  "go.alternateTools": {
    "go-langserver": "golsp",
  },
  "go.languageServerFlags": [
  ],
  "go.languageServerExperimentalFeatures": {
    "format": true,
    "autoComplete": true,
  },
...
```

## `bingo`

### install

```bash
$ go get -u github.com/saibing/bingo
$ which bingo
/Users/mbana/go/bin/bingo
```

### `settings.json`

```json
...
  "go.useLanguageServer": true,
  "go.alternateTools": {
    "go-langserver": "bingo",
  },
  "go.languageServerFlags": [
    "-trace",
    "-enhance-signature-help",
    "-format-style=goimports",
  ],
  "go.languageServerExperimentalFeatures": {
    "format": true,
    "autoComplete": true,
  },
...
```

## References

* <https://github.com/saibing/bingo>, in particular see it's wiki page: <https://github.com/saibing/bingo/wiki>.
* <https://github.com/sourcegraph/go-langserver>
* <https://github.com/golang/tools/tree/master/cmd/gopls>
