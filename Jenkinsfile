pipeline {
     agent any
     stages {
          stage('Test') {
               steps {
                    sh 'tidy -q -e project/*.html'
               }
          }
          // stage('Security Scan') {
          //      steps { 
          //           aquaMicroscanner imageName: 'nginx:latest', notCompleted: 'exit 1', onDisallowed: 'fail'
          //      }
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
          stage('Deploy') {
               steps {
                    sh """  
                         ansible-playbook deploy.yaml inventory --become-user sudo
                    """
               }
          }       
     }
}    