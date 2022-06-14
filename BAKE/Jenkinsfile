pipeline {
    agent any

    stages {
        stage('Packer - Bake Docker Image') {
            steps {
                sh "packer init ."
                sh "packer build bake-docker.pkr.hcl"              
            }
        }
    }
}