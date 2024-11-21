pipeline {
    agent {
        label "any"
    }
    stages {
        stage("Docker Build") {
            steps {
                sh "docker ps -a; docker rm -f n1; docker container run -d --name n1 -p 8081:80 nginx; docker ps -a"
            }
            post {
                always {
                    echo "========always========"
                }
                success {
                    echo "========Docker Build executed successfully========"
                }
                failure {
                    echo "========Docker Build execution failed========"
                }
            }
        }
    }
    post {
        always {
            echo "========always========"
        }
        success {
            echo "========pipeline executed successfully ========"
        }
        failure {
            echo "========pipeline execution failed========"
        }
    }
}
