pipeline {
    agent any

    environment {
        APP_NAME = 'AJ-app'
        DOCKER_IMAGE = "IngeEduar/${APP_NAME}"
        DOCKER_HUB_REGISTRY = 'docker.io'
        DOCKER_HUB_USER = 'IngeEduar'
        DOCKER_HUB_PASSWORD = credentials('793b33f9-e155-403c-9126-79d84b81208b')
    }

    stages {
        stage('Install Docker') {
            steps {
                script {
                    def dockerInstallation = tool name: 'docker', type: 'org.jenkinsci.plugins.docker.commons.tools.DockerTool'
                    if (dockerInstallation == null) {
                        error 'Docker no está instalado. Instala el tool "docker" en la configuración de Jenkins.'
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
            
                    // Construir la imagen
                    docker.build(DOCKER_IMAGE)

                    // Autenticarse en el registro de Docker Hub y empujar la imagen
                    docker.withRegistry("${DOCKER_HUB_REGISTRY}", '793b33f9-e155-403c-9126-79d84b81208b') {
                        docker.image(DOCKER_IMAGE).push()
                    }
                }
            }
        }
    }
}
