# Terraform
In this repo I share the HCL code that I am learning currently in the Terraform training at LinuxWorld Informatics under the guidance of World Record Holder Vimal Daga.
Files usage:

* var.tf - Usage of variables shown
* ec2storage.tf - In this file 
1. I launched a server in AWS cloud services
2. Then created an ebs volume 
3. At last attached the ebs volume to the server
* web.tf - Plan
1. Launch an ec2 instance
2. Install apache webserver and php interpreter
3. Go and download code from Github 
4. Deploy the code in the apache webserver
5. Create an ebs volume and connect it to the server
6. Create partition in ebs volume
7. Specify format type of ebs volume
8. Mount  ebs volume to /var/www/html/
9. Retreive the Public ip of the OS and provide it to the client

In **aws-ws1** we learnt how to **split** large code into multiple files 
**WHY TO USE MULTIPLE FILES IN TERRAFORM?**
* While working in team different members work on different files so this is preferred.
