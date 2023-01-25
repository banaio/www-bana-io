---
title: "MetalLB: Configuration for minikube"
date: "2023-01-25"
tags: ["blog", "kubernetes", "minikube", "loadbalancer", "linux"]
type: post
permalink: /blog/metallb-configuration-for-minikube
---

# {{ $frontmatter.title }}

This post is about how to configure [MetalLB](https://metallb.universe.tf) for [`minikube`](https://minikube.sigs.k8s.io).

## Prerequisites

* `minikube`.
* `kubectl`.
* Linux, most likely - I haven't tested this on Mac OS, Windows or any other OS for that matter.

### Installing Prerequisites

These commands assume you're on Linux:

```sh
cd /tmp
# Install `minikube`
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-$([ $(uname -m) = "aarch64" ] && echo "arm64" || echo "amd64")
chmod +x minikube
sudo mkdir -p /usr/local/bin/
sudo install minikube /usr/local/bin/
# Install `kubectl`
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/$([ $(uname -m) = "aarch64" ] && echo "arm64" || echo "amd64")/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
```

## Start `minikube`

```sh
$ minikube start --addons=metallb
😄  minikube v1.26.1 on Fedora 37
✨  Automatically selected the docker driver. Other choices: kvm2, ssh, qemu2 (experimental)
❗  docker is currently using the btrfs storage driver, consider switching to overlay2 for better performance
📌  Using Docker driver with root privileges
👍  Starting control plane node minikube in cluster minikube
🚜  Pulling base image ...
🔥  Creating docker container (CPUs=2, Memory=16000MB) ...
🐳  Preparing Kubernetes v1.24.3 on Docker 20.10.17 ...
    ▪ Generating certificates and keys ...
    ▪ Booting up control plane ...
    ▪ Configuring RBAC rules ...
🔎  Verifying Kubernetes components...
    ▪ Using image gcr.io/k8s-minikube/storage-provisioner:v5
    ▪ Using image metallb/speaker:v0.9.6
    ▪ Using image metallb/controller:v0.9.6
🌟  Enabled addons: storage-provisioner, metallb, default-storageclass
🏄  Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default
$ minikube ip
192.168.58.2
$ kubectl get svc -A
NAMESPACE     NAME         TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)                  AGE
default       kubernetes   ClusterIP   10.96.0.1    <none>        443/TCP                  110s
kube-system   kube-dns     ClusterIP   10.96.0.10   <none>        53/UDP,53/TCP,9153/TCP   109
```

## Configure

### Create a `Deployment`

**NB**: The `hello-minikube` service `EXTERNAL-IP` is still in a `<pending>` state.

```sh
$ kubectl create deployment hello-minikube --image=kicbase/echo-server:1.0
deployment.apps/hello-minikube created
$ kubectl expose deployment hello-minikube --type=LoadBalancer --port=80 --target-port=8080
service/hello-minikube exposed
$ kubectl get svc -A
NAMESPACE     NAME             TYPE           CLUSTER-IP       EXTERNAL-IP   PORT(S)                  AGE
default       hello-minikube   LoadBalancer   10.102.155.163   <pending>     80:32764/TCP             2s
default       kubernetes       ClusterIP      10.96.0.1        <none>        443/TCP                  8m52s
kube-system   kube-dns         ClusterIP      10.96.0.10       <none>        53/UDP,53/TCP,9153/TCP   8m51s
```

### Fixing the `Deployment`

```sh
$ configure_metallb_for_minikube() {
  # determine load balancer ingress range
  CIDR_BASE_ADDR="$(minikube ip)"
  INGRESS_FIRST_ADDR="$(echo "${CIDR_BASE_ADDR}" | awk -F'.' '{print $1,$2,$3,2}' OFS='.')"
  INGRESS_LAST_ADDR="$(echo "${CIDR_BASE_ADDR}" | awk -F'.' '{print $1,$2,$3,255}' OFS='.')"
  INGRESS_RANGE="${INGRESS_FIRST_ADDR}-${INGRESS_LAST_ADDR}"

  CONFIG_MAP="apiVersion: v1
kind: ConfigMap
metadata:
  namespace: metallb-system
  name: config
data:
  config: |
    address-pools:
    - name: default
      protocol: layer2
      addresses:
      - $INGRESS_RANGE"

  # configure metallb ingress address range
  echo "${CONFIG_MAP}" | kubectl apply -f -
}
$ configure_metallb_for_minikube
configmap/config configured
```

Check if the `hello-minikube` service `EXTERNAL-IP` is still in a `<pending>` state:

```sh
kubectl get svc -A
NAMESPACE     NAME             TYPE           CLUSTER-IP       EXTERNAL-IP    PORT(S)                  AGE
default       hello-minikube   LoadBalancer   10.102.155.163   192.168.58.2   80:32764/TCP             6m
default       kubernetes       ClusterIP      10.96.0.1        <none>         443/TCP                  14m
kube-system   kube-dns         ClusterIP      10.96.0.10       <none>         53/UDP,53/TCP,9153/TCP   14m
```

We can see that as a result of calling `configure_metallb_for_minikube` is that we now have an `EXTERNAL-IP` - `192.168.58.2`.

### Testing the `Deployment`

```sh
$ curl -v 192.168.58.2
*   Trying 192.168.58.2:80...
* Connected to 192.168.58.2 (192.168.58.2) port 80 (#0)
> GET / HTTP/1.1
> Host: 192.168.58.2
> User-Agent: curl/7.85.0
> Accept: */*
>
* Mark bundle as not supporting multiuse
< HTTP/1.1 200 OK
< Content-Type: text/plain
< Date: Wed, 25 Jan 2023 16:51:27 GMT
< Content-Length: 122
<
Request served by hello-minikube-6496f4fd45-hv4l9

HTTP/1.1 GET /

Host: 192.168.58.2
Accept: */*
User-Agent: curl/7.85.0
* Connection #0 to host 192.168.58.2 left intact
```

So judging by the result - `Request served by hello-minikube-6496f4fd45-hv4l9` - it all worked.
