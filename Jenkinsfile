pipeline {
    parameters {
       // booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan?')
        choice(name: 'action', choices: ['apply', 'destroy'], description: 'Select the action to perform')
    } 
    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION = 'ap-south-1'
    }

    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git url: 'https://github.com/tinabhatnagar27/Elasticsearch_infra.git', branch: 'main'
            }
        }

        stage('Plan') {
            steps {
                sh 'terraform -chdir=terraform init'
                sh 'terraform -chdir=terraform validate'
                sh 'terraform -chdir=terraform plan'
            }
        }
        stage('Apply/Destroy') {
            steps {
                sh 'pwd;cd terraform/ ; terraform ${action} --auto-approve'
            }
        }

        stage('Sleep After Apply') {
            when {
                expression {
                    return params.action == 'apply'  
                }
            }
            steps {
                echo "Sleeping for 10 seconds after terraform apply"
                sleep 10
            }
        }

        stage('Approve and Run Ansible Playbook') {
            when {
                expression {
                    return params.action == 'apply'  
                }
            }
            steps {
                input message: 'Do you approve running the Ansible playbook?', ok: 'Yes', submitter: 'user'
                script {
                    echo "Running Ansible Playbook..."
                    sh 'ansible-playbook -i aws_ec2.yaml playbook.yml' 
                }
            }
        }
    }
}
