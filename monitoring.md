## Monitoring with Prometheus & Grafana

### Step 1: Install Prometheus and Grafana using Helm
```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

# Install Prometheus
helm install prometheus prometheus-community/prometheus

# Install Grafana
helm install grafana grafana/grafana \
  --set adminPassword='admin' \
  --set service.type=LoadBalancer
```

### Step 2: Access Grafana
```bash
kubectl get svc grafana
```
Get the external IP and access via browser. Default login: `admin/admin`

### Step 3: Add Dashboards
- Add Prometheus as a data source in Grafana.
- Use prebuilt dashboards for Kubernetes (ID: `315`) or build custom dashboards.
