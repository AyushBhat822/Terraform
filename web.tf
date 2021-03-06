provider "aws" { 

region = "ap-south-1"
profile = "default"

}

resource "aws_instance"  "webos1"  {

ami = "ami-010aff33ed5991201"
instance_type = "t2.micro"
security_groups = [ "webport-allow" ]
key_name = "terraform_key"
tags = { 
    Name = "Web Server by TF"
     }
}

output "my_public_ip_is" {
value = aws_instance.webos1.public_ip
}

resource  "null_resource"  "nullremote3" {

connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file("C:/Users/Ayush/Downloads/terraform_key.pem")
    host     = aws_instance.webos1.public_ip
  }

provisioner "remote-exec" {
    inline = [
      "sudo yum install httpd -y",
      "sudo yum install php -y", 
      "sudo systemctl start httpd",
     "sudo systemctl enable httpd"
    ]
  }
}

resource "aws_ebs_volume" "st1" {
  availability_zone = aws_instance.webos1.availability_zone
  size              = 1

  tags = {
    Name = "Web Server HD new by TF"
  }
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.st1.id
  instance_id = aws_instance.webos1.id
}

resource  "null_resource"  "nullremote4" {

connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file("C:/Users/Ayush/Downloads/terraform_key.pem")
    host     =  aws_instance.webos1.public_ip
  }

provisioner "remote-exec" {
    inline = [
      "sudo mkfs.ext4 /dev/xvdc",
      "sudo mount /dev/xvdc /var/www/html" ,
      "sudo yum install git -y",
      "sudo git clone https://github.com/AyushBhat822/git-test.git  /var/www/html/web "
    ]
  }
}

resource  "null_resource"  "nullremote6" {

provisioner "local-exec" {
  command = "chrome http://15.207.249.8/web/index.php"
 }
}
