pipeline{
    agent any

    parameters {
        choice(choices: ['Build', 'Destroy'], name: 'pipeAction', description: 'Gostaria de fazer o build ou destruir o ambiente?')
    }

    stages{
        stage('Build'){
            when {
                expression { 
                   return params.pipeAction == 'Build'
                }
            }
            steps{
                build job: 'BAKE'
            }
        }

        stage('Deploy'){
        when {
                expression {
                    return params.pipeAction == 'Destroy'
                }
            }
            steps {
                sh "docker container stop python_service"
            }
        }

        stage('Deploy'){
        when {
                expression { 
                   return params.pipeAction == 'Build'
                }
            }
            steps{
                build job: 'LAUNCH'
            }
        }
    }
}