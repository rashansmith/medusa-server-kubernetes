#!/bin/bash

# Start minikube
minikube start

# Configure minikube to read local docker images
eval $(minikube docker-env)

# Build backend container image
docker build -t backend:starter .

# Deploy kubernetes resources 
cd kubernetes
kubectl apply -f .

# Expose the backend 
# kubectl expose deployment backend --name=backend-public --type=LoadBalancer --port=9000

# Get the backend url for testing
minikube service backend --url
