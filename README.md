# multi-stack-devops-infra-automation
Devops Project: aws-terraform-ansible-docker-voting-microservices
End-to-End Multi-Stack DevOps Project: AWS + Terraform + Ansible + Docker Microservices Voting App (Python, Node.js, .NET, Redis, Postgres)

# Multi-Stack DevOps Voting Application

End-to-End IaC project demonstrating Terraform, Ansible, Docker on AWS.

## Architecture
<img width="1165" height="788" alt="image" src="https://github.com/user-attachments/assets/bcdb0935-d26b-48cf-afd3-559310eb4940" />


## Tech Stack
- Terraform (VPC, EC2, SGs, Remote State)
- Ansible (Configuration & Deployment)
- Docker (Polyglot microservices)
- AWS (VPC, EC2, Security Groups)

## Completed Tasks
- Task 1: Local Docker setup
- Task 2: Terraform infrastructure
- Task 3: Ansible deployment (Vote, Result, Worker, Redis, Postgres)

## How to Run
1. terraform init,terraform plan && terraform apply
2. To run Ansible playbook:
3. cd ansible
ansible-playbook -i inventory/hosts.yml playbooks/deploy.yml -K -vv \
  -e "dockerhub_username=penchaljdevops redis_host=10.0.10.86 postgres_host=10.0.10.159 postgres_user=postgres postgres_password=postgres postgres_db=postgres"


## Screenshots
## Repo Structure
<img width="1165" height="788" alt="image" src="https://github.com/user-attachments/assets/bcdb0935-d26b-48cf-afd3-559310eb4940" />

## Voter Page
<img width="1165" height="788" alt="image" src="https://github.com/user-attachments/assets/bcdb0935-d26b-48cf-afd3-559310eb4940" />


## 

##  Result Page
<img width="1165" height="788" alt="image" src="https://github.com/user-attachments/assets/bcdb0935-d26b-48cf-afd3-559310eb4940" />


## Learnings
- Networking (public/private subnets, Bastion)
- Idempotent configuration
- Microservices communication
