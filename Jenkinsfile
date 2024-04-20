pipeline{
    agent any
    stages{
        stage("Execute playbook"){
            steps{
                script{
                    ansiblePlaybook installation: 'Ansible', inventory: '/home/samircluster/Documents/', playbook: '/home/samircluster/Documents/install-nginx.yaml', vaultTmpPath: ''
       
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


