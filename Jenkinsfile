
pipeline {
    agent any
    stages {
        //First using SCM I cloned the private Repo with credential
        
       // stage('clone Image') {
       //     steps {
       //         git 'https://github.com/3beerkamal/ITI_Final_App_Project.git'
       //     }
       // }
        stage('build Image') {
            steps {
                sh 'docker build . -t 3beerkamal/python-app'
            }
        }
        stage('Push Image'){
            steps{
                withDockerRegistry(credentialsId: 'Docker_Hub2', url: ""){
                    //sh 'docker login -u $USERNAME -p $PASSWORD'
                    sh 'docker push 3beerkamal/python-app'
                }
            }
        }
        stage('Deploy Image'){
            steps {
                withDockerRegistry(credentialsId: 'Docker_Hub2', url: ""){
                    withCredentials([file(credentialsId: 'cluster_nodes_key', variable: '')]){
                        sh 'kubectl apply -f Deployments_yaml_Files/App/app_deployments.yaml'
                        sh 'kubectl apply -f Deployments_yaml_Files/App/app_service.yaml'
                        sh 'kubectl apply -f Deployments_yaml_Files/App/ConfigMap.yaml'
                        sh 'kubectl apply -f Deployments_yaml_Files/Redis.yaml/redis_deployment.yaml'
                        sh 'kubectl apply -f Deployments_yaml_Files/Redis.yaml/service.yaml'
                    }
                }
            }
         }
    }
}
