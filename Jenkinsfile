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
        stage("Run Ansible Playbook"){
            steps{
                script{
                    sh 'ansible-playbook -i hosts.ini install-nginx.yaml --extra-vars "ansible_become_pass=Sam1234"'
                }
            }
             }
    }
}



