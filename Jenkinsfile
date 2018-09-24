pipeline {
    agent any
    stages {
        stage ("Build") {
            agent any
            steps {
                sh './build/build.sh'
            }
        }
    }
}