pipeline{
    agent any
    stages{
        stage('Build'){
            steps{
                build job: 'BAKE', parameters: [string(name: 'BAKE', value:'')]
            }
        }

        stage('Deploy'){
            steps{
                build job: 'LAUNCH'
            }
        }
    }
}