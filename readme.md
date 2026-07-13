# MERN E-Commerce Application with Production CI/CD Pipeline on Amazon EKS

## Overview

This project demonstrates an end-to-end production-style DevOps workflow for a MERN (MongoDB, Express.js, React.js, Node.js) e-commerce application.

The complete infrastructure is provisioned using **Terraform**, the application is containerized with **Docker**, continuously integrated and deployed using **GitHub Actions**, and automatically deployed to **Amazon EKS (Elastic Kubernetes Service)**.

The pipeline includes automated build, testing, security scanning with Trivy, Docker image publishing to Docker Hub, and Kubernetes deployment.

---

# Architecture

```text
Developer
    │
Git Push
    │
GitHub Repository
    │
GitHub Actions
    │
├── Build & Test
├── Trivy Filesystem Scan
├── Build Docker Images
├── Push Images to Docker Hub
├── Trivy Image Scan
│
AWS IAM Authentication
    │
Amazon EKS Cluster
(Provisoned using Terraform)
    │
├── Namespace
├── ConfigMap
├── Secret
├── Persistent Volume
├── Persistent Volume Claim
├── MongoDB
├── Backend
└── Frontend
    │
Running MERN Application
```

---

# Technology Stack

## Frontend
- React.js

## Backend
- Node.js
- Express.js

## Database
- MongoDB

## DevOps
- Docker
- Docker Hub
- Kubernetes
- Amazon EKS
- Terraform
- GitHub Actions
- Trivy
- AWS IAM
- kubectl

---

# Project Structure

```text
.
├── backend/
├── frontend/
├── kubernetes/
│   ├── backend/
│   ├── database/
│   ├── frontend/
│   ├── namespace.yml
│   ├── configmap.yml
│   ├── secret.yml
│   ├── pv.yml
│   └── pvc.yml
│
├── terraform/
│   ├── provider.tf
│   ├── versions.tf
│   ├── variables.tf
│   ├── terraform.tfvars
│   ├── locals.tf
│   ├── vpc.tf
│   ├── eks.tf
│   ├── nodegroup.tf
│   ├── iam.tf
│   ├── addons.tf
│   └── outputs.tf
│
├── screenshots/
│   ├── architecture/
│   ├── terraform/
│   ├── github-actions/
│   ├── kubernetes/
│   ├── docker/
│   ├── aws/
│   └── application/
│
├── .github/
│   └── workflows/
│       └── ci-cd.yml
│
└── README.md
```

---

# Infrastructure as Code (Terraform)

Terraform provisions:

- Amazon VPC
- Public & Private Subnets
- Internet Gateway
- Route Tables
- Security Groups
- IAM Roles
- Amazon EKS Cluster
- Managed Node Group
- EKS Add-ons

---

# CI/CD Pipeline

1. Checkout Repository
2. Setup Node.js
3. Install Dependencies
4. Build React Application
5. Run Tests
6. Trivy Filesystem Scan
7. Build Docker Images
8. Push Docker Images to Docker Hub
9. Trivy Image Scan
10. Authenticate with AWS
11. Connect to Amazon EKS
12. Deploy Kubernetes Resources
13. Running Application

---

# Pipeline Stages

## Build & Test
- Checkout repository
- Setup Node.js
- Install frontend dependencies
- Build frontend
- Run frontend tests
- Install backend dependencies

## Trivy Filesystem Scan
- Scan repository for HIGH and CRITICAL vulnerabilities.

## Build & Push Docker Images
- Login to Docker Hub
- Build frontend image
- Build backend image
- Push both images

## Trivy Image Scan
- Scan pushed Docker images

## Deploy to Amazon EKS
- Configure AWS credentials
- Generate kubeconfig
- Verify cluster connection
- Deploy Namespace
- Deploy ConfigMap
- Deploy Secret
- Deploy PV & PVC
- Deploy MongoDB
- Deploy Backend
- Deploy Frontend

---

# Kubernetes Resources

- Namespace
- ConfigMap
- Secret
- Persistent Volume
- Persistent Volume Claim
- MongoDB Deployment
- Backend Deployment
- Frontend Deployment
- Services

---

# GitHub Repository Secrets

| Secret | Purpose |
|---------|---------|
| AWS_ACCESS_KEY_ID | AWS Authentication |
| AWS_SECRET_ACCESS_KEY | AWS Authentication |
| AWS_REGION | AWS Region |
| EKS_CLUSTER_NAME | Amazon EKS Cluster |
| DOCKERHUB_USERNAME | Docker Hub |
| DOCKERHUB_TOKEN | Docker Hub |

---

# Features

- MERN Stack
- Dockerized Application
- Infrastructure as Code (Terraform)
- Amazon EKS Deployment
- Kubernetes
- GitHub Actions CI/CD
- Docker Hub Integration
- Trivy Security Scanning
- ConfigMaps
- Secrets
- Persistent Volumes
- Persistent Volume Claims
- Automated Deployment

---

# Future Improvements

- SonarQube Integration
- Helm Charts
- Argo CD
- Prometheus
- Grafana
- Horizontal Pod Autoscaler
- AWS Load Balancer Controller
- GitHub OIDC Authentication

---