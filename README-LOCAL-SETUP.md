# Local Kubernetes Setup (No Cloud Required)

## Option 1: Docker Desktop with Kubernetes
1. Install Docker Desktop (free)
2. Enable Kubernetes in Docker Desktop settings
3. Deploy your app locally

## Option 2: Minikube
```bash
# Install Minikube
choco install minikube -y

# Start local cluster
minikube start

# Use Docker daemon from Minikube
eval $(minikube docker-env)

# Build and run locally
docker build -t doctor-app:latest -f docker/Dockerfile .
kubectl apply -f k8s/
```

## Option 3: Kind (Kubernetes in Docker)
```bash
# Install Kind
choco install kind -y

# Create cluster
kind create cluster

# Build and deploy
docker build -t doctor-app:latest -f docker/Dockerfile .
kind load docker-image doctor-app:latest
kubectl apply -f k8s/
```

## Benefits
- No credit card required
- No cloud costs
- Full Kubernetes experience
- Perfect for learning and development
