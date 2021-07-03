---
title: "Docker and Docker Compose: Tips"
date: "2018-08-23"
tags: ["blog"]
type: post
permalink: /blog/docker-tips
---
# Docker and Docker Compose: Tips

## Miscellaneous Links

* [Best Practices for Building Containers](https://cloud.google.com/solutions/best-practices-for-building-containers)
* [Best Practices for Operating Containers](https://cloud.google.com/solutions/best-practices-for-operating-containers)
* [Kubernetes best practices: How and why to build small container images](https://cloud.google.com/blog/products/gcp/kubernetes-best-practices-how-and-why-to-build-small-container-images)

## Don't use port `80`

Use a non-root user if possible, that is, if a service can run on a port > 1024 then there is no need to run the service as the `root` user. See:

* [Dockerfile reference for the USER instruction](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#user)
* [Just say no to root (in containers)](https://opensource.com/article/18/3/just-say-no-root-containers)

## Debugging the `.dockerignore` file

Interested in seeing what files get copied into the build context? Well this tool, https://github.com/pwaller/docker-show-context, will do just that. Install `go` then run the below commands:

```bash
$ go get -v -u github.com/pwaller/docker-show-context
$ cd ~/dir-containing-dockerfile
$ docker-show-context

Scanning local directory (in tar / on disk):
  390 / 65837 (24 / 397 MiB) (0.1s elapsed) .. completed

Excluded by .dockerignore: 65447 files totalling 373.03 MiB

Final .tar:
  390 files totalling 23.79 MiB (+ 0.28 MiB tar overhead)
  Took 0.09 seconds to build

Top 10 directories by time spent:
   15 ms: rel
    8 ms: .
    6 ms: apps/compliance_web/assets
    3 ms: apps/compliance_web/assets/src
    3 ms: apps/compliance_web/assets/src/store/modules/user
    2 ms: apps/compliance_web/priv
    2 ms: e2e/cypress/fixtures
    2 ms: e2e/.Trash-0/info
    2 ms: apps/compliance/lib/compliance/validation_runs
    2 ms: apps/compliance_web/assets/src/plugins

Top 10 directories by storage:
  21.15 MiB: .
   0.63 MiB: apps/compliance_web/assets
   0.17 MiB: e2e/.Trash-0/files/c2503cca-9b6a-4fde-88c2-2874cd66227b
   0.15 MiB: e2e/.Trash-1000/files/1269b7a2-5956-4fbf-bf99-5c3cbccd9f6a
   0.15 MiB: e2e/.Trash-1000/files/5d1392d4-7597-4227-9d2d-ff66dfa3a7f4
   0.12 MiB: e2e/.Trash-1000/files/87aff40c-d9c2-4ea7-8708-762822076a17
   0.12 MiB: e2e/.Trash-0/files/2bd048a2-9899-4f43-a19e-b8c8a7e59c3c
   0.10 MiB: e2e/.Trash-0/files/2883ca0d-3e9b-4af5-923c-1decf7673c0a
   0.10 MiB: apps/compliance_web/priv
   0.09 MiB: e2e/.Trash-0/files/34e1d963-7842-49ac-b961-a85fa91d5575

Top 10 directories by file count:
   21: .
   13: apps/compliance_web/priv
   13: apps/compliance/lib/compliance/validation_runs
   12: e2e/.Trash-0/info
   10: apps/compliance_web/assets/src/store/modules/config
   10: apps/compliance/test/compliance/validation_runs
   10: apps/compliance_web/assets/src/store/modules/user
   10: apps/compliance_web/assets/src/store/modules/reporter
   10: apps/compliance_web/assets/src/components
   10: apps/compliance_web/assets/src/store/modules/validations

Top 10 file extensions by storage:
  21.10 MiB: .log
   1.08 MiB: .mp4
   0.73 MiB: .json
   0.41 MiB: .png
   0.17 MiB: .js
   0.12 MiB: .exs
   0.09 MiB: .ex
   0.01 MiB: .yml
   0.01 MiB: .vue
   0.01 MiB: .md

```

## Multiline `command` in `docker-compose.yml`

I prefer the first form but both work:

```yaml
version: "3"
services:
  e2e:
    image: cypress/base:8
    container_name: e2e
    hostname: e2e
    networks:
      - openbanking_network
    volumes:
      - ${BITBUCKET_CLONE_DIR:-.}/e2e:/root/e2e
    command:
      - /bin/bash
      - -cx
      - |
        cd /root/e2e
        CI=true npm install
        npm run cypress -- verify
        EXIT_CODE=$$?
        if [[ $$EXIT_CODE -ne 0 ]]; then
          CI=true npm run cypress -- install --force
        fi
        npm run headless
```

or

```yaml
version: "3"
services:
  e2e:
    image: cypress/base:8
    container_name: e2e
    hostname: e2e
    volumes:
      - ${BITBUCKET_CLONE_DIR:-.}/e2e:/root/e2e
    command: |
      /bin/bash -cx '
        cd /root/e2e
        CI=true npm install
        npm run cypress -- verify
        EXIT_CODE=$$?
        if [[ $$EXIT_CODE -ne 0 ]]; then
          CI=true npm run cypress -- install --force
        fi
        npm run headless
      '
```
