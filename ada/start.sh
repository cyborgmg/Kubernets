#!/bin/bash

kubectl create -f redis/configmap.yaml 
kubectl create -f redis/storage.yaml 
kubectl create -f redis/deployment.yaml 
kubectl create -f redis/service.yaml 

sleep 2

kubectl create -f postgres/configmap.yaml 
kubectl create -f postgres/storage.yaml 
kubectl create -f postgres/deployment.yaml 
kubectl create -f postgres/service.yaml 

sleep 30
kubectl get pods

kubectl create -f java/configuration.yaml
kubectl create -f java/deployment.yaml
kubectl create -f java/services.yaml 
kubectl delete hpa ada-api
kubectl autoscale deployment ada-api --cpu-percent=50 --min=1 --max=2
minikube service ada-api --url


sleep 2
kubectl get hpa

kubectl create -f nginx/configuration.yaml
kubectl create -f nginx/deployment.yaml
kubectl create -f nginx/services.yaml 
minikube service ada-front --url
