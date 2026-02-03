## AWS VPC, EC2 & Security Groups Documentation
# Overview

This task focuses on understanding and implementing AWS core infrastructure services such as VPC, EC2, and Security Groups.
The infrastructure is created using both manual (AWS Console) and automated (Terraform) approaches.

# What is AWS?

Amazon Web Services (AWS) is a cloud computing platform provided by Amazon that offers on-demand services like computing power, storage, networking, and security.

# Why AWS?

Pay only for what you use
Highly scalable and reliable
Secure global infrastructure
Used by startups to enterprises

# What is Terraform?

Terraform is an Infrastructure as Code (IaC) tool used to automate cloud resource creation using configuration files.

# Why Terraform?

Automates infrastructure
Reduces manual errors
Easy to reuse and modify
Version control friendly

# AWS VPC (Virtual Private Cloud)

A VPC is a logically isolated virtual network in AWS where you can launch resources like EC2 instances.

# Key Components

CIDR Block
Public Subnet
Private Subnet
Internet Gateway
Route Table

# Benefits

Network isolation
Better security
Full control over IP addressing

# EC2 (Elastic Compute Cloud)

EC2 provides resizable virtual servers (instances) to run applications in the cloud.

# Features

Multiple instance types
Scalable compute capacity
Pay-as-you-go pricing

# Security Groups (SG)

A Security Group acts as a virtual firewall for EC2 instances, controlling inbound and outbound traffic.

# Key Points

Instance-level security
Stateful firewall
Supports allow rules only

# Infrastructure Implementation
# Method 1: Manual Setup (AWS Console)
Step 1: Create VPC

Go to VPC Dashboard
Click Create VPC
Enter CIDR block ```(example: 10.0.0.0/16)```
Create VPC

Step 2: Create Subnets

Create Public Subnet ```(example: 10.0.1.0/24)```
Create Private Subnet ```(example: 10.0.2.0/24)```

Step 3: Create Internet Gateway

Create Internet Gateway
Attach it to the VPC

Step 4: Configure Route Table

Add route:
```0.0.0.0/0``` → Internet Gateway
Associate with Public Subnet

Step 5: Create Security Group

Allow:
SSH (22)
HTTP (80)
Restrict access for security

Step 6: Launch EC2 Instance

Choose AMI
Select instance type
Attach VPC & subnet
Assign Security Group
Launch instance

# Method 2: Automated Setup (Terraform)
Step 1: Install Terraform
```terraform --version ```

Step 2: Initialize Terraform
```terraform init```

Step 3: Define Infrastructure (main.tf)

Terraform configuration includes:

VPC
Subnets
Internet Gateway
Route Tables
Security Groups
EC2 Instance

Step 4: Plan Infrastructure
```terraform plan```

Step 5: Apply Configuration
```terraform apply```

Step 6: Destroy Resources (Optional)
```terraform destroy```

# Repository Structure
```
AWS-TERRAFORM-DOCUMENTATION/
│── main.tf
│── provider.tf
│── variables.tf
│── README.md
```

# Key Learnings

Understanding AWS networking fundamentals
Creating secure cloud infrastructure
Difference between manual and automated provisioning
Basics of Infrastructure as Code (IaC)

# Conclusion

This task helped in gaining hands-on experience with AWS core services and understanding how Terraform simplifies infrastructure management by automating resource provisioning.
