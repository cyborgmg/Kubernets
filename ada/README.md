minikube start

minikube addons enable metrics-server

minikube dashboard &

START ===================================================================================

kubectl create -f redis/redis-configmap.yaml 
kubectl create -f redis/redis-storage.yaml 
kubectl create -f redis/redis-deployment.yaml 
kubectl create -f redis/redis-service.yaml 

kubectl create -f postgres/postgres-configmap.yaml 
kubectl create -f postgres/postgres-storage.yaml 
kubectl create -f postgres/postgres-deployment.yaml 
kubectl create -f postgres/postgres-service.yaml 

#kubectl get pods
#kubectl port-forward <your-primary-pod-name> 13000:5432 &
#psql -h localhost -p 13000 -U postgres postgres
#postgres=# \du

kubectl create -f java/java-configuration.yaml
kubectl create -f java/java-deployment.yaml
kubectl create -f java/java-services.yaml 
kubectl autoscale deployment java --cpu-percent=20 --min=1 --max=20
minikube service java-service --url

kubectl create -f nginx/nginx-configuration.yaml
kubectl create -f nginx/nginx-deployment.yaml
kubectl create -f nginx/nginx-services.yaml 
minikube service nginx --url

STOP ===================================================================================

kubectl delete -f nginx/

kubectl delete -f java/

kubectl delete -f postgres/

kubectl delete -f redis/


