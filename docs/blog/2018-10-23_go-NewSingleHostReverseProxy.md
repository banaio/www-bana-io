---
title: "Go: NewSingleHostReverseProxy"
date: "2018-10-23"
tags: ["blog"]
type: post
permalink: /blog/go-NewSingleHostReverseProxy
---
# Go: `NewSingleHostReverseProxy`

HTTPS proxy:

## `main.go`

```go
package main

import (
	"log"
	"net/http"
	"net/http/httputil"
	"net/url"
)

func main() {
	target, err := url.Parse("https://rs.aspsp.ob.forgerock.financial:443")
	log.Printf("forwarding to -> %s%s\n", target.Scheme, target.Host)

	if err != nil {
		log.Fatal(err)
	}
	proxy := httputil.NewSingleHostReverseProxy(target)

	http.HandleFunc("/", func(w http.ResponseWriter, req *http.Request) {
		// https://stackoverflow.com/questions/38016477/reverse-proxy-does-not-work
		// https://forum.golangbridge.org/t/explain-how-reverse-proxy-work/6492/7
		// https://stackoverflow.com/questions/34745654/golang-reverseproxy-with-apache2-sni-hostname-error

		// log.Println("req.Host=", req.Host)
		// log.Println("req.URL.Host=", req.URL.Host)
		req.Host = req.URL.Host

		proxy.ServeHTTP(w, req)
	})

	err = http.ListenAndServe(":8989", nil)
	if err != nil {
		panic(err)
	}
}
```

## build and run

```bash
$ go run main.go &
2018/10/23 19:53:12 forwarding to -> httpsrs.aspsp.ob.forgerock.financial:443
$ curl http://localhost:8989/open-banking/v2.0/accounts
{"Code":"OBRI.FR.Request.Invalid","Id":"c37baec213dd1227","Message":"An error happened when parsing the request arguments","Errors":[{"ErrorCode":"UK.OBIE.Header.Missing","Message":"Missing request header 'x-fapi-financial-id' for method parameter of type String","Url":"https://docs.ob.forgerock.financial/errors#UK.OBIE.Header.Missing"}]}%
```
