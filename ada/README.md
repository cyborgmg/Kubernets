minikube start

minikube addons enable metrics-server

nohup minikube dashboard &

START ===================================================================================

kubectl create -f redis/configmap.yaml 
kubectl create -f redis/storage.yaml 
kubectl create -f redis/deployment.yaml 
kubectl create -f redis/service.yaml 


kubectl create -f postgres/configmap.yaml 
kubectl create -f postgres/storage.yaml 
kubectl create -f postgres/deployment.yaml 
kubectl create -f postgres/service.yaml 

kubectl get pods

kubectl create -f java/configuration.yaml
kubectl create -f java/deployment.yaml
kubectl create -f java/services.yaml 
kubectl delete hpa ada-api
kubectl autoscale deployment ada-api --cpu-percent=50 --min=1 --max=2
minikube service ada-api --url

kubectl get hpa

kubectl create -f nginx/configuration.yaml
kubectl create -f nginx/deployment.yaml
kubectl create -f nginx/services.yaml 
minikube service ada-front --url

STOP ===================================================================================

kubectl delete hpa ada-api

kubectl delete -f nginx/

kubectl delete -f java/

kubectl delete -f postgres/

kubectl delete -f redis/


