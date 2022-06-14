pipeline {
    agent any

    stages {
        stage('Deploy - Docker Image') {
            steps {
                sh "docker run --name python_service -p 8080:8080 trilhajt/pythonserver:1.0"              
            }
        }
    }
}
