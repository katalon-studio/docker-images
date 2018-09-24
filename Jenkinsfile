pipeline {
    agent any
    stages {
        stage ("Build") {
            agent any
            steps {
                sh './build/build.sh'
                sh '"./test/katalon sample project/run_chrome.sh"'
            }
        }
    }
}