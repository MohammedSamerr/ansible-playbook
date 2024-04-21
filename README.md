"Ansible"
- Install all Ansible Dependencies
- Edit hosts configuration by adding ip of vm1, vm2 and ansible_username , ansible_password loke below:
[linux]
VM1_IP
VM2_IP

[linux:vars]
ansible_username="username"
ansible_password="password"
 
------------------------------------------------------------------
"Jenkins Configuarion"
- Configer web-hook to trigger any changes on repo
- Add settings.json file to configure jenkins-runner, note: change job_name and password on settings.json file
- User jenkins-runner to run and configure pipline
- Change send email configuration to send email notification
- put your mail and git configuration on jenkins file
