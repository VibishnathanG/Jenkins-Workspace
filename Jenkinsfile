pipeline{
    agent{
        label "any"
    }
    stages{
        stage("Git Checkout"){
            steps{
                echo "========executing Git Checkout========"
                git branch: "main",
                    credentialsId: "git-creds",
                    url: "https://github.com/VibishnathanG/Jenkins-Workspace.git"
            }
            steps{
                echo "Listing File from Checkout"
                sh "ls -larnt"
            }
            post{
                always{
                    echo "========Git Checkout Block Completed========"
                }
                success{
                    echo "========Git Checkout executed successfully========"
                }
                failure{
                    echo "========Git Checkout execution failed========"
                }
            }
        }
    }
        stage("Maven Build"){
            steps{
                sh "mvn clean package"
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