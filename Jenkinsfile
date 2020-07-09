pipeline {
     agent any
     stages {
          stage('Test') {
               steps {
                    sh 'tidy -q -e project/*.html'
               }
          }
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
          stage('install env') {
               steps { 
                    wget https://download.docker.com/linux/ubuntu/dists/bionic/pool/stable/amd64/docker-ce_19.03.11~3-0~ubuntu-bionic_amd64.deb
                    wget https://download.docker.com/linux/ubuntu/dists/bionic/pool/stable/amd64/docker-ce-cli_19.03.11~3-0~ubuntu-bionic_amd64.deb
                    wget https://download.docker.com/linux/ubuntu/dists/bionic/pool/stable/amd64/containerd.io_1.2.13-1_amd64.deb

                    sudo dpkg -i docker-ce_19.03.11~3-0~ubuntu-bionic_amd64.deb
                    sudo dpkg -i docker-ce-cli_19.03.11~3-0~ubuntu-bionic_amd64.deb
                    sudo dpkg -i docker-ce_19.03.11~3-0~ubuntu-bionic_amd64.deb

                    curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
                    chmod +x ./kubectl
                    sudo mv ./kubectl /usr/local/bin/kubectl

                    curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64   && chmod +x minikube
                    sudo mkdir -p /usr/local/bin/
                    sudo install minikube /usr/local/bin/

               }
          }  
          stage('Deploy') {
               steps {
                    sh """  
                         whoami 
                         curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
                    """
               }
          }       
     }
}    