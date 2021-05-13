resource "aws_instance"  "webos1"  {

ami = "ami-010aff33ed5991201"
instance_type = "t2.micro"
security_groups = [ "webport-allow" ]
key_name = "terraform_key"
tags = { 
    Name = "Web Server by TF"
     }
}