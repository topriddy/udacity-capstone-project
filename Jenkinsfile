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
                                 reportDir            : 'build/reports/checkstyle',
                                 reportFiles          : '**/*',
                                 reportName          : 'Checkstyle',
                                 reportTitles         : ''
                    ])
                    publishHTML([allowMissing         : true,
                                 alwaysLinkToLastBuild: true,
                                 keepAll              : true,
                                 reportDir            : 'build/reports/findbugs',
                                 reportFiles          : '**/*',
                                 reportName          : 'Findbugs',
                                 reportTitles         : ''
                    ])
                    publishHTML([allowMissing         : true,
                                 alwaysLinkToLastBuild: true,
                                 keepAll              : true,
                                 reportDir            : 'build/reports/tests/test',
                                 reportFiles          : '**/*',
                                 reportName          : 'JUnit tests',
                                 reportTitles         : 'junit tests'
                    ])
                }
            }
        }
    }
}
