pipeline {
    agent any

    stages {
        stage('Packer - Bake Docker Image') {
            steps {
                sh "docker image remove trilhajt/pythonserver:1.0 --force"
                sh "packer init ."
                sh "packer build bake-docker.pkr.hcl"              
            }
        }
    }
}