pipeline {
    agent any
    stages {
        stage ("Build") {
            steps {
                sh './build/build.sh'
                sh './test/project/run_chrome.sh'
            }
        }
    }
}