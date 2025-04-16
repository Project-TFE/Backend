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
                checkout scmGit(
                    branches: [[name: '*/main']],
                    extensions: [],
                    userRemoteConfigs: [[
                        credentialsId: '30989c36-de19-497a-b96e-17aa4b90c235',
                        url: 'https://github.com/Project-TFE/Backend.git'
                    ]]
                )
            }
        }

        stage('Code Quality') {
            steps {
                dir('Ehealth') {
                    echo 'Démarrage de l\'analyse statique avec Checkstyle et PMD'
                    sh 'mvn checkstyle:checkstyle pmd:pmd'
                    echo 'Analyse statique terminée'
                }
            }
            post {
                always {
                    recordIssues tools: [
                        checkStyle(pattern: '**/checkstyle-result.xml'),
                        pmdParser(pattern: '**/pmd.xml')
                    ]
                }
            }
        }

        stage('Build & Push Docker Image Backend') {
            steps {
                script {
                    def image = docker.build("${DOCKER_USERNAME}/${IMAGE_NAME_BACK}:latest", 'Backend/Ehealth-B')
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
