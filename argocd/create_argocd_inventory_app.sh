#!/bin/bash

kubectl apply -f inventory-app.yaml -n argocd

argocd app list
argocd app get inventory-app
