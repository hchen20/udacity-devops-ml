#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath="hchen1991/udacity-ml"


# Step 2
# Run the Docker Hub container with kubernetes
kubectl run --image=$dockerpath:1.0 udacity-ml-app --port=80

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
pod_name=$(kubectl get pods -o jsonpath="{.items[0].metadata.name}")
kubectl port-forward $pod_name 8000:80
