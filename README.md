# DevOps
This repository is the DevOps for the inventory application. Here you can find 
the files for CI/CD.

The CI was implemented with Jenkins (maybe we will change it to GitHub Action 
in the future).

The CD was implemented with Argo CD.

## Jenkins
The Jenkins server must have docker installation in it.

## Argo CD
Please get into the directory `argocd`:
```commandline
cd argocd
```

### Install Argo CD
To add Argo to your k8s cluster, use the script `install_argocd_in_k8s.sh`. This script 
creates a new namespace `argocd` and applies the Argo CD installation in it. 

If installation ended OK, you will see the credentials and the port-forward 
command to execute.

```commandline
*** Login detail ***
Username: admin
Password: tfb............5

To connect to the ArgoDB run the following command:
    kubectl port-forward svc/argocd-server -n argocd 8880:443

After that you can login the Argo CD UI: http://localhost:8880/
```

You can use other port than `8880`. You can also set the environment 
variable `ARGO_CD_PORT` with other value, so the installation script 
will use it.

### Install Argo CD CLI
If you don't have Argo CLI yet on your machine, please install it.

For mac, use the following command:
```commandline
brew install argocd
```

### Apply the inventory application
Use the script `create_argocd_inventory_app.sh` to apply the inventory 
application. If the appliance ended OK, you will see the list of the
applications and also the details of the inventory application.

You can also get into the Argo UI (http://localhost:8880/) to see the 
application sync status.
