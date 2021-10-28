pipeline { 
    agent any
    triggers {
        githubPush()
    }
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
                        sh "git checkout terraform-k8s"
                        dir('frontend') {
                            sh "ls -al"
                            script{
                                try{
                                    sh "sudo npm uninstall -g angular-cli @angular/cli"
                                    sh "sudo npm cache clean --force"
                                    sh "sudo npm install -g @angular/cli@latest"
                                    // sh "npm install --save-dev @angular/cli@latest"
                                    sh "npm i karma-cli"
                                    sh "rm -rf package-lock.json"
                                    // sh "if npm version > 5.0 delete package-lock.json"
                                    sh "npm install"
                                    sh "npm install karma-junit-reporter --save-dev"
                                    // sh "karma start -d"
                                    sh 'ng test --karma-config karma.conf.js'
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
        // stage('Build Image'){
        //     steps{
        //         script{
        //             if (env.testPassed == true){
        //                 // Build the Docker image
        //                 image = docker.build("hdogar/frontend:latest")
    
        //                 // Push Docker image to DockerHub
        //                 docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials'){
    	// 				    image.push()
    	// 			    }
        //             }
        //         }
                
        //     }
        // }
        stage('Deploy App'){
            steps{
                sh "rm -rf PetClinic_Final_Project"
                sh "ls -al"
                sh "git clone https://github.com/JasonAntonino/PetClinic_Final_Project.git"
                dir('PetClinic_Final_Project') {
                    sh "git checkout terraform-k8s"
                    dir('kubernetes') {
                        sh "kubectl apply -f ."
                    }
                }
                
            }
        }
    }
}