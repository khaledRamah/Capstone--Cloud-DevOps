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
        stage("Deploy"){
            steps {
                sh("kubectl apply -f controller/blue-controller.json")
            }
        }
     }
}