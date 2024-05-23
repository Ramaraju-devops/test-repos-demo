pipeline {
    agent any

    environment {
        AZURE_CREDENTIALS = credentials('08f79609-f178-4576-8efd-f76e173dc691')
        TF_VAR_client_id = "${AZURE_CREDENTIALS_USR}"
        TF_VAR_client_secret = "${AZURE_CREDENTIALS_PSW}"
        TF_VAR_subscription_id = "${AZURE_CREDENTIALS_SUBSCRIPTION_ID}"
        TF_VAR_tenant_id = "${AZURE_CREDENTIALS_TENANT}"
    }

    stages {
        // stage('Checkout') {
        //     steps {
        //         git checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[credentialsId: 'd4c79c4f-4624-4fdb-9eef-ed30370e7d07', url: 'https://github.com/Ramaraju-devops/test-repos-demo']])
        //     }
        // }

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
