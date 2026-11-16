# AsciiArtify PoC: ArgoCD on k3d

## Requirements

- Docker
- kind
- kubectl

## Create cluster

```bash
k3d cluster create argo
```

## Install ArgoCD

```bash
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl get pods -n argocd -w
```


## Access UI

```bash
kubectl port-forward svc/argocd-server -n argocd 8080:443 &
```

Open https://localhost:8080 (accept the certificate warning).

## Login

User: `admin`

Password:

```bash
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
```

## Cleanup

```bash
k3d cluster delete argo
```
