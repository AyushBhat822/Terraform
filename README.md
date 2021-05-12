# Terraform
In this repo I share the Terraform code learnt during the training at LinuxWorld Informatics under the guidance of World Record Holder Vimal Daga.
Files usage:
* ec2storage.tf - In this file I launched an server in AWS cloud services, then created an ebs volume and at last attached the ebs volume to the server.
* web.tf - Plan
# In this code we are utilizing terraform to configure webserver
1. Launch an ec2 instance
2. Install apache webserver and php interpreter
3. Go and download code from Github 
4. Deploy the code in the apache webserver
5. Create an ebs volume and connect it to the server
6. Create partition in ebs volume
7. Specify format type of ebs volume
8. Mount  ebs volume to /var/www/html/
9. Retreive the Public ip of the OS and provide it to the client.
