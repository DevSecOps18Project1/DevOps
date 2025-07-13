# Minikube

We used Minikube during the development.

## Install Minikube

There are some differences between Linux and macOS.

### Install Minikube on macOS

If you install minikube with the default definitions (driver=docker), when you will try to use
k8s-ingress for the flask application, there will be performance issue.

NOTE: When the minikube driver is docker, you cannot reach the minikube IP address from the host.
Because fo that, you also cannot get to the port of NodePort service.
In this case you need to set a port forward.
Alternatively, you can run the command `minikube service <service-name>`.

You can try to allocate more resources to the VM:

```commandline
minikube start --driver=docker --cpus=4 --memory=8192mb
```

You may get an error (like I got):

```commandline
Exiting due to MK_USAGE: Docker Desktop has only 7837MB memory but you specified 8192MB
```

In this case you should install minikube with qemu as a driver. First of all we need to install `qemu`:

```commandline
brew install qemu
```

Then we need to install and activate `socket_vmnet`:

```commandline
brew install socket_vmnet
brew services start socket_vmnet
```

Now we are ready to activate minikube:

```commandline
minikube start --driver=qemu --network=socket_vmnet --cpus=4 --memory=8192mb
```

NOTE: Using the driver `qemu`, the minikube act like Linux. Which means you can reach
the minikube IP address from the host.

To use k8s-ingress, we need to enable it in minikube:

```commandline
minikube addons enable ingress
```

To verify is fine, run the following command and make suer `ingress-nginx-controller-xxxxxxxxx-xxxxx` state is `Running`.

```commandline
kubectl get pods -n ingress-nginx
```

To deploy ingress, we used the following doc:
https://kubernetes.io/docs/tasks/access-application-cluster/ingress-minikube/

To see the minikube profile run:

```commandline
minikube profile list
```

The result look like this:

```
|----------|-----------|---------|---------------|------|---------|--------|-------|----------------|--------------------|
| Profile  | VM Driver | Runtime |      IP       | Port | Version | Status | Nodes | Active Profile | Active Kubecontext |
|----------|-----------|---------|---------------|------|---------|--------|-------|----------------|--------------------|
| minikube | qemu2     | docker  | 192.168.105.2 | 8443 | v1.33.1 | OK     |     1 | *              | *                  |
|----------|-----------|---------|---------------|------|---------|--------|-------|----------------|--------------------|
```
