pipeline {
    agent any
    stages {
        // stage('Build Docker Image') {
        //     steps {
        //         echo '=== Building Petclinic Docker Image ==='
        //         script {
        //             app = docker.build("khaledgamalelsayed/webserver")
        //         }
        //     }
        // }
        // stage('Push Docker Image') {
        //     steps {
        //         echo '=== Pushing Petclinic Docker Image ==='
        //         script {
        //             GIT_COMMIT_HASH = sh (script: "git log -n 1 --pretty=format:'%H'", returnStdout: true)
        //             SHORT_COMMIT = "${GIT_COMMIT_HASH[0..7]}"
        //             docker.withRegistry('https://registry.hub.docker.com', 'dockerHubCredentials') {
        //                 app.push("$SHORT_COMMIT")
        //                 app.push("latest")
        //             }
        //         }
        //     }
        // }
        // stage('Remove local images') {
        //     steps {
        //         echo '=== Delete the local docker images ==='
        //         sh("docker rmi -f khaledgamalelsayed/webserver")
        //     }
        // }
        stage('AWS Credentials') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'MyCred', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                sh """  
                    mkdir -p ~/.aws
                    echo "[default]" >~/.aws/credentials
                    echo "[default]" >~/.boto
                    echo "aws_access_key_id = ${AWS_ACCESS_KEY_ID}" >>~/.boto
                    echo "aws_secret_access_key = ${AWS_SECRET_ACCESS_KEY}">>~/.boto
                    echo "aws_access_key_id = ${AWS_ACCESS_KEY_ID}" >>~/.aws/credentials
                    echo "aws_secret_access_key = ${AWS_SECRET_ACCESS_KEY}">>~/.aws/credentials
                """
                }
            }
        }
        stage("Development deploy"){
            steps {
                sh("kubectl apply -f controller/Development-controller.json")
            }
        }
     }
}