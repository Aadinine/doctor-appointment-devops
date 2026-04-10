# Doctor Appointment Booking System - DevOps Implementation

A complete DevOps implementation of a Doctor Appointment Booking System with containerization, infrastructure as code, Kubernetes deployment, and CI/CD pipelines.

## 🏗️ Project Structure

```
doctor-appointment-devops/
├── app/                    # Flask application
│   ├── app.py
│   ├── requirements.txt
│   ├── templates/
│   ├── static/
│   └── data/
├── docker/
│   ├── Dockerfile
│   └── .dockerignore
├── k8s/                    # Kubernetes manifests
│   ├── namespace.yaml
│   ├── deployment.yaml
│   ├── service.yaml
│   └── mongo-secret.yaml
├── terraform/              # Infrastructure as Code
│   ├── main.tf
│   ├── variables.tf
│   ├── providers.tf
│   └── providers-alternative.tf
├── ansible/                # Configuration Management
│   ├── playbook.yml
│   └── requirements.yml
├── tests/                  # Unit tests
│   ├── test_app.py
│   └── __init__.py
├── ci-cd-template.yml      # GitHub Actions template
└── README.md
```

## 🚀 Features

- **Flask Web Application**: Doctor appointment booking system
- **Containerization**: Docker with health checks
- **Infrastructure as Code**: Terraform for Azure resources
- **Orchestration**: Kubernetes deployment with 2 replicas
- **CI/CD Pipeline**: Automated testing and deployment
- **Configuration Management**: Ansible for deployment automation
- **Health Monitoring**: Liveness and readiness probes
- **Load Balancing**: Kubernetes Service with LoadBalancer

## 📋 Prerequisites

- Docker Desktop
- Terraform
- Azure CLI (for cloud deployment)
- kubectl
- Python 3.9+
- Node.js (for some tools)

## 🛠️ Local Development Setup

### 1. Clone and Setup
```bash
git clone https://github.com/Aadinine/doctor-appointment-devops.git
cd doctor-appointment-devops
```

### 2. Run Flask App Locally
```bash
cd app
pip install -r requirements.txt
python app.py
```

### 3. Build and Run Docker Container
```bash
# Build image
docker build -t doctor-app:latest -f docker/Dockerfile .

# Run container
docker run -d -p 5000:5000 --name doctor-app-test doctor-app:latest

# Test health endpoint
curl http://localhost:5000/health
```

## ☁️ Cloud Deployment (Azure)

### 1. Install Tools
```powershell
# Install Chocolatey (as Administrator)
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Install Terraform and Azure CLI
choco install terraform azure-cli -y
```

### 2. Login to Azure
```bash
az login
```

### 3. Deploy Infrastructure
```bash
cd terraform
terraform init
terraform plan
terraform apply -auto-approve
```

### 4. Push to Azure Container Registry
```bash
# Get ACR credentials from Terraform outputs
ACR_LOGIN_SERVER=$(terraform output -raw acr_login_server)
ACR_USERNAME=$(terraform output -raw acr_admin_username)
ACR_PASSWORD=$(terraform output -raw acr_admin_password)

# Login and push
echo $ACR_PASSWORD | docker login $ACR_LOGIN_SERVER --username $ACR_USERNAME --password-stdin
docker tag doctor-app:latest $ACR_LOGIN_SERVER/doctor-app:latest
docker push $ACR_LOGIN_SERVER/doctor-app:latest
```

### 5. Deploy to Kubernetes
```bash
# Get AKS credentials
az aks get-credentials --resource-group doctor-app-rg --name doctor-app-aks

# Apply manifests
kubectl apply -f k8s/

# Check deployment
kubectl get pods -n doctor-app
kubectl get svc -n doctor-app
```

## 🎯 Local Kubernetes Alternative

If you don't have Azure access, use local Kubernetes:

### Option 1: Docker Desktop
1. Install Docker Desktop
2. Enable Kubernetes in settings
3. `kubectl apply -f k8s/`

### Option 2: Minikube
```bash
# Install Minikube
choco install minikube -y

# Start cluster
minikube start

# Use Minikube's Docker daemon
eval $(minikube docker-env)

# Build and deploy
docker build -t doctor-app:latest -f docker/Dockerfile .
kubectl apply -f k8s/
```

## 🔄 CI/CD Pipeline

The CI/CD pipeline includes:
- **Build**: Test and build Docker image
- **Test**: Run unit tests
- **Push**: Deploy to Azure Container Registry
- **Deploy**: Update Kubernetes deployment

### Setup GitHub Secrets
- `ACR_USERNAME`: Azure Container Registry username
- `ACR_PASSWORD`: Azure Container Registry password
- `AZURE_CREDENTIALS`: Azure service principal JSON

## 🎮 Ansible Automation

```bash
# Install Ansible requirements
ansible-galaxy install -r ansible/requirements.yml

# Run deployment
ansible-playbook ansible/playbook.yml -e "mongodb_uri=mongodb://localhost:27017/appointment"
```

## 🧪 Testing

```bash
# Run unit tests
cd tests
python -m pytest test_app.py -v

# Test health endpoint
curl http://localhost:5000/health
```

## 📊 Monitoring

### Health Checks
- **Liveness Probe**: `/health` endpoint every 30s
- **Readiness Probe**: `/health` endpoint every 5s
- **Resource Limits**: 256Mi/512Mi memory, 250m/500m CPU

### Logs
```bash
# View pod logs
kubectl logs -f deployment/doctor-app -n doctor-app

# View events
kubectl get events -n doctor-app --sort-by=.metadata.creationTimestamp
```

## 🔧 Troubleshooting

### Common Issues
1. **Docker build fails**: Check Dockerfile and requirements.txt
2. **Terraform fails**: Verify Azure login and subscription
3. **Kubernetes deployment fails**: Check image name and secrets
4. **Health checks failing**: Ensure `/health` endpoint is accessible

### Debug Commands
```bash
# Docker
docker logs doctor-app-test
docker inspect doctor-app-test

# Kubernetes
kubectl describe pod <pod-name> -n doctor-app
kubectl logs <pod-name> -n doctor-app
kubectl get events -n doctor-app

# Terraform
terraform validate
terraform plan -detailed-exitcode
```

## 📚 Learning Outcomes

This project demonstrates:
- **CO2**: Version Control with Git branching and workflows
- **CO3**: CI/CD pipeline implementation
- **CO5**: Containerization, IaC, and configuration management

## 🎓 Educational Notes

- **Infrastructure as Code**: Terraform manages Azure resources declaratively
- **Container Orchestration**: Kubernetes manages container lifecycle
- **Configuration Management**: Ansible automates deployment tasks
- **DevOps Pipeline**: Automated build, test, and deployment process

## 🤝 Contributing

1. Create feature branch: `git checkout -b feature/new-feature`
2. Make changes and commit: `git commit -m "Add new feature"`
3. Push branch: `git push origin feature/new-feature`
4. Create pull request

## 📄 License

This project is for educational purposes as part of DevOps coursework.

---

**Note**: For production deployment, ensure proper security measures, secrets management, and monitoring are in place.
