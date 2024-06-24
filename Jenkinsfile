pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                // Execute build script
                sh './build.sh'
            }
        }
        stage('Deploy') {
            steps {
                // Docker login and deploy with credentials
                withCredentials([usernamePassword(credentialsId: "${dockerhub}", passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                    // Docker login to docker.io registry
                    script {
                        sh "echo \$DOCKER_PASSWORD | docker login -u \$DOCKER_USERNAME --password-stdin docker.io"
                    }

                    // Execute deploy script
                    sh './deploy.sh'
                }
            }
        }
    }
