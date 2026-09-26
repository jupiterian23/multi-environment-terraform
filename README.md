# Multi-Environment Terraform Setup

A hands-on Terraform project demonstrating how to manage **DEV and PROD AWS environments** using reusable Terraform modules, independent state files, and environment-specific configurations.

## 📌 Project Overview

This project demonstrates a practical Infrastructure as Code (IaC) structure for managing multiple environments with Terraform.

Instead of duplicating infrastructure code, a reusable **EC2 module** is created and consumed independently by the DEV and PROD environments.

Each environment has its own Terraform configuration and state, allowing infrastructure to be provisioned, tested, and destroyed independently.

## 🏗️ Architecture

```text
                    Terraform
                        │
              ┌─────────┴─────────┐
              │                   │
             DEV                 PROD
              │                   │
        ┌─────▼─────┐       ┌─────▼─────┐
        │ EC2 Module│       │ EC2 Module│
        └─────┬─────┘       └─────┬─────┘
              │                   │
           AWS EC2              AWS EC2
              │                   │
        DEV Terraform        PROD Terraform
             State                State
```

## 🎯 Objectives

* Understand Terraform modules
* Implement reusable infrastructure code
* Separate DEV and PROD environments
* Maintain independent Terraform state
* Use AWS data sources to reference existing networking resources
* Practice the Terraform lifecycle
* Provision and destroy infrastructure safely
* Demonstrate environment isolation

## 🛠️ Technologies Used

* **Terraform**
* **AWS EC2**
* **AWS VPC**
* **AWS Security Groups**
* **AWS CLI**
* **HCL**
* **Git & GitHub**
* **WSL / Linux**

## 📁 Project Structure

```text
multi-environment-terraform/
│
├── README.md
├── .gitignore
│
├── environments/
│   ├── dev/
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   ├── terraform.tf
│   │   ├── variables.tf
│   │   └── terraform.tfvars
│   │
│   └── prod/
│       ├── main.tf
│       ├── outputs.tf
│       ├── terraform.tf
│       ├── variables.tf
│       └── terraform.tfvars
│
└── modules/
    └── ec2/
        ├── main.tf
        ├── outputs.tf
        └── variables.tf
```

> `terraform.tfvars`, Terraform state files, and `.terraform/` directories are excluded from Git tracking.

## 🧩 Reusable EC2 Module

The `modules/ec2` directory contains reusable infrastructure code for creating an EC2 instance.

The module accepts environment-specific inputs such as:

* Environment name
* AMI ID
* Instance type
* Subnet ID
* Security group ID
* Instance name

It also creates consistent tags:

```text
Environment = dev/prod
ManagedBy   = Terraform
Name        = environment-specific name
```

## 🌎 Environment Configuration

### DEV

The DEV environment uses:

```text
Environment: dev
Instance:    dev-terraform-server
```

The DEV infrastructure was successfully:

```text
terraform init
terraform plan
terraform apply
terraform destroy
```

### PROD

The PROD environment uses:

```text
Environment: prod
Instance:    prod-terraform-server
```

The PROD infrastructure was also successfully:

```text
terraform init
terraform plan
terraform apply
terraform destroy
```

## 🔐 Environment Isolation

DEV and PROD are implemented as separate Terraform root configurations.

This means each environment maintains its own Terraform state and manages its own resources.

For example:

```text
environments/dev/
    └── Terraform state → DEV resources

environments/prod/
    └── Terraform state → PROD resources
```

Destroying DEV therefore does not destroy PROD infrastructure.

This behavior was tested during the project.

## 🔄 Terraform Workflow

The project follows the standard Terraform workflow:

```text
Write Configuration
        ↓
terraform init
        ↓
terraform plan
        ↓
terraform apply
        ↓
Verify AWS Resources
        ↓
terraform destroy
```

## 🧪 Testing Performed

The following operations were successfully tested:

* Terraform initialization
* Provider installation
* Terraform planning
* DEV EC2 provisioning
* DEV AWS verification
* DEV infrastructure destruction
* PROD EC2 provisioning
* PROD AWS verification
* PROD infrastructure destruction
* Independent Terraform state verification
* DEV/PROD environment isolation

## 💰 Cost Considerations

The project was designed for AWS Free Tier-conscious practice.

The infrastructure intentionally avoids services such as:

* NAT Gateway
* RDS
* Application Load Balancer
* Unnecessary Elastic IPs

Only a small EC2 instance was provisioned for testing and was destroyed after the exercise.

> AWS pricing and Free Tier eligibility can vary by account, region, and current AWS terms. Always verify your own AWS billing situation before deploying resources.

## 📚 What I Learned

Through this project, I practiced:

1. Designing a Terraform project structure
2. Creating reusable Terraform modules
3. Passing variables into modules
4. Using Terraform outputs
5. Using AWS data sources
6. Managing separate environments
7. Understanding Terraform state isolation
8. Using `terraform plan` before deployment
9. Provisioning infrastructure with `terraform apply`
10. Safely removing infrastructure with `terraform destroy`
11. Managing Terraform projects with Git and GitHub

## 🚀 Future Improvements

Possible future improvements include:

* Remote Terraform state using Amazon S3
* State locking
* Environment-specific AWS accounts
* CI/CD with GitHub Actions
* Terraform validation and formatting checks
* Security scanning with Checkov or tfsec
* Separate VPC modules
* Environment-specific variables
* Automated Terraform plan workflows

## 👨‍💻 Author

**Shubham Gorule**

BCA Student | Aspiring Cloud Engineer

GitHub: **[@jupiterian23](https://github.com/jupiterian23)**

---

⭐ This project is part of my hands-on journey toward **Cloud Engineering, DevOps, and Cloud Solution Architecture**.
