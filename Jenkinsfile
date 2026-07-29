pipeline {
    agent any
    environment {
        AWS_DEFAULT_REGION = 'ap-south-1'
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'master',
                url: 'https://github.com/suren00-77-99/lambda-project.git'
            }
        }

        stage('Terraform Init') {
            steps {
                dir('Terraform') {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Format') {
            steps {
                dir('Terraform') {
                    sh 'terraform fmt -recursive'
                }
            }
        }

        stage('Terraform Validate') {
            steps {
                dir('Terraform') {
                    sh 'terraform validate'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                dir('Terraform') {
                    sh 'terraform plan'
                }
            }
        }

        stage('Approval') {
            steps {
                input "Deploy Infrastructure?"
            }
        }

        stage('Terraform Apply') {
            steps {
                dir('Terraform') {
                    sh 'terraform apply -auto-approve'
                }
            }
        }
        stage('Package Lambda') {

            steps {

                dir('lambda') {
                    sh 'zip -r lambda.zip .'
                }
            }
        }

        stage('Deploy Lambda') {

            steps {

                sh '''
                aws lambda update-function-code \
                --function-name employee-api \
                --zip-file fileb://lambda/lambda.zip
                '''
            }
        }
    }
}