# MERN E-Commerce Application with Production-Ready CI/CD Pipeline on Amazon EKS

## Overview

This project demonstrates a complete end-to-end DevOps workflow for deploying a **production-ready MERN (MongoDB, Express.js, React.js, Node.js) e-commerce application** on **Amazon Elastic Kubernetes Service (EKS)**.

The infrastructure is provisioned using **Terraform**, the application is containerized using **Docker**, and the complete CI/CD pipeline is automated using **GitHub Actions**. The application is deployed to Kubernetes running on Amazon EKS with monitoring provided by **Prometheus** and **Grafana**, installed using **Helm**.

The CI/CD pipeline performs automated builds, testing, vulnerability scanning with **Trivy**, Docker image publishing to **Docker Hub**, and automatic deployment to Amazon EKS.

---

# Architecture

```text
                                  Developer
                                      │
                                  Git Push
                                      │
                                      ▼
                           GitHub Repository
                                      │
                                      ▼
                        GitHub Actions CI/CD Pipeline
                                      │
        ┌─────────────────────────────────────────────────────┐
        │                                                     │
        │  • Checkout Source Code                             │
        │  • Install Dependencies                             │
        │  • Build React Application                          │
        │  • Run Tests                                        │
        │  • Trivy Filesystem Scan                            │
        │  • Build Docker Images                              │
        │  • Push Images to Docker Hub                        │
        │  • Trivy Image Scan                                 │
        │  • Configure AWS Credentials                        │
        │  • Deploy to Amazon EKS                             │
        │                                                     │
        └─────────────────────────────────────────────────────┘
                                      │
                                      ▼
                              Amazon EKS Cluster
                           (Provisioned by Terraform)
                                      │
        ┌─────────────────────────────────────────────────────┐
        │ Namespace                                           │
        │ ConfigMap                                           │
        │ Secret                                              │
        │ Persistent Volume                                  │
        │ Persistent Volume Claim                            │
        │ MongoDB Deployment                                 │
        │ Backend Deployment                                 │
        │ Frontend Deployment                                │
        │ Services                                           │
        │                                                    │
        └─────────────────────────────────────────────────────
                                      │
                                      ▼
                           MERN E-Commerce Application

                                      │
                    ┌─────────────────┴──────────────────┐
                    │                                    │
                    ▼                                    ▼
            Prometheus (Helm)                    Grafana (Helm)
                    │                                    │
                    └──────────────┬─────────────────────┘
                                   │
                            ServiceMonitor
                                   │
                                   ▼
                        Backend Application Metrics
```

---

# Technology Stack

## Frontend

* React.js

## Backend

* Node.js
* Express.js

## Database

* MongoDB

## Containerization

* Docker
* Docker Hub

## Cloud Platform

* Amazon Web Services (AWS)
* Amazon Elastic Kubernetes Service (EKS)

## Infrastructure as Code

* Terraform

## Kubernetes

* Kubernetes
* Helm

## CI/CD

* GitHub Actions

## Monitoring

* Prometheus
* Grafana
* Prometheus Operator
* Alertmanager
* Node Exporter
* kube-state-metrics
* ServiceMonitor

## Security

* Trivy

---

# Project Structure

```text
.
├── backend/
│
├── frontend/
│
├── kubernetes/
│   ├── backend/
│   ├── database/
│   ├── frontend/
│   ├── monitoring/
│   │   └── backend-servicemonitor.yml
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
├── .github/
│   └── workflows/
│       └── ci-cd.yml
│
├── screenshots/
│   ├── architecture/
│   ├── terraform/
│   ├── github-actions/
│   ├── kubernetes/
│   ├── monitoring/
│   │   ├── prometheus-targets.png
│   │   ├── grafana-dashboard.png
│   │   ├── servicemonitor.png
│   │   └── monitoring-stack.png
│   ├── docker/
│   ├── aws/
│   └── application/
│
└── README.md
```

---

# Infrastructure as Code (Terraform)

Terraform provisions the complete AWS infrastructure, including:

* Amazon VPC
* Public Subnets
* Private Subnets
* Internet Gateway
* Route Tables
* Security Groups
* IAM Roles
* Amazon EKS Cluster
* Managed Node Group
* EKS Add-ons

---

# CI/CD Pipeline

The GitHub Actions workflow automates the entire deployment process.

Pipeline stages include:

1. Checkout Repository
2. Setup Node.js
3. Install Dependencies
4. Build React Application
5. Run Automated Tests
6. Trivy Filesystem Scan
7. Build Docker Images
8. Push Images to Docker Hub
9. Trivy Image Scan
10. Configure AWS Credentials
11. Connect to Amazon EKS
12. Deploy Kubernetes Resources
13. Deploy Updated Application

---

# Pipeline Stages

## Build & Test

* Checkout source code
* Install frontend dependencies
* Build React application
* Execute frontend tests
* Install backend dependencies

## Security Scanning

### Trivy Filesystem Scan

Scans the project source code for HIGH and CRITICAL vulnerabilities before building Docker images.

### Trivy Image Scan

Scans Docker images after they are built to identify known vulnerabilities before deployment.

---

# Kubernetes Deployment

The application is deployed to Amazon EKS using Kubernetes manifests.

Resources include:

* Namespace
* ConfigMap
* Secret
* Persistent Volume
* Persistent Volume Claim
* MongoDB Deployment
* Backend Deployment
* Frontend Deployment
* Kubernetes Services
* NGINX Ingress

---

# Monitoring Stack

Application and cluster monitoring are implemented using the **kube-prometheus-stack Helm Chart**.

Monitoring components include:

* Prometheus
* Grafana
* Alertmanager
* Prometheus Operator
* Node Exporter
* kube-state-metrics

The monitoring stack was installed using Helm.

---

# Prometheus Monitoring

Prometheus continuously collects metrics from:

* Kubernetes API Server
* Kubernetes Nodes
* kubelet
* kube-proxy
* CoreDNS
* Prometheus
* Grafana
* Alertmanager
* kube-state-metrics
* Node Exporter
* Backend ServiceMonitor

All monitoring targets are successfully discovered and remain in the **UP** state.

---

# Backend Service Monitoring

The backend application is monitored using a Kubernetes **ServiceMonitor**.

Prometheus automatically discovers the backend service and collects application metrics.

Application monitoring includes:

* Backend availability
* Application health metrics
* Container resource utilization

> If you added Prometheus instrumentation (`prom-client`) to the backend, application metrics such as HTTP request count, request latency, and error rates are also collected.

---

# Grafana Dashboard

Grafana provides centralized visualization of Kubernetes and application metrics.

The dashboard includes:

## Kubernetes Metrics

* Cluster Health
* Node CPU Usage
* Node Memory Usage
* Disk Usage
* Pod Status
* Pod Restarts

## Infrastructure Metrics

* Node Exporter Metrics
* kube-state-metrics
* Kubernetes API Metrics

## Application Metrics

* Backend Availability
* Container CPU Usage
* Container Memory Usage

> If Prometheus client instrumentation was added to the backend, dashboards can also include HTTP request rate, response latency, and application error rate.

---

# GitHub Repository Secrets

| Secret                | Purpose                   |
| --------------------- | ------------------------- |
| AWS_ACCESS_KEY_ID     | AWS Authentication        |
| AWS_SECRET_ACCESS_KEY | AWS Authentication        |
| AWS_REGION            | AWS Region                |
| EKS_CLUSTER_NAME      | Amazon EKS Cluster        |
| DOCKERHUB_USERNAME    | Docker Hub Authentication |
| DOCKERHUB_TOKEN       | Docker Hub Authentication |

---

# Features

* MERN Stack Application
* Dockerized Microservices
* Infrastructure as Code using Terraform
* Amazon EKS Deployment
* Kubernetes Workloads
* GitHub Actions CI/CD
* Docker Hub Integration
* Trivy Security Scanning
* ConfigMaps
* Secrets
* Persistent Volumes
* Persistent Volume Claims
* Helm Package Management
* Prometheus Monitoring
* Grafana Dashboards
* Backend ServiceMonitor
* Kubernetes Cluster Monitoring
* Automated Application Deployment

---

# Future Improvements

* Argo CD (GitOps)
* AWS Load Balancer Controller
* GitHub OIDC Authentication
* Centralized Logging (Loki or EFK Stack)
* Alert Notifications (Slack / Microsoft Teams / Email)

---

# Learning Outcomes

This project demonstrates practical experience with:

* Linux
* Git & GitHub
* Docker
* Docker Hub
* Kubernetes
* Amazon EKS
* Terraform
* GitHub Actions
* Helm
* Prometheus
* Grafana
* Trivy
* Infrastructure as Code
* Continuous Integration
* Continuous Deployment
* Kubernetes Monitoring
* Production-style Cloud Application Deployment
