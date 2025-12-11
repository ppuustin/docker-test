
Intro
==============

This is a simple example project for creating Docker containers
and Kubernetes setups. Docker desktop is a great place to start experimenting,
it including also a standalone Kubernetes server.


```sh
docker build -f Dockerfile -t hello-python:latest .
docker build -t hello-python:latest .
docker build --tag hello-python:latest .
docker run -p 8080:8080 myapp
docker run -p 5001:5000 hello-python
http://localhost:5001
```

```sh
docker run artifactory.<some-domain>.com/<some-dir>/<some-module>
docker container ls
docker images
docker image ls
docker stop <your-image-id>
docker rmi --force <your-image-id>
```

https://kubernetes.io/blog/2019/07/23/get-started-with-kubernetes-using-python/

```sh
kubectl version
kubectl version --output=yaml|json
kubectl get nodes

kubectl apply -f deployment.yaml                 (default namespace)
kubectl get pods
kubectl describe services hello-python
kubectl get deployments

kubectl logs <pod>

kubectl delete services 
kubectl delete deployment 
```

```sh
docker -> registry -> deployment -> pods
Image - file
Container - instance
Cluster - nodes w containers
Node - unit of computing
Pod - smallest deployable unit, one or more containers
Service - enables network access to a set of pods
Deployment - create or modify instances of pods, provides updates to apps.
```

```sh
|--------------------------------------|
| Cluster                              |
|           |------ service --------|  |
| |------|  |----node----| |--node--|  |     
| |master|  | |--pod--|  |             |
| | node |  | ||c| |c||  |             |
| |------|  |------------|             |
|                                      |
|--------------------------------------|
```

```sh
kubectl get pods,services,deployments,jobs,daemonset,replicaset,statefulsets   (statefulset)
kubectl get all
kubectl delete deployments <deployment>
kubectl delete services <services>
kubectl delete pods <pods>
kubectl delete daemonset <daemonset>
kubectl delete all -l app=hello-python
```

OR

https://kodekloud.com/blog/kubectl-delete-deployment/

```sh
kubectl create namespace <namespace>
kubectl create deployment XXX --image=XXX -n=<namespace>

kubectl get deployments
kubectl get deployments -n=<namespace>

kubectl delete deployment XXX
kubectl delete deployment XXX, YYY, ...
kubectl delete deployment --all            (default namespace)
kubectl delete deployment alpine-dev -n=development

kubectl delete deployment --all --all-namespaces
```
OR

```sh
kubectl delete -f ./deployment.yaml
kubectl delete deployment <deployment-name>
kubectl scale deployment <deployment-name> --replicas=0
```

- Kustomize - Kubernetes native configuration management https://kustomize.io/
- Skaffold handles the workflow for building, pushing and deploying your application https://skaffold.dev/
- Kind is a tool for running local Kubernetes clusters https://kind.sigs.k8s.io/

Docker Desktop in Windows

Docker stopped working in Windows after w11 update claiming something like: "virtual machine platform is not supported".
It seems that:
(1) Hyper-V option needs to be selected for Docker (the default WSL option worked previously): 
Deselect “Use WSL2 instead of Hyper-V” and additionally
(2) there is a new 'docker-users' group which needs to be defined and oneself added to it.
Powershell: net localgroup "docker-users" /add "AzureAD\firstname.lastname@domain.com"
