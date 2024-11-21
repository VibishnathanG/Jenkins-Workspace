pipeline{
    agent{
        label "slave1"
    }
    stages{
        stage("Docker Build"){
            steps{
                echo "========executing Docker Build========"
                sh "docker ps -a; docker rm -f $(docker ps -aq); docker container run -d --name n1 -p 8081:80 nginx; docker ps -a "
            }
            post{
                always{
                    echo "========always========"
                }
                success{
                    echo "========Docker Build executed successfully========"
                }
                failure{
                    echo "========Docker Build execution failed========"
                }
            }
        }
    }
    post{
        always{
            echo "========always========"
        }
        success{
            echo "========pipeline executed successfully ========"
        }
        failure{
            echo "========pipeline execution failed========"
        }
    }
}