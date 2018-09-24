pipeline {
    agent any
    stages {
        stage ("Build") {
            steps {
                sh './build/build.sh'
                sh '"./test/katalon sample project/run_chrome.sh"'
            }
        }
    }
}