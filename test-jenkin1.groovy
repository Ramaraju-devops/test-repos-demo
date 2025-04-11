pipeline {
  agent any


  environment {
    BRANCH = 'master'
    REPO = 'https://github.com/Ramaraju-devops/test-repos-demo.git'


    ARM_ACCESS_KEY = credentials('AZURE_STORAGE_ACCOUNT_KEY')
    ARM_CLIENT_ID = credentials('AZURE_CLIENT_ID')
    ARM_CLIENT_SECRET = credentials('AZURE_CLIENT_SECRET')
    ARM_SUBSCRIPTION_ID = credentials('AZURE_SUBSCRIPTION_ID')
    ARM_TENANT_ID = credentials('ARM_TENANT_ID')
  }

  stages {

    stage('Checkout Source') {
      steps {
        git branch: "$BRANCH",
            url: "$REPO"
      }
    }


    stage('Terraform - init') {
      steps {
          sh 'terraform init -upgrade'
      }
    }


    stage('Terraform - validate') {
      steps {
          sh 'terraform validate'
      }
    }

    stage('Terraform - plan') {
      steps {
          sh 'terraform plan'
      }
    }

    stage('Terraform - apply') {
      steps {
          sh 'terraform apply -auto-approve'
      }
    }

  }


  post {
    always {
      cleanWs()
    }
  }
} // pipeline
