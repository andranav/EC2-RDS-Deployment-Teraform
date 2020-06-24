# Terraform configuration to deploy Flask Web app

## Description

Creates multi-AZ infrastructure on AWS and runs a simple python application on it.

Terraform script execution results in followings.
- Creates a VPC.
- Creates two public subnets in different AZs inside the VPC.
- Creates two private subnets in different AZs inside the VPC.
- Creates two EC2 instances in public subnets.
- Creates a multi-AZ RDS instance in private subnets.
- Creates an ELB on top of EC2 instances.


#### Usage

1. Clone the project.
2. cd into the project root folder.  
3. Install [Terraform](https://www.terraform.io/downloads.html).
4. Make sure you have set your AWS [cedentials](https://docs.aws.amazon.com/sdk-for-java/v1/developer-guide/setup-credentials.html).
5. Specify ssh public key path via **SSH_PUBLIC_KEY** environment variable (e.g. export SSH_PUBLIC_KEY="~/.ssh/id_rsa.pub").   
5. Run deploy.sh script to deploy the stack.
6. Run destroy.sh script to destroy the stack. 

#### TODO

1. Add ability for users to pass the AWS region to terraform code, and retrieve AMI from AWS dynamically.
2. Use Terraform modules to avoid code duplications and make the code more reusable.
3. Make the infrastructure auto scalable to support high load.
