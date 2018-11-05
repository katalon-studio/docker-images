pipeline {
    agent any
    stages {
        stage ("Build") {
            steps {
                sh 'chmod u+x ./build/*.sh'
                sh './build/build.sh'
                sh './build/tag.sh'
                withDockerRegistry([ credentialsId: "docker-hub", url: "" ]) {
                    sh './build/push.sh'
                }

                sh 'chmod u+x ./test/project/*.sh'
                sh './test/project/run_chrome.sh'
                sh './test/project/run_chrome_advanced.sh'
                sh './test/project/run_firefox.sh'
            }
        }
    }
}