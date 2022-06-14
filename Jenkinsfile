pipeline{
    agent any
    stages{
        stage('Build'){
            steps{
                build job: 'BAKE'
            }
        }

        stage('Deploy'){
            steps{
                build job: 'LAUNCH'
            }
        }
    }
}