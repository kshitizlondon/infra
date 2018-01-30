## Overview
This README describes how to deploy GitLab in Kubernetes using CLI or directlty from Kubernetes master host.

### Requirements
* You need have root access to master host.
* Make sure Kubernetes cluster was created and nodes are availible.

```sh
$ kubectl cluster-info
```

```sh
$ kubectl get nodes
```

* Make sure following .yaml files created and locate on master host:   
configmap.yaml   
deployment.yaml   
pvc-etc-data-logs.yaml   
pvc-logs-reconfigure.yaml   
pv-etc-data-logs.yaml   
pv-logs-reconfigure.yaml   


### Deployment
All commands should be run by root. Navigate to directory with .yaml files first.

* Create new namespace with name `gitlab`:

```sh
$ kubectl create namespace gitlab
```
Make sure namespace was created:
```sh
$ kubectl get namespaces
```

* Create persistence volumes:
 
```sh
$ kubectl create -f pv-etc-data-logs.yaml --namespace=gitlab
$ kubectl create -f pv-logs-reconfigure.yaml --namespace=gitlab
```

Make sure persistent volumes were created:
```sh
$ kubectl get pv --namespace=gitlab
```
* Create persistence volume claims:   

```sh
$ kubectl create -f pvc-etc-data-logs.yaml --namespace=gitlab
$ kubectl create -f pvc-logs-reconfigure.yaml --namespace=gitlab
```

Make sure persistent volumes claims were created:
```sh
$ kubectl get pvc --namespace=gitlab
```

* Create config map: 
```sh
$ kubectl create -f configmap.yaml --namespace=gitlab
```
Make sure config map was created:
```sh
$ kubectl get cm --namespace=gitlab
```

* Create deployment:
```sh
$ kubectl create -f deployment.yaml --namespace=gitlab
```
Deployment, replica set and pod should be created. It can take up to 5 minutes.
Make sure all the instances were created:
```sh
$ kubectl get deployment --namespace=gitlab
$ kubectl get rs --namespace=gitlab
$ kubectl get po --namespace=gitlab
```

* Create service:
```sh
kubectl expose deployment gitlab --type=LoadBalancer --name=gitlab --namespace=gitlab
```

* GitLab should be reachable on http://10.224.22.17:10080
