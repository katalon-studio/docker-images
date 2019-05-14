pipeline {

    agent any

    environment {
        KS_VERSION = '6.1.5'
    }

    stages {
        stage ("DO NOT DISABLE THIS STAGE") {
            steps {
                sh '''
                    chmod u+x ./build/*.sh
                    ./build/prevent_overwrite_existing_tag.sh $KS_VERSION
                '''
            }
        }
        stage ("Build") {
            steps {
                lock('katalon-docker-images') {

                    sh 'chmod u+x ./build/*.sh'
                    sh './build/clean.sh $KS_VERSION'
                    sh './build/build.sh $KS_VERSION'
                    sh './build/tag.sh $KS_VERSION'

                    sh 'chmod u+x ./test/project/*.sh'
                    sh 'cd ./test/project && ./run_chrome.sh $KS_VERSION'
                    sh 'cd ./test/project && ./run_chrome_advanced.sh $KS_VERSION'
                    sh 'cd ./test/project && ./run_firefox.sh $KS_VERSION'
                    archiveArtifacts '**/*.avi'

                    withDockerRegistry([ credentialsId: "docker-hub", url: "" ]) {
                        sh '''
                            ./build/tag.sh $KS_VERSION
                            ./build/push.sh $KS_VERSION
                            ./build/tag.sh latest
                            ./build/push.sh latest
                        '''
                    }
                }
            }
        }
    }
}
