# IaaC

provider "aws" { 

region = "ap-south-1"
profile = "default"

}

# step 1 : Launching an instance

resource "aws_instance"  "os1"  {

ami = "ami-010aff33ed5991201"
instance_type = "t2.micro"
tags = { 
    Name = "my first TF os"
     }

}

output "my_public_ip_is" {
value = aws_instance.os1.public_ip
}

output "my_az_is" {
value = aws_instance.os1.availability_zone
}

# step2 : Creating an ebs volume

resource "aws_ebs_volume" "st1" {
  availability_zone = aws_instance.os1.availability_zone
  size              = 1

  tags = {
    Name = "LinuxWorld Student HD new"
  }
}

output "o2" {

value = aws_ebs_volume.st1

}

# step 3 : Attach the ebs volume
resource "aws_volume_attachment" "ebs_att" {
   device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.st1.id
  instance_id = aws_instance.os1.id
}

output "o3" {
value = aws_volume_attachment.ebs_att
}


