pipeline{
    agent any
    stages{
        stage("Execute playbook"){
            steps{
                script{
                    git 'https://github.com/MohammedSamerr/ansible-playbook.git'
                }
            }
             }
        stage("RunAnsible Playbook"){
            steps{
                script{
                    sh 'ansible-playbook -i hosts.ini install-nginx.yaml --extra-vars "ansible_become_pass=Sam1234"'
                }
            }
             }
    }
}


