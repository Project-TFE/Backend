pipeline {
    agent { label 'azure-agent' }

    environment {
        DOCKER_REGISTRY = "index.docker.io"
        DOCKER_USERNAME = "aymar100"
        IMAGE_NAME_BACK = "backend-app"
        IMAGE_NAME_DB = "database-app"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM',
                    branches: [[name: '*/main']],
                    userRemoteConfigs: [[
                        url: 'https://github.com/Project-TFE/Backend.git',
                        credentialsId: '30989c36-de19-497a-b96e-17aa4b90c235'
                    ]]
                ])
            }
        }

        stage('Build & Push Docker Image Backend') {
            steps {
                script {
                    def image = docker.build("${DOCKER_USERNAME}/${IMAGE_NAME_BACK}:latest")

                    docker.withRegistry("https://${DOCKER_REGISTRY}/v1/", 'docker-credentials') {
                        image.push()
                    }
                }
            }
        }

        stage('Build & Push Docker Image DB') {
            steps {
                dir('DB') {
                    script {
                        def image = docker.build("${DOCKER_USERNAME}/${IMAGE_NAME_DB}:latest")

                        docker.withRegistry("https://${DOCKER_REGISTRY}/v1/", 'docker-credentials') {
                            image.push()
                        }
                    }
                }
            }
        }
    }
}
