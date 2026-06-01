# Terraform EC2 Nginx Deployment Project

## Project Overview

This project demonstrates Infrastructure as Code (IaC) using Terraform to provision AWS resources and automatically deploy an Nginx web server on an EC2 instance.

The deployment process is automated through GitHub Actions workflows, allowing infrastructure creation and destruction directly from GitHub.

When the EC2 instance launches, a User Data script automatically:

* Updates system packages
* Installs Nginx
* Starts the Nginx service
* Enables Nginx on system boot
* Creates a custom web page

After deployment, users can access the web server through the EC2 Public IP address.

---

## Architecture

```text
Developer
    │
    ▼
GitHub Repository
    │
    ▼
GitHub Actions
    │
    ▼
Terraform
    │
    ▼
AWS EC2 Instance
    │
    ▼
User Data Script
    │
    ▼
Nginx Web Server
    │
    ▼
Custom Web Page
```

---

## Project Structure

```text
TERRAFORM-EC2-PROJECT
│
├── .github/
│   └── workflows/
│       ├── terraform.yml
│       └── destroy.yml
│
├── backend/
│   ├── .terraform/
│   ├── .terraform.lock.hcl
│   ├── main.tf
│   └── outputs.tf
│
├── environments/
│
├── .gitignore
├── .terraform.lock.hcl
├── backend.tf
├── main.tf
├── outputs.tf
├── terraform.tfvars
├── user-data.sh
└── variables.tf
```

---

## Technologies Used

* Terraform
* AWS EC2
* AWS VPC
* Nginx
* GitHub Actions
* Bash Scripting

---

## Infrastructure Components

The project provisions:

### Networking

* VPC
* Public Subnet
* Internet Gateway
* Route Table

### Security

* Security Group
* HTTP (Port 80)
* SSH (Port 22)

### Compute

* EC2 Instance
* Ubuntu Linux AMI

---

## User Data Script

The EC2 instance executes the following script automatically during launch:

```bash
#!/bin/bash
apt update -y
apt install nginx -y
systemctl start nginx
systemctl enable nginx

echo "Hello from Terraform EC2 Web Server" > /var/www/html/index.html
```

This script:

1. Updates package repositories
2. Installs Nginx
3. Starts Nginx
4. Enables Nginx on reboot
5. Creates a custom homepage

---

## Deployment Workflow

### Step 1: Push Code to GitHub

Push Terraform code to your repository.

### Step 2: GitHub Actions Trigger

The workflow starts automatically.

### Step 3: Terraform Initialization

Terraform initializes providers and backend.

### Step 4: Terraform Plan

Terraform creates an execution plan.

### Step 5: Terraform Apply

AWS resources are provisioned.

### Step 6: EC2 Launch

AWS launches the EC2 instance.

### Step 7: User Data Execution

The startup script installs and configures Nginx.

### Step 8: Access Application

Open:

http://<EC2-PUBLIC-IP>

Expected Output:

Hello from Terraform EC2 Web Server

---

## Terraform Commands

### Initialize

```bash
terraform init
```

### Validate

```bash
terraform validate
```

### Plan

```bash
terraform plan
```

### Apply

```bash
terraform apply
```

### Destroy

```bash
terraform destroy
```

---

## GitHub Actions Workflows

### terraform.yml

Responsible for:

* Terraform Init
* Terraform Validate
* Terraform Plan
* Terraform Apply

### destroy.yml

Responsible for:

* Terraform Destroy
* Resource Cleanup

---

## Variables

Configuration values are managed through:

```text
variables.tf
terraform.tfvars
```

Examples:

* AWS Region
* Instance Type
* CIDR Blocks
* AMI IDs

---

## Outputs

Terraform outputs useful deployment information such as:

* EC2 Public IP
* Instance ID
* Resource IDs

Example:

```bash
terraform output
```

---

## Security Best Practices

* Do not commit AWS credentials.
* Store secrets in GitHub Secrets.
* Restrict SSH access.
* Use least-privilege IAM policies.
* Protect Terraform state files.

---

## Future Improvements

* Application Load Balancer (ALB)
* Auto Scaling Group (ASG)
* HTTPS using ACM
* Route53 DNS
* CloudWatch Monitoring
* Multi-Environment Deployments
* Terraform Modules

---
