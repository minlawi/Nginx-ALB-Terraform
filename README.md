# Setup Application Loadbalancer for multiple Nginx Web Server on AWS

# System Architecture Workflow
![image alt](https://github.com/minlawi/Nginx-ALB-Terraform/blob/7e4b7bf2df8aa179a760aac87818a51e13ef4224/nginx-alb-workflow.png)

# Project Overview
 - This project sets up three Nginx Webserver behind the Application Loadbalancer (Internet-facing) on AWS using Terraform. 
 - The Infrastructure is designed to be highly available and scalable.

# Technologies Used
 * Terraform for Infrastructure as Code (IaC)
 * AWS EC2, ALB (Internet-facing) type
 * VPC, Subnets, Security Groups, IGW
 * Bash Scriptiing (User data for EC2 setup)

# Disclaimer: This content is for educational purposes only and should not be used in a production environment.