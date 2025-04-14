## Deploying the Sinatra Cats App

### Step 1: Docker Image
Build and push the image:
```bash
docker build -t your-dockerhub-username/cats:1.0.0 .
docker push your-dockerhub-username/cats:1.0.0
```

### Step 2: Deploy via Helm
```bash
helm install cats-app ./helm \
  --set image.tag=1.0.0
```

### Step 3: Verify
```bash
kubectl get pods
kubectl get svc
```