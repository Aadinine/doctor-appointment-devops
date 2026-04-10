# 🎬 Faculty Demo Script

## 📋 Pre-Demo Setup (5 minutes before)

1. **Open these tabs in browser:**
   - GitHub: https://github.com/Aadinine/doctor-appointment-devops
   - App: http://localhost:5000
   - Health: http://localhost:5000/health

2. **Open these terminals/VS Code:**
   - Terminal 1: Project root directory
   - VS Code: Show project structure

3. **Verify container is running:**
   ```bash
   docker ps
   ```

---

## 🎯 Demo Script (5-7 minutes)

### 0:00-0:30: Introduction & GitHub Repository

**What to do:**
1. Show GitHub repository in browser
2. Click on branches dropdown
3. Show commit history

**What to say:**
> "Good morning! Today I'll demonstrate my complete DevOps implementation of a Doctor Appointment Booking System. 

> Here's my GitHub repository with proper version control. You can see I have multiple branches: main for production, develop for integration, and feature branches for specific work.

> Let me show you the commit history - I follow best practices with meaningful commit messages that explain what changes were made and why."

**Show:**
- Repository structure
- Branches: main, develop, feature/containerization, feature/cicd
- Recent commits with clear messages

---

### 0:30-1:00: Containerization with Docker

**What to do:**
1. Show Dockerfile in VS Code
2. Run docker build command
3. Show successful build
4. Run docker container
5. Show container running

**What to say:**
> "Next, I'll show how I containerized my application using Docker. 

> Here's my Dockerfile - it uses a Python 3.9 slim base image for efficiency, installs dependencies, copies the application code, and exposes port 5000. I've also included health checks for monitoring.

> Let me build the Docker image... [build command] ... Perfect! The image built successfully.

> Now I'll run the container... [run command] ... Great! The container is running and healthy."

**Commands to run:**
```bash
docker build -t doctor-app:latest -f docker/Dockerfile .
docker run -d -p 5000:5000 --name demo-app doctor-app:latest
docker ps
```

---

### 1:00-1:30: Infrastructure as Code with Terraform

**What to do:**
1. Show Terraform files in VS Code
2. Explain each file
3. Run terraform validate
4. Run terraform plan (read-only)

**What to say:**
> "For infrastructure, I use Terraform for Infrastructure as Code. Instead of clicking around in the Azure portal, I define all my cloud resources as code.

> Here's my main.tf file - it creates a Resource Group, Azure Container Registry for storing Docker images, and Azure Kubernetes Service for running containers.

> The providers.tf file specifies Azure as my cloud provider, and variables.tf allows me to configure settings like region and VM size.

> Let me validate the configuration... [validate] ... Perfect! Now let me show you what Terraform would create... [plan] ... You can see it plans to create 3 resources automatically."

**Show files:**
- terraform/main.tf
- terraform/providers.tf  
- terraform/variables.tf

**Commands:**
```bash
cd terraform
terraform validate
terraform plan
cd ..
```

---

### 1:30-2:00: CI/CD Pipeline

**What to do:**
1. Show GitHub Actions workflow file
2. Explain pipeline stages
3. Show Actions tab in GitHub

**What to say:**
> "I've implemented a complete CI/CD pipeline using GitHub Actions. 

> Here's my workflow file - it triggers on every push to main and develop branches. The pipeline has several stages: first it builds and tests the code, then builds a Docker image, pushes it to Azure Container Registry, and finally deploys to Kubernetes.

> Let me show you the Actions tab in GitHub... You can see the workflow runs and their status. Each step is automated, so when I push code, it gets tested and deployed automatically without manual intervention."

**Show:**
- .github/workflows/ci-cd.yml
- GitHub Actions tab

---

### 2:00-2:30: Kubernetes Deployment

**What to do:**
1. Show Kubernetes manifests
2. Explain deployment and service
3. Show kubectl commands (if AKS available)

**What to say:**
> "For orchestration, I use Kubernetes. Here are my Kubernetes manifests:

> The deployment.yaml defines how many replicas of my application to run (I've set it to 2), what Docker image to use, and includes health checks and resource limits.

> The service.yaml creates a LoadBalancer that makes my application accessible from the internet.

> If I had Azure access, I would show you the running pods with `kubectl get pods` and the external IP with `kubectl get svc`. But for now, let me show you the application running locally."

**Show files:**
- k8s/deployment.yaml
- k8s/service.yaml
- k8s/namespace.yaml

---

### 2:30-3:30: Live Application Demo

**What to do:**
1. Show app running in browser
2. Test health endpoint
3. Show container logs
4. Demonstrate app functionality

**What to say:**
> "Now let me show you the actual application running! 

> Here it is in my browser at localhost:5000 - this is the Doctor Appointment Booking System. Users can search for doctors, book appointments, and manage their healthcare needs.

> Let me test the health endpoint... [curl command] ... Perfect! It returns a healthy status.

> The container logs show everything is working properly - the application started successfully, connected to the database, and is ready to handle requests.

> Let me quickly show you some functionality... [navigate through app] ... Users can search by specialty, view doctor profiles, and book appointments."

**Commands:**
```bash
curl http://localhost:5000/health
docker logs demo-app
```

**Show in browser:**
- Main page
- Doctor search
- Appointment booking

---

### 3:30-4:00: Documentation & Architecture

**What to do:**
1. Show comprehensive README
2. Show architecture diagram
3. Show demo checklist

**What to say:**
> "Finally, let me show you the complete documentation. 

> My README.md includes everything needed to understand and deploy this project: architecture overview, setup instructions, troubleshooting guide, and learning outcomes.

> I've also created an architecture diagram that shows the complete DevOps pipeline from development to production.

> And here's my demo checklist that ensures I cover all the requirements for CO2, CO3, and CO5 learning outcomes."

**Show:**
- README.md
- ARCHITECTURE.md  
- DEMO-CHECKLIST.md

---

### 4:00-4:30: Conclusion & Q&A

**What to say:**
> "To summarize, I've successfully implemented a complete DevOps pipeline that demonstrates:

> **CO2 - Version Control**: Git workflow with branches, commits, and pull requests
> **CO3 - CI/CD**: Automated pipeline with GitHub Actions  
> **CO5 - Containerization & IaC**: Docker containers and Terraform infrastructure

> This project shows how modern software development uses automation, infrastructure as code, and continuous deployment to deliver reliable applications efficiently.

> Thank you! I'm happy to answer any questions about my implementation."

---

## 🎯 Key Points to Emphasize

### During Each Section:
1. **Why** this approach (benefits of automation, reproducibility)
2. **How** it connects to DevOps principles
3. **What** learning outcomes it demonstrates (CO2, CO3, CO5)

### Technical Terms to Use:
- Infrastructure as Code (IaC)
- Continuous Integration/Continuous Deployment (CI/CD)
- Container Orchestration
- Automated Pipeline
- Version Control Workflow
- Immutable Infrastructure

### Problem-Solving to Mention:
- Fixed Docker networking issues (host binding)
- Resolved package dependency conflicts  
- Implemented health checks for monitoring
- Created reproducible environments

---

## 🚨 Backup Plans

### If Something Fails:
1. **Docker issues**: "Let me show you the logs and explain how I'd troubleshoot this"
2. **Network issues**: "This demonstrates why health checks and monitoring are important"
3. **Service not running**: "In production, I'd use Kubernetes self-healing for automatic recovery"

### If Running Short on Time:
1. Skip Terraform plan (show files instead)
2. Focus on working Docker container
3. Emphasize documentation and architecture

---

## ✅ Final Checklist Before Demo

- [x] Docker container running and accessible
- [x] All terminal commands tested
- [x] Browser tabs open with correct URLs
- [x] VS Code showing project structure
- [x] GitHub repository loaded
- [x] Demo script practiced
- [x] Questions prepared for Q&A

**🎯 YOU'RE READY FOR THE DEMO! 🎯**
