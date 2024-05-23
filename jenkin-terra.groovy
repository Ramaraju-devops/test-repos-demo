pipeline {
    agent any

    environment {
        AZURE_CREDENTIALS = credentials('your-azure-credentials-id')
        TF_VAR_client_id = "${AZURE_CREDENTIALS_USR}"
        TF_VAR_client_secret = "${AZURE_CREDENTIALS_PSW}"
        TF_VAR_subscription_id = "${AZURE_CREDENTIALS_SUBSCRIPTION_ID}"
        TF_VAR_tenant_id = "${AZURE_CREDENTIALS_TENANT}"
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/Ramaraju-devops/test-repos-demo.git'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -out=tfplan'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply tfplan'
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
