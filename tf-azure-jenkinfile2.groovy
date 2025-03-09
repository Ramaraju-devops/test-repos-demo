pipeline {
    agent any

    environment {
        AZURE_CREDENTIALS = credentials('AZURE_CONNECTION')
    }

    parameters {
     //   string(name: 'TerraformApply', defaultValue: 'do not apply', description: 'this is for apply condition')
        booleanParam(name: 'TerraformApply', defaultValue: false, description: 'this is for apply condition')
    }

    stages {
        stage('Terraform INIT') {
                steps {
                    script {
                            sh '''az login --service-principal -u $AZURE_CREDENTIALS_CLIENT_ID -p $AZURE_CREDENTIALS_CLIENT_SECRET --tenant $AZURE_CREDENTIALS_TENANT_ID
                                az account show
                                cd RG-Creation
                                terraform init
                                '''
                    }
            }
        }
        stage('Terraform Validate') {
                steps {
                    script {
                            sh '''
                                cd RG-Creation
                                terraform validate
                                '''
                    }
            }
        }
        stage('Terraform Plan') {
                steps {
                    script {
                            sh '''
                                cd RG-Creation
                                terraform plan
                                '''
                    }
            }
        }
        stage('Terraform Apply') {
            //when { expression { params.TerraformApply == 'apply' } }
            when { expression { params.TerraformApply == true } }
                steps {
                    script {
                            sh '''
                                cd RG-Creation
                                terraform apply -auto-approve
                                '''
                    }
            }
        }
    }
}