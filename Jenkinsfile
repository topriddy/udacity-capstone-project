pipeline {
    agent any
    stages {
        stage('Linting') {
            steps {
                sh 'hadolint Dockerfile'
            }
        }
        stage('Build Application & Docker Image') {
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
                )]) {
                    sh '''
                    echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_ID" --password-stdin
                    ./scripts/upload_docker.sh 
                    '''
                }
            }
        }
        stage("Trigger Deployment") {
            steps {
                build(
                        job: 'udacity-capstone-project-deploy',
                        parameters: [string(name: 'dockerTag', value: "${$BUILD_NUMBER}")],
                        propagate: false,
                        wait: false
                )
            }
        }
    }
}
