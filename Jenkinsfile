pipeline {
    agent any
    stages {
        stage ("Build") {
            steps {
                sh './build/build.sh'
                sh './test/project/run_chrome.sh'
                sh './test/project/run_chrome_advanced.sh'
                sh './test/project/run_firefox.sh'
                sh './test/project/run_firefox_advanced.sh'
            }
        }
    }
}