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

        stage('Destroy'){
        when {
                expression {
                    return params.pipeAction == 'Destroy'
                }
            }
            steps {
                sh "docker container stop python_service"
                sh "docker image remove trilhajt/pythonserver:1.0 --force"
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