# Multi-Stack DevOps Voting Application on AWS

<p align="center">
  <img src="https://img.shields.io/badge/AWS-232F3E?style=for-the-badge&logo=amazon-aws&logoColor=white" alt="AWS"/>
  <img src="https://img.shields.io/badge/Terraform-7B42BC?style=for-the-badge&logo=terraform&logoColor=white" alt="Terraform"/>
  <img src="https://img.shields.io/badge/Ansible-EE0000?style=for-the-badge&logo=ansible&logoColor=white" alt="Ansible"/>
  <img src="https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white" alt="Docker"/>
  <img src="https://img.shields.io/badge/Networking-0A66C2?style=for-the-badge&logo=cisco&logoColor=white" alt="Networking"/>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Python-3776AB?style=flat-square&logo=python&logoColor=white" alt="Python"/>
  <img src="https://img.shields.io/badge/Node.js-339933?style=flat-square&logo=nodedotjs&logoColor=white" alt="Node.js"/>
  <img src="https://img.shields.io/badge/.NET-512BD4?style=flat-square&logo=dotnet&logoColor=white" alt=".NET"/>
  <img src="https://img.shields.io/badge/Redis-DC382D?style=flat-square&logo=redis&logoColor=white" alt="Redis"/>
  <img src="https://img.shields.io/badge/PostgreSQL-4169E1?style=flat-square&logo=postgresql&logoColor=white" alt="PostgreSQL"/>
  <img src="https://img.shields.io/badge/GitHub-181717?style=flat-square&logo=github&logoColor=white" alt="GitHub"/>
</p>

---

## 📖 Overview

This project demonstrates a complete **end-to-end DevOps workflow** by deploying a polyglot microservices voting application on **AWS**.

Users vote between **Cats 🐱** and **Dogs 🐶**. The system processes votes asynchronously and displays real-time results.

The application is intentionally multi-language and multi-framework to showcase real-world polyglot infrastructure skills:

| Service     | Language / Framework      | Role                            |
|-------------|---------------------------|---------------------------------|
| **Vote**    | Python + Flask            | Frontend – accept votes         |
| **Result**  | Node.js + Express         | Frontend – display live results |
| **Worker**  | C# / .NET                 | Background worker               |
| **Redis**   | Redis                     | In-memory message queue         |
| **Postgres**| PostgreSQL                | Persistent data store           |

**Infrastructure is fully managed as code** using **Terraform**.  
**Configuration & deployment** are automated with **Ansible**.  
All application components run as **Docker containers**.

> **Goal**: Production-style multi-tier architecture on AWS with proper networking, security groups, bastion host, and remote state management — ready for a professional GitHub portfolio.

---

## 🏗️ Architecture

### High-Level AWS Architecture

![AWS Architecture](docs/architecture.png)

**Key Components:**

- **VPC** with Public and Private Subnets
- **Bastion / Frontend EC2** (Public Subnet) – Vote + Result services + Jump Host
- **Backend EC2** (Private Subnet) – Redis + Worker
- **Database EC2** (Private Subnet) – PostgreSQL
- **NAT Gateway** – Outbound internet access for private instances
- **Security Groups** – Least-privilege rules between tiers
- **Terraform Remote State** – S3 + DynamoDB locking

### Application Data Flow

![App Architecture](docs/app-architecture.jpg)

```
User → Vote (Python) → Redis ← Worker (.NET) → PostgreSQL ← Result (Node.js) → User
```

---

## 🛠️ Technology Stack

| Category                   | Tools / Services                                      |
|----------------------------|-------------------------------------------------------|
| **Cloud Provider**         | Amazon Web Services (AWS)                             |
| **Infrastructure as Code** | Terraform                                             |
| **Configuration Management** | Ansible                                             |
| **Containerization**       | Docker & Docker Compose                               |
| **Networking**             | VPC, Subnets, Route Tables, NAT Gateway, Security Groups, Bastion Host |
| **Application Stack**      | Python (Flask), Node.js (Express), .NET Worker        |
| **Data Stores**            | Redis (queue), PostgreSQL (persistence)               |
| **CI / State**             | Terraform Remote Backend (S3 + DynamoDB)              |
| **Version Control**        | Git + GitHub                                          |

---

## ✨ Key Features

- ✅ Multi-tier AWS architecture (Public + Private subnets)
- ✅ Infrastructure provisioned entirely with **Terraform**
- ✅ Configuration management & container deployment with **Ansible**
- ✅ Bastion host pattern for secure access to private instances
- ✅ Least-privilege Security Groups
- ✅ Dockerized polyglot microservices
- ✅ Redis as message queue + PostgreSQL for persistence
- ✅ Real-time voting results via WebSockets
- ✅ Remote Terraform state with locking
- ✅ Portfolio-ready documentation and architecture diagrams

---

## 📁 Project Structure

```text
.
├── terraform/                  # Infrastructure as Code
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── vpc.tf
│   ├── ec2.tf
│   ├── security_groups.tf
│   ├── backend.tf              # S3 + DynamoDB remote state
│   └── ...
├── ansible/                    # Configuration Management
│   ├── inventory/
│   ├── group_vars/
│   ├── playbooks/
│   │   ├── site.yml
│   │   ├── install_docker.yml
│   │   └── deploy_containers.yml
│   └── roles/
│       ├── docker_install/
│       ├── deploy_containers/
│       └── postgres_persist/
├── app/                        # Application source (or Docker images from Docker Hub)
│   ├── vote/
│   ├── result/
│   └── worker/
├── docs/
│   ├── architecture.png
│   └── app-architecture.jpg
├── docker-compose.yml          # Local development
└── README.md
```

---

## 🚀 Getting Started

### Prerequisites

- AWS Account with appropriate IAM permissions
- Terraform ≥ 1.5
- Ansible ≥ 2.14
- Docker & Docker Compose
- AWS CLI configured (`aws configure`)
- SSH key pair for EC2 access

### 1. Clone the Repository

```bash
git clone https://github.com/<your-username>/multi-stack-devops-voting-app.git
cd multi-stack-devops-voting-app
```

### 2. Provision Infrastructure (Terraform)

```bash
cd terraform
terraform init
terraform plan
terraform apply
```

This creates:

- VPC + Public/Private Subnets
- NAT Gateway
- 3 EC2 instances (Frontend/Bastion, Backend, Database)
- Security Groups
- Remote state backend (S3 + DynamoDB)

### 3. Configure Instances (Ansible)

Update inventory with private IPs / hostnames and configure SSH ProxyJump via the bastion.

```bash
cd ../ansible
ansible-playbook -i inventory/hosts playbooks/site.yml
```

The playbooks will:

1. Install & configure Docker
2. Pull images from Docker Hub
3. Deploy containers with correct environment variables
4. Persist PostgreSQL data on a volume

### 4. Access the Application

- **Vote UI**: `http://<FRONTEND_PUBLIC_IP>:8080`
- **Result UI**: `http://<FRONTEND_PUBLIC_IP>:8081`

Cast votes and watch results update in real time.

---

## 🔐 Security Highlights

- Private subnets for Redis, Worker, and PostgreSQL (no direct internet exposure)
- Bastion host pattern for SSH access
- Security Groups enforce least privilege:
  - Frontend SG → Internet (HTTP)
  - Backend SG → Accept Redis traffic only from Frontend
  - DB SG → Accept Postgres traffic only from Worker/Backend
- Terraform remote state stored securely in S3 with DynamoDB locking
- No secrets committed to Git (use environment variables / Ansible Vault)

---

## 🧪 Local Development (Optional)

```bash
docker compose up --build
```

Access:

- Vote → http://localhost:8080
- Result → http://localhost:8081

---

## 📸 Demo & Presentation

This project is designed for a **15-minute portfolio presentation** covering:

1. Terraform plan & infrastructure walkthrough
2. Ansible playbooks & roles
3. Live demo of voting + real-time results
4. Architecture diagram explanation
5. Security group & networking decisions

---

## 🧠 What I Learned

- Designing multi-tier VPC architectures (public/private subnets, NAT, route tables)
- Writing production-grade Terraform modules and remote state
- Using Ansible with jump hosts / ProxyJump for private instances
- Container networking across multiple EC2 hosts
- Least-privilege security group design
- Orchestrating polyglot microservices (Python, Node.js, .NET)
- End-to-end Infrastructure-as-Code + Configuration-as-Code workflow

---

## 👤 Author

**Penchalaiah Jammula **  


[![LinkedIn](https://img.shields.io/badge/LinkedIn-0A66C2?style=flat&logo=linkedin&logoColor=white)](https://linkedin.com/in/penchaljammula)
[![GitHub](https://img.shields.io/badge/GitHub-181717?style=flat&logo=github&logoColor=white)](https://github.com/penchalj)
[![Portfolio](https://img.shields.io/badge/Portfolio-000000?style=flat&logo=About.me&logoColor=white)](https://yourportfolio.com)

---

## 📄 License

This project is for educational and portfolio purposes.  
Original application inspired by the [Docker Sample Voting App](https://github.com/dockersamples/example-voting-app).

---

<p align="center">
  <b>Built with ❤️ for DevOps Portfolio</b><br>
  AWS · Terraform · Ansible · Docker · Networking
</p>
