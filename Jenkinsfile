pipeline {
    agent any 
    environment {
    DOCKERHUB_CREDENTIALS = credentials('docker-hub')
    }
    stages { 

        stage('Build docker image') {
            steps {  
                sh 'podman build -t loikjohan/hello:v2 .'
            }
        }
        stage('login to dockerhub') {
            steps{
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | podman login docker.io -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('push image') {
            steps{
                sh 'podman push docker.io/loikjohan/hello:v2'
            }
        }
}
post {
        always {
            sh 'podman logout docker.io'
        }
    }
}
