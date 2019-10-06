pipeline {
    agent any
    stages {
        stage('Build application') {
            steps {
                sh './scripts/build.sh'
            }
            post {
                always {
                    publishHTML([allowMissing         : true,
                                 alwaysLinkToLastBuild: true,
                                 keepAll              : true,
                                 reportDir            : 'build/reports/tests/test',
                                 reportFiles          : '**/*',
                                 reportName           : 'JUnit tests',
                                 reportTitles         : ''
                    ])
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(
                        credentialsId: 'dockerhub',
                        usernameVariable: 'DOCKER_ID',
                        passwordVariable: 'DOCKER_PASSWORD'
                )])
                sh """ 
                    echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_ID" --password-stdin
                    ./scripts/upload_docker.sh 
                """
            }
        }
    }
}
