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
                sh "ls -al"
                // sh "git checkout terraform-k8s"
                dir('frontend') {
                    sh "ls -al"
                    script{
                        try{
                            sh "sudo npm uninstall -g angular-cli @angular/cli"
                            sh "sudo npm cache clean --force"
                            sh "sudo npm install -g @angular/cli@8.3.25"
                            sh "sudo npm install --save-dev @angular/cli@8.3.25" //Updates local version?
                            sh "sudo npm install"
                            sh "sudo npm i karma-cli"
                            sh "rm -rf package-lock.json"
                            // sh "if npm version > 5.0 delete package-lock.json"
                            sh "sudo npm install karma-junit-reporter --save-dev"
                            // sh "karma start -d"
                            sh "sudo npm i -D puppeteer karma-chrome-launcher"
                            sh 'ng test --watch false'
                            sh "sudo npm update"

                            post {
                                always {
                                    junit 'test-result.xml'
                                }
                            }
                        }catch(err){
                            testPassed = false
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
                sh "ls -al"
                dir('kubernetes') {
                    sh "ls -al"
                    sh "kubectl apply -f ."
                }

                
            }
        }
    }
}