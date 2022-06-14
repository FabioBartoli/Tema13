pipeline{
    agent any

    parameters {
        choice(choices: ['Build', 'Destroy'], name: 'pipeAction')
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
                   return params.pipeAction == 'Build'
                }
            }
            steps{
                build job: 'LAUNCH'
            }
        when {
                expression {
                    return params.pipeAction == 'Destroy'
                }
            }
            steps {
                sh "docker container stop python_service"
            }
        }
    }
}