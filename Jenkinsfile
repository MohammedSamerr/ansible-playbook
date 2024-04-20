pipeline{
    agent any

    stages{
        stage('Cleanup workspace'){
            steps{
                script{
                    cleanWs()
                }
            }
        }
        stage('Checkout SCM'){
            steps{
                script{
                    git credentialsId : 'github',
                    url: 'https://github.com/MohammedSamerr/ansible-playbook.git',
                    branch: 'master'
                }
            }
        }

        stage('Push Changed'){
            steps{
                script{
                    sh """
                        git  config --global user.name "user_name"
                        git  config --global user.email "Email"
                        git add .
                        git commit -m "playbook updates"
                        """
                        withCredentials([gitUsernamePassword(credentialsId: 'github', gitToolName: 'Default')]) {
                             git push -uf "https://github.com/MohammedSamerr/ansible-playbook.git" master
                        }
                        
                    
                }
            }
        }
        
        stage("Execute playbook"){
            steps{
                 git "https://github.com/MohammedSamerr/ansible-playbook.git"
            }
        }

        stage("Run Ansible Playbook"){
            steps{
                script{
                    sh 'ansible-playbook -i hosts.ini install-nginx.yaml --extra-vars "ansible_become_pass=Sam1234"'
                }
            }
             }

        stage('Send Email') {
            steps {
                script {
                    // Run Script 
                    def scriptOutput = sh(script: '/home/samir/Documents/ansible-playbook', returnStdout: true).trim()
                    env.users = scriptOutput


                    // Build the email body

                    def buildStartTimeInMillis = currentBuild.startTimeInMillis
                    def buildStartTime = new Date(buildStartTimeInMillis).toString()
                    
                    
                    def emailBody = "The build status is ${currentBuild.result}.\n"
                    emailBody += "Pipeline execution started at: ${buildStartTime}\n"
                    emailBody += "Script output:\n${env.users}\n"
                    // Send Email
                    emailext subject: 'Build Status: ${currentBuild.result}',
                              body: emailBody,
                              to: 'Email',
                              mimeType: 'text/plain'
                }
            }
        }
    }
}



