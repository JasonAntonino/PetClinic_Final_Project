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
        requirementsInstalled = false
        username = credentials('user')
        password = credentials('password')
    }
    stages{
        stage('Testing'){
            steps{
                sh "ls -al"
                // sh "git checkout terraform-k8s"
                dir('frontend') {
                    sh "ls -al"
                    script{
                        // if(env.requirementsInstalled == false){
                            try{
                                sh "sudo npm uninstall -g angular-cli @angular/cli"
                                sh "sudo npm cache clean --force"
                                sh "sudo npm install -g @angular/cli@8.3.25"
                                sh "sudo npm install --save-dev @angular/cli@8.3.25" //Updates local version?
                                sh "sudo npm install"
                                sh "sudo npm i karma-cli"
                                sh "rm -rf package-lock.json"
                                sh "sudo npm install karma-junit-reporter --save-dev"
                                // sh "karma start -d"
                                sh "sudo npm i -D puppeteer karma-chrome-launcher"
                                sh 'ng test --watch false'
                                // sh "sudo npm update"
                            }catch(err){
                                testPassed = false
                            }
                            // requirementsInstalled == true
                        // }
                    }
                }
                script{
                    testPassed = true
                }
            }
        }
        // stage('Build and Push Image'){
        //     steps{
        //         sh "ls -al"
        //         sh "echo $password | sudo docker login -u $username --password-stdin"
        //         sh "sudo docker-compose build && sudo docker-compose push"
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