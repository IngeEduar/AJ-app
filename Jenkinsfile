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
        stage('Build and Push Docker Image') {
            steps {
                script {
                    docker.build(DOCKER_IMAGE, "-f Dockerfile .")

                    docker.withRegistry("${DOCKER_HUB_REGISTRY}", '793b33f9-e155-403c-9126-79d84b81208b') {
                        docker.image(DOCKER_IMAGE).push()
                    }
                }
            }
        }

        // stage('Deploy with ArgoCD') {
        //     steps {
        //         script {
        //             sh "argocd app create ${APP_NAME} --repo https://github.com/IngeEduar/AJ-app.git --path . --dest-server https://kubernetes.default.svc --dest-namespace ${KUBE_NAMESPACE}"
        //             sh "argocd app sync ${APP_NAME}"
        //         }
        //     }
        // }
    }
}
