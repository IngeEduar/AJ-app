pipeline {
    agent any

    environment {
        APP_NAME = 'ingeeduar/ajpython'
    }

    stages {
        stage('Declarative: Checkout SCM') {
            steps {
                checkout scm
            }
        }

        stage('Build and Push Docker Image') {
            steps {
                script {
                    def image = "${APP_NAME}:1.0.1-${BUILD_NUMBER}"
                    sh "docker build . -t ${image}  && docker push ${image}"
                }
            }
        }
    }
}
