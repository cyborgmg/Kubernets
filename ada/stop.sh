#!/bin/bash

kubectl delete hpa java

kubectl delete -f nginx/

kubectl delete -f java/

kubectl delete -f postgres/

kubectl delete -f redis/