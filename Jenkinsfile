pipeline {
    agent any
    stages {
        stage ("Build") {
            steps {
                sh 'chmod u+x ./build/build.sh && ./build/build.sh'
                sh 'chmod u+x ./test/project/*.sh'
                sh './test/project/run_chrome.sh'
                sh './test/project/run_chrome_advanced.sh'
                sh './test/project/run_firefox.sh'
                sh './test/project/run_firefox_advanced.sh'
            }
        }
    }
}