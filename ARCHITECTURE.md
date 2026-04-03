# 🏗️ DevOps Architecture Diagram

## System Architecture

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Developer     │    │   GitHub Repo   │    │ GitHub Actions  │
│                 │    │                 │    │   (CI/CD)       │
│  - Local Code   │───▶│  - Version      │───▶│  - Build        │
│  - Git Push     │    │    Control      │    │  - Test         │
│  - Features     │    │  - Branches     │    │  - Docker Build │
└─────────────────┘    │  - Pull Req    │    │  - Push to ACR  │
                       └─────────────────┘    │  - Deploy to   │
                                              │    AKS         │
                                              └─────────┬───────┘
                                                        │
                       ┌─────────────────┐            │
                       │ Azure Container  │◀───────────┘
                       │   Registry (ACR)│
                       │                 │
                       │  - Docker Images│
                       │  - Image Storage│
                       │  - Versioning   │
                       └─────────┬───────┘
                                 │
                       ┌─────────▼───────┐
                       │Azure Kubernetes  │
                       │   Service (AKS)  │
                       │                 │
                       │  - Pods (2-3)    │
                       │  - LoadBalancer  │
                       │  - Auto-scaling  │
                       │  - Health Checks│
                       └─────────┬───────┘
                                 │
                       ┌─────────▼───────┐
                       │   End Users     │
                       │                 │
                       │  - Web Browser  │
                       │  - App Access   │
                       │  - HTTP/HTTPS    │
                       └─────────────────┘
```

## Infrastructure Components

### 1. Version Control Layer
- **GitHub Repository**: Source code management
- **Branching Strategy**: main, develop, feature branches
- **Pull Requests**: Code review and collaboration

### 2. CI/CD Pipeline
- **GitHub Actions**: Automated workflow
- **Build Stage**: Compile and test code
- **Docker Build**: Create container images
- **Push to ACR**: Store images in registry
- **Deploy to AKS**: Update Kubernetes deployment

### 3. Container Registry
- **Azure Container Registry**: Docker image storage
- **Image Versioning**: Tag and track versions
- **Secure Storage**: Private registry access

### 4. Container Orchestration
- **Azure Kubernetes Service**: Container management
- **Pods**: Running application instances
- **LoadBalancer**: External access and traffic distribution
- **Health Monitoring**: Liveness and readiness probes

### 5. Application Layer
- **Flask Application**: Doctor Appointment System
- **MongoDB**: Database for appointments and users
- **Health Endpoint**: `/health` for monitoring

## Data Flow

1. **Development**: Developer writes code locally
2. **Version Control**: Code pushed to GitHub
3. **CI/CD Trigger**: GitHub Actions workflow starts
4. **Build**: Code compiled and tested
5. **Containerization**: Docker image built
6. **Registry**: Image pushed to Azure Container Registry
7. **Deployment**: Kubernetes pulls image and updates deployment
8. **Scaling**: AKS manages pod replicas
9. **Access**: Users access application via LoadBalancer

## DevOps Practices Implemented

### ✅ Infrastructure as Code (IaC)
- **Terraform**: Azure resources defined as code
- **Reproducible**: Same infrastructure can be created multiple times
- **Version Controlled**: Infrastructure changes tracked in Git

### ✅ Continuous Integration/Continuous Deployment (CI/CD)
- **Automated**: No manual intervention required
- **Pipeline**: Build → Test → Deploy stages
- **Quality Gates**: Tests must pass before deployment

### ✅ Containerization
- **Docker**: Application packaged with dependencies
- **Portable**: Runs anywhere Docker is supported
- **Scalable**: Easy to scale horizontally

### ✅ Configuration Management
- **Ansible**: Automated deployment tasks
- **Kubernetes Manifests**: Declarative configuration
- **Environment Separation**: Different configs for dev/prod

### ✅ Monitoring and Health Checks
- **Health Endpoints**: Application health monitoring
- **Kubernetes Probes**: Container health monitoring
- **Logging**: Container and application logs

## Security Considerations

### 🔒 Container Security
- **Minimal Base Image**: Python 3.9-slim
- **Non-root User**: Application runs as non-privileged user
- **Secrets Management**: MongoDB credentials in Kubernetes secrets

### 🔒 Network Security
- **LoadBalancer**: External traffic management
- **Internal Communication**: Pod-to-pod communication
- **Firewall Rules**: Azure network security groups

### 🔒 Code Security
- **Private Repository**: Source code protection
- **Secrets Management**: GitHub secrets for credentials
- **Image Scanning**: Container image vulnerability checks

## Cost Optimization

### 💰 Azure Resources
- **B2s VM Size**: Cost-effective for development
- **Single Node Cluster**: Minimal resource usage
- **Basic ACR SKU**: Free tier available

### 💰 Resource Management
- **Auto-scaling**: Scale based on demand
- **Resource Limits**: Prevent over-provisioning
- **Monitoring**: Track resource usage

## High Availability

### 🔄 Redundancy
- **Multiple Pods**: Application replicas
- **Load Balancer**: Traffic distribution
- **Health Checks**: Automatic failover

### 🔄 Disaster Recovery
- **Git Backups**: Code versioning
- **Container Images**: Immutable deployments
- **Infrastructure Code**: Quick recreation

---

**🎯 This architecture demonstrates a complete DevOps pipeline from development to production!**
