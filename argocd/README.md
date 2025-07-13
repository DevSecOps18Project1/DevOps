# Argo CD

The CD was implemented with Argo CD.

## Install Argo CD

To add Argo to your k8s cluster, use the script `install_argocd_in_k8s.sh`. This script
creates a new namespace `argocd` and applies the Argo CD installation in it.

If installation ended OK, you will see the credentials and the port-forward
command to execute.

```
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

## Install Argo CD CLI

If you don't have Argo CLI yet on your machine, please install it.

For macOS, use the following command:

```commandline
brew install argocd
```

## Apply the inventory application

Before applying the deployment, please, **login to Argo CLI**:

```commandline
argocd login localhost:8880
```

You will have to approve you don't use certificate, and then to put
your username and the password form ***Install Argo CD***.

Use the script `create_argocd_inventory_app.sh` to apply the inventory
application. If the appliance ended OK, you will see the list of the
applications and also the details of the inventory application.

You can also get into the Argo UI (http://localhost:8880/) to see the
application sync status.
