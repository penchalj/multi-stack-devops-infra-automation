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
## Terraform
<img width="1023" height="825" alt="image" src="https://github.com/user-attachments/assets/2ea57076-43cf-4344-9b2b-0db70a7540aa" />

## Ansible
<img width="958" height="810" alt="image" src="https://github.com/user-attachments/assets/14760f50-c2ec-4c1b-918c-3c8eba56144e" />


## Voter Page
<img width="596" height="241" alt="image" src="https://github.com/user-attachments/assets/6abc2011-8533-4864-881d-576143cb16f9" />

## 
##  Result Page
<img width="602" height="347" alt="image" src="https://github.com/user-attachments/assets/794e73b0-0aba-4765-a735-8fc908d3f6ca" />


## Learnings
- Networking (public/private subnets, Bastion)
- Idempotent configuration
- Microservices communication
