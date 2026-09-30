pipeline {
    agent any

    environment {
        IMAGE_NAME = 'ci-cd-demo'
        CONTAINER_NAME = 'ci-cd-demo-app'
        APP_PORT = '8081'
    }

    stages {

        stage('Checkout') {
            steps {
                echo 'Checking out source code from GitHub'
                checkout scm
            }
        }

        stage('Build') {
            steps {
                echo 'Building Java application with Maven'
                sh 'mvn clean compile'
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests'
                sh 'mvn test'
            }
        }

        stage('Package') {
            steps {
                echo 'Creating JAR package'
                sh 'mvn package -DskipTests'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image'

                sh '''
                    docker build \
                    -t ${IMAGE_NAME}:${BUILD_NUMBER} \
                    -t ${IMAGE_NAME}:latest .
                '''
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying application container'

                sh '''
                    docker rm -f ${CONTAINER_NAME} || true

                    docker run -d \
                    --restart unless-stopped \
                    --name ${CONTAINER_NAME} \
                    -p ${APP_PORT}:8080 \
                    ${IMAGE_NAME}:${BUILD_NUMBER}
                '''
            }
        }

        stage('Verify Deployment') {
            steps {
                echo 'Checking application availability'

                sh '''
                    curl --fail \
                    --silent \
                    --show-error \
                    --retry 10 \
                    --retry-delay 2 \
                    --retry-connrefused \
                    http://127.0.0.1:${APP_PORT}/
                '''
            }
        }
    }

    post {
        success {
            echo 'CI/CD Pipeline completed successfully!'
        }

        failure {
            echo 'CI/CD Pipeline failed. Check the console output.'
        }
    }
}