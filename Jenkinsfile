pipeline {
    agent any

    environment {
        APP_NAME = 'AJ-app'
        DOCKER_IMAGE = "IngeEduar/${APP_NAME}"
        DOCKER_HUB_REGISTRY = 'docker.io'
        DOCKER_HUB_USER = 'IngeEduar'
        DOCKER_HUB_PASSWORD = credentials('793b33f9-e155-403c-9126-79d84b81208b')
        // KUBE_NAMESPACE = 'default'
    }

    stages {
        stage('Install Docker') {
            steps {
                script {
                    // Descargar e instalar Docker
                    def dockerInstallation = tool name: 'docker', type: 'org.jenkinsci.plugins.docker.commons.tools.DockerTool'
                    if (dockerInstallation == null) {
                        echo 'Docker no está instalado. Descargando e instalando...'
                        dockerInstallation = tool name: 'docker', type: 'org.jenkinsci.plugins.docker.commons.tools.DockerTool', install: 'latest'
                    }
                }
            }
        }

        stage('Declarative: Checkout SCM') {
            steps {
                checkout scm
            }
        }

        stage('Build and Push Docker Image') {
            steps {
                script {
                    def docker = tool name: 'docker', type: 'org.jenkinsci.plugins.docker.commons.tools.DockerTool'

                    docker.build(DOCKER_IMAGE)

                    docker.withRegistry("${DOCKER_HUB_REGISTRY}", '793b33f9-e155-403c-9126-79d84b81208b') {
                        docker.image(DOCKER_IMAGE).push()
                    }
                }
            }
        }
    }
}
