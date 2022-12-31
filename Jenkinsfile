pipeline {
    agent any

    environment {
	DOCKERHUB_PWD=credentials('DOCKERHUB_PASSWORD')	    
    }
 
    stages {
        stage('Build') { 
            steps {
                sh 'echo "Building..."'
		        sh 'mvn -DskipTests clean package'
		 
            }
        }
        stage('Test') { 
            steps {
		        sh 'echo "Testing..."'
                sh 'mvn test'
            }
        }
        stage('Push'){
            steps {
                sh 'echo "Pushing image to Dockerhub..."'
		        sh 'jenkins/push/push.sh $DOCKERHUB_PWD'
            }
        }

        stage('Remove old application'){
            steps {
                sshagent(['e4fbd939-914a-41ed-92d9-8eededfb9243']) {
                sh 'touch "/home/ec2-user/arquivo-$BUILD_TAG"'
                }
            }
	    }

        stage('Deploy') { 
            steps {
                sh 'echo "Deploying..."' 
            }
        }
    }
}
