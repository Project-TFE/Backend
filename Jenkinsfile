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

        stage('Build Docker Image Backend') {
            steps {
                script {
                    docker.build("${DOCKER_USERNAME}/${IMAGE_NAME_BACK}:latest")
                }
            }
        }

        stage('Run Static Analysis') {
            steps {
                script {
                    // Exécuter le conteneur en arrière-plan
                    sh 'docker run --name backend-analysis -d ${DOCKER_USERNAME}/${IMAGE_NAME_BACK}:latest'

                    // Attendre que le conteneur termine l'analyse (ajustez le temps si nécessaire)
                    sh 'sleep 30'

                    // Copier les rapports depuis le conteneur vers l'hôte Jenkins
                    sh 'docker cp backend-analysis:/Ehealth/target/checkstyle-result.xml ./checkstyle-result.xml'
                    sh 'docker cp backend-analysis:/Ehealth/target/pmd.xml ./pmd.xml'
                    sh 'docker cp backend-analysis:/Ehealth/target/spotbugsXml.xml ./spotbugsXml.xml'

                    // Arrêter et supprimer le conteneur
                    sh 'docker stop backend-analysis'
                    sh 'docker rm backend-analysis'
                }
            }
        }

        stage('Push Docker Image Backend') {
            steps {
                script {
                    docker.withRegistry("https://${DOCKER_REGISTRY}/v1/", 'docker-credentials') {
                        docker.image("${DOCKER_USERNAME}/${IMAGE_NAME_BACK}:latest").push()
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

    post {
        always {
            recordIssues tools: [
                checkStyle(pattern: 'checkstyle-result.xml'),
                pmdParser(pattern: 'pmd.xml'),
                spotBugs(pattern: 'spotbugsXml.xml')
            ]
        }
    }
}
