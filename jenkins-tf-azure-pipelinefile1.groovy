pipeline {
    agent any

    environment {
        ARM_ACCESS_KEY = credentials('AZURE_STORAGE_ACCOUNT_KEY')
        ARM_CLIENT_ID = credentials('AZURE_CLIENT_ID')
        ARM_CLIENT_SECRET = credentials('AZURE_CLIENT_SECRET')
        ARM_SUBSCRIPTION_ID = credentials('AZURE_SUBSCRIPTION_ID')
        ARM_TENANT_ID = credentials('AZURE_TENANT_ID')
    }

    parameters {
     //   string(name: 'TerraformApply', defaultValue: 'do not apply', description: 'this is for apply condition')
        booleanParam(name: 'TerraformApply', defaultValue: false, description: 'this is for apply condition')
    }

    stages {
        stage('Terraform INIT') {
            steps {
                script {
                    sh '''
                        cd RG-Creation1
                        terraform init -upgrade
                    '''
                }
            }
        }

        stage('Terraform Validate') {
            steps {
                sh '''
                        cd RG-Creation1
                        terraform validate
                    '''
            }
        }

        stage('Terraform PLAN') {
            steps {
                script {
                    sh '''
                        cd RG-Creation1
                        terraform plan
                    '''
                }
            }
        }

        stage('Terraform APPLY') {
            when { expression { params.TerraformApply == true } }
                steps {
                    script {
                        sh '''
                            cd RG-Creation1
                            terraform apply --auto-approve
                        '''
                    }
                }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
} // pipeline
