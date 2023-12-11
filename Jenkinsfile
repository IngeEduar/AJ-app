pipeline {
    agent any

    environment {
        APP_NAME = 'IngeEduar/AJ-app'
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
                    sh "docker build . ${image} -t  && docker push ${image}"
                }
            }
        }
    }
}
