## EKS Setup (Amazon Elastic Kubernetes Service)

### Prerequisites:
- AWS CLI
- eksctl
- kubectl
- Helm

### Steps:
```bash
# 1. Create EKS cluster
eksctl create cluster \
  --name cats-cluster \
  --region us-west-2 \
  --nodegroup-name standard-workers \
  --node-type t3.medium \
  --nodes 3 \
  --managed

# 2. Update kubeconfig
aws eks --region us-west-2 update-kubeconfig --name cats-cluster

# 3. Confirm access
kubectl get nodes
```