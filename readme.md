# Infrastructure as Code Project with Terraform

This project demonstrates the use of Terraform to manage and provision cloud infrastructure on AWS. It includes configurations for a Virtual Private Cloud (VPC), Application Load Balancer (ALB), Auto Scaling Group (ASG), and Relational Database Service (RDS).

## Table of Contents

- [Project Overview](#project-overview)
- [Architecture](#architecture)
- [Modules](#modules)
- [Prerequisites](#prerequisites)
- [Setup and Deployment](#setup-and-deployment)
- [Variables](#variables)
- [Security Considerations](#security-considerations)
- [Contributing](#contributing)
- [License](#license)

## Project Overview

This project is designed to showcase a scalable and secure cloud infrastructure using Terraform. It leverages AWS services to create a robust environment suitable for hosting web applications.

## Architecture

The architecture includes:

- **VPC**: A Virtual Private Cloud with public and private subnets across two availability zones.
- **ALB**: An Application Load Balancer to distribute incoming traffic across multiple instances.
- **ASG**: An Auto Scaling Group to ensure the application scales based on demand.
- **RDS**: A managed MySQL database instance for persistent data storage.

## Modules

The project is organized into the following modules:

- **VPC Module**: Manages the network infrastructure.
- **ALB Module**: Configures the load balancer and its security settings.
- **ASG Module**: Sets up the auto-scaling group and launch templates.
- **RDS Module**: Provisions the database instance and its subnet group.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed on your local machine.
- An AWS account with appropriate permissions to create resources.
- AWS CLI configured with your credentials.

## Setup and Deployment

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/yourusername/terraform-iac-project.git
   cd terraform-iac-project
   ```

2. **Initialize Terraform**:
   ```bash
   terraform init
   ```

3. **Plan the Deployment**:
   ```bash
   terraform plan
   ```

4. **Apply the Configuration**:
   ```bash
   terraform apply
   ```

5. **Destroy the Infrastructure** (when no longer needed):
   ```bash
   terraform destroy
   ```

## Variables

The project uses several variables to customize the deployment. These are defined in the `variables.tf` files within each module. Sensitive information such as database credentials should be managed securely.

## Security Considerations

- Ensure that your AWS credentials are stored securely and not hard-coded in the project files.
- Review and configure security groups to allow only necessary traffic.
- Use Terraform's state locking feature to prevent concurrent modifications.

## License

Copyright © 2025 Samuel Lincoln. All rights reserved.