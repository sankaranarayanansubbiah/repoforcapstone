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
                withCredentials([usernamePassword(credentialsId: "${DOCKER_REGISTRY_CREDS}", passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
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

    // Post-build actions
    post {
        always {
            // Clean up Docker credentials after use
            script {
                echo 'Cleaning up Docker credentials...'
                sh 'unset DOCKER_USERNAME DOCKER_PASSWORD'
            }
        }

        failure {
            // Handle failure scenario
            echo 'Deployment failed.'
        }
    }
}
