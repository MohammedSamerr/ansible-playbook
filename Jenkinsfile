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
    }
}