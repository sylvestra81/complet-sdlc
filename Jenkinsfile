pipeline {
    agent any
    tools{
        maven 'maven'
    }
    stages{
        stage ('Build Maven'){
            steps{
                checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/sylvestra81/complet-sdlc']])
                sh 'mvn clean install'
            }
        }
        stage ('Build docker image'){
            steps{
                script{
                sh 'docker build -t sylvestra/complet-sdlc .'
                }
            }
        }
        stage ('Login to Hub'){
            steps{
                script{
                   withCredentials([string(credentialsId: 'sylvestra', variable: 'docerhubpwd')]){
                   sh 'docker login -u sylvestra -p ${docerhubpwd}'
}
                }
            }
        }
        stage ('Push image to docker Hub'){
            steps{
                script{
                     sh 'docker push sylvestra/complet-sdlc'
                }
            }
        }
    }
}


