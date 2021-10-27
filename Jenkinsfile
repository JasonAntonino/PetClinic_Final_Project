pipeline { 
    agent any
    options {
        skipStagesAfterUnstable()
    }
    environment {
            app_version = 'v1'
            rollback = 'false'
            testPassed = false
    }
    stages{
        stage('Testing'){
            steps{
                    sh "rm -rf PetClinic_Final_Project"
                    sh "ls -al"
                    sh "git clone https://github.com/JasonAntonino/PetClinic_Final_Project.git"
                    sh "ls -al"
                    
                    dir('PetClinic_Final_Project') {
                        sh "ls -al"
                        sh "git checkout dev"
                        dir('frontend') {
                            sh "ls -al"
                            script{
                                try{
                                    sh 'ng serve'
                                    sh 'ng test'
                                }catch(err){
                                    testPassed = false
                                }
                            }
                        }
                    }
                    script{
                        testPassed = true
                    }
            }
        }
        stage('Build Image'){
            steps{
                script{
                    if (env.testPassed == true){
                        // Build the Docker image
                        image = docker.build("hdogar/frontend:latest")
    
                        // Push Docker image to DockerHub
                        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials'){
    					    image.push()
    				    }
                    }
                }
                
            }
        }
        stage('Deploy App'){
            steps{
                dir('PetClinic_Final_Project') {
                    sh "sudo docker-compose pull && docker-compose up -d"
                }
                
            }
        }
    }
}