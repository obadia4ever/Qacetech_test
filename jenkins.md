## Jenkins Pipeline for CI/CD

### Assumptions:
- Jenkins is installed with Docker and Helm plugins.
- Docker credentials and Kubeconfig added as credentials.

### Example Jenkinsfile:
```groovy
pipeline {
  agent any

  environment {
    IMAGE = "your-dockerhub-username/cats:${env.BUILD_NUMBER}"
  }

  stages {
    stage('Checkout') {
      steps {
        git 'https://github.com/Streetbees/cats'
      }
    }

    stage('Build Docker Image') {
      steps {
        sh 'docker build -t $IMAGE .'
      }
    }

    stage('Push Docker Image') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
          sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
          sh 'docker push $IMAGE'
        }
      }
    }

    stage('Deploy to EKS') {
      steps {
        withCredentials([file(credentialsId: 'kubeconfig', variable: 'KUBECONFIG_FILE')]) {
          sh 'export KUBECONFIG=$KUBECONFIG_FILE'
          sh 'helm upgrade --install cats-app ./helm --set image.tag=${env.BUILD_NUMBER}'
        }
      }
    }
  }
}
```