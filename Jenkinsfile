#!groovy

PROJECT_NAME = "dev.na.bambora.com"
ENV = 'test'

REGION = 'us-west-2'
//ACCOUNT = '056252067802'

SLACK_CHANNEL = "#vic-web-ci"
SLACK_ID = "vic-payments-ci"

timestamps {
    node("$ENV") {
        try {
            stage('build') {
                deleteDir()
                checkout scm

                def ret = sh script: "git rev-parse --short HEAD", returnStdout: true
                def sha = ret.trim()

                def full_sha = sh(script: "git rev-parse HEAD", returnStdout: true).trim()

                def image = "$PROJECT_NAME-$ENV-$REGION:$sha"
                echo "Image: $image"
                //sh """\$(AWS_DEFAULT_REGION=$REGION aws ecr get-login --no-include-email)"""
                docker.withRegistry("https://$REGISTRY") {
                    built_image = docker.build("$image", " .")
                }
                sh """
                export BRANCH=$BRANCH_NAME
                export APP_HOME=`pwd`
                ./build_content.sh
                """
                sh """ docker rmi $image"""
            }

            currentBuild.result = 'SUCCESS'
        } catch (e) {
            currentBuild.result = 'FAILURE'
            throw e
        } finally {
            if(currentBuild.result == 'SUCCESS') {
                withCredentials([usernamePassword(credentialsId: "$SLACK_ID", usernameVariable: 'username', passwordVariable: 'TOKEN')]) {
                    slackSend color: "good", message: "Build Successful - ${env.JOB_NAME} ${env.BUILD_NUMBER} (<${env.BUILD_URL}console|Open>)", token: "$TOKEN", channel: "$SLACK_CHANNEL"
                }
            }
            else if(currentBuild.result == 'FAILURE') {
                withCredentials([usernamePassword(credentialsId: "$SLACK_ID", usernameVariable: 'username', passwordVariable: 'TOKEN')]) {
                    slackSend color: "danger", message: "Build Failed - ${env.JOB_NAME} ${env.BUILD_NUMBER} (<${env.BUILD_URL}console|Open>)", token: "$TOKEN", channel: "$SLACK_CHANNEL"
                }
            }
        }
    }
}
