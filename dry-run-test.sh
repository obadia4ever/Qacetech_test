#!/bin/bash
set -e

NAMESPACE="cats-test"
IMAGE_TAG="dryrun"
RELEASE_NAME="cats-app"

# Create namespace
kubectl create namespace $NAMESPACE || true

# Helm template dry-run
helm template $RELEASE_NAME ./helm \
  --namespace $NAMESPACE \
  --set image.repository=dummy/cats \
  --set image.tag=$IMAGE_TAG \
  --set replicaCount=2 \
  --dry-run --debug

# Deploy to test namespace
helm install $RELEASE_NAME ./helm \
  --namespace $NAMESPACE \
  --set image.repository=dummy/cats \
  --set image.tag=$IMAGE_TAG

# Wait and verify
kubectl get pods -n $NAMESPACE
kubectl rollout status deployment/$RELEASE_NAME -n $NAMESPACE

# Cleanup
helm uninstall $RELEASE_NAME -n $NAMESPACE
kubectl delete namespace $NAMESPACE
