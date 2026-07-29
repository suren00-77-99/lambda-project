# 🚀 AWS Serverless Employee CRUD API using Terraform

## 📖 Project Overview

This project demonstrates how to build a production-style **AWS
Serverless CRUD API** using **Terraform**, **AWS Lambda**, **API
Gateway**, **DynamoDB**, **CloudWatch**, **SNS**, and **Jenkins CI/CD**.

The goal of this project was to understand the complete lifecycle of
deploying a serverless application using Infrastructure as Code (IaC),
automating deployments with Jenkins, monitoring the application, and
troubleshooting common deployment issues.

------------------------------------------------------------------------

# 🎯 Objectives

-   Learn Infrastructure as Code (Terraform)
-   Build a serverless REST API using AWS Lambda
-   Integrate API Gateway with Lambda
-   Store employee data in DynamoDB
-   Automate deployments using Jenkins CI/CD
-   Configure monitoring with CloudWatch
-   Configure notifications using SNS
-   Build reusable Terraform modules

------------------------------------------------------------------------

# 🏗️ Solution Architecture

``` text
Developer
    │
    ▼
GitHub Repository
    │
    ▼
Jenkins CI/CD Pipeline
    │
    ├── Terraform Init
    ├── Terraform Validate
    ├── Terraform Plan
    ├── Manual Approval
    └── Terraform Apply
    │
    ▼
AWS Cloud
    │
    ├── API Gateway
    │      │
    │      ▼
    │   AWS Lambda
    │      │
    │      ▼
    │   DynamoDB
    │
    ├── CloudWatch Logs
    └── SNS Email Notifications
```

------------------------------------------------------------------------

# 🚀 Project Workflow

1.  Designed the project using reusable Terraform modules.
2.  Provisioned AWS infrastructure using Terraform.
3.  Created a Python Lambda function to handle employee CRUD operations.
4.  Connected API Gateway with Lambda.
5.  Integrated Lambda with DynamoDB.
6.  Enabled CloudWatch logging for monitoring.
7.  Configured SNS notifications for alerts.
8.  Automated deployment using Jenkins.
9.  Created a dedicated Jenkins pipeline for infrastructure destruction.
10. Validated the API using API Gateway endpoints.

------------------------------------------------------------------------

# ☁️ AWS Services Used

-   AWS Lambda
-   API Gateway
-   DynamoDB
-   IAM
-   CloudWatch
-   SNS
-   Terraform
-   Jenkins
-   GitHub

------------------------------------------------------------------------

# 🔄 CI/CD Workflow

-   Source code pushed to GitHub
-   Jenkins checks out the repository
-   Terraform initializes the project
-   Terraform validates the configuration
-   Terraform creates the execution plan
-   Manual approval before deployment
-   Terraform provisions AWS resources
-   Lambda package is created
-   Application becomes available through API Gateway

------------------------------------------------------------------------

# ⚠️ Challenges & Troubleshooting

## 1. Terraform Module Reference Errors

**Issue**

Module references were inconsistent across the project.

**Resolution**

Standardized module names and updated all references.

------------------------------------------------------------------------

## 2. Duplicate Terraform Outputs

**Issue**

Terraform validation failed because output variables were defined more
than once.

**Resolution**

Removed duplicate output definitions.

------------------------------------------------------------------------

## 3. Missing Required Variables

**Issue**

Terraform reported missing variables such as `dynamodb_table_name`.

**Resolution**

Passed required values between modules using outputs.

------------------------------------------------------------------------

## 4. AWS Authentication Error

**Issue**

Terraform could not locate AWS credentials.

**Resolution**

Configured AWS CLI credentials and verified access before deployment.

------------------------------------------------------------------------

## 5. Jenkins Pipeline Error

**Issue**

`pytest: command not found`

**Resolution**

The project did not include unit tests, so the unnecessary pytest stage
was removed.

------------------------------------------------------------------------

## 6. API Gateway Response

**Issue**

`{"message":"Not Found"}`

**Resolution**

Verified the API route and used the correct `/employee` endpoint.

------------------------------------------------------------------------

## 7. Empty Response

**Issue**

`[]`

**Resolution**

Confirmed the Lambda was working correctly and populated the DynamoDB
table with sample data.

------------------------------------------------------------------------

## 8. Jenkins Destroy Pipeline

**Issue**

Unable to find `Jenkins-destroy-ci/Jenkinsfile`.

**Resolution**

Verified the repository structure and corrected the Jenkins Script Path.

------------------------------------------------------------------------

# 📈 Skills Demonstrated

-   Infrastructure as Code
-   Serverless Architecture
-   Terraform Modules
-   AWS Lambda
-   API Gateway
-   DynamoDB
-   Jenkins CI/CD
-   IAM
-   CloudWatch
-   SNS
-   Git & GitHub
-   Troubleshooting

------------------------------------------------------------------------

# 📚 Key Learnings

-   Building scalable serverless applications
-   Creating reusable Terraform modules
-   Automating deployments with Jenkins
-   Managing AWS permissions securely
-   Monitoring serverless applications
-   Diagnosing Terraform and Jenkins pipeline issues

------------------------------------------------------------------------

# 🚀 Future Enhancements

-   Multi-environment deployment
-   GitHub Actions
-   Docker support
-   Kubernetes deployment
-   Cognito authentication
-   SonarQube integration
-   Trivy security scanning
-   Terraform Cloud

------------------------------------------------------------------------

# 👨‍💻 Author

**Suren Raj**

AWS DevOps Engineer

GitHub Repository: https://github.com/suren00-77-99/lambda-project

------------------------------------------------------------------------

If this project helps you, consider giving the repository a ⭐ on
GitHub.
