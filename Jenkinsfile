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
                        git  config --global user.name "MohammedSamer"
                        git  config --global user.email "mohamed.samir2413@gmail.com"
                        git add .
                        git commit -m "playbook updates"
                        """
                        withCredentials([gitUsernamePassword(credentialsId: 'github', gitToolName: 'Default')]) {
                             git push -uf "https://github.com/MohammedSamerr/ansible-playbook.git" master
                        }
                        
                    
                }
            }
        }
        stage('Send Email') {
            steps {
                script {
                    // Run Script 
                    def scriptOutput = sh(script: 'path/to/your/script.sh', returnStdout: true).trim()
                    env.users = scriptOutput

                    // Send Email
                    emailext subject: 'Build Status: ${currentBuild.result}',
                              body: 'The build status is ${currentBuild.result} \n Users are {${currentBuild.result}}.',
                              to: 'mohamed.samir2413@gmail.com',
                              mimeType: 'text/plain'
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
    }
}



