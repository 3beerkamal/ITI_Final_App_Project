# Using Jenkins as CI/CD pipeline 
### Build python Application, Build Image, push image to [DockerHup](https://hub.docker.com/repository/docker/3beerkamal/python-app#description) and finally deploy it on GKE.

# :rocket: Get Started
* First, Dockerized my pyhon Application
* Second Create [GitHub](https://github.com/3beerkamal) & [DockerHub](https://hub.docker.com/) credentials to be able to pull Dockerfile from  git_hub,   build it inside pipeline and then push it to docker_hub.
```bash
pipeline {
    agent any
    stages {
        //First using SCM I cloned the private Repo with credential
        
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
  ```
* Finally created YAML files to deploy image python app as a deployment and service using thses Commanga.

# :rocket:
Now hit your <LoadBalancerIP:Containerport NO .> http://35.231.4.167:8000/

![7](https://user-images.githubusercontent.com/31750138/199674967-0d51a567-11f8-4a8f-9a20-f59bdeba3bce.png)
![8](https://user-images.githubusercontent.com/31750138/199675055-bc8de275-a1ac-4d4d-98ac-d6758a39783a.png)

