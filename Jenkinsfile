pipeline {
     agent any
     stages {
         stage('Lint HTML') {
              steps {
                  sh 'tidy -q -e *.html'
              }
         }
     //     stage('Security Scan') {
     //          steps { 
     //             aquaMicroscanner imageName: 'nginx:latest', notCompleted: 'exit 1', onDisallowed: 'fail'
     //          }
     //     }         
     }
}