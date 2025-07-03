#!/bin/bash

DEFAULT_PORT="8880"
ARGO_CD_PORT="${ARGO_CD_PORT:-$DEFAULT_PORT}"

kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# kubectl get pods -n argocd

echo ""
echo "*** Login detail ***"
echo "Username: admin"
echo "Password: $(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)"
echo ""
echo "To connect to the Argo CD UI, run the following command:"
echo "    kubectl port-forward svc/argocd-server -n argocd $ARGO_CD_PORT:443"
echo ""
echo "After that you can login the Argo CD UI: http://localhost:$ARGO_CD_PORT/"
echo ""
