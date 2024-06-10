resource "aws_key_pair" "ikocs-local" {
  key_name   = "ikocs-local"
  public_key = file("ikocs-local.pub")
}

resource "aws_instance" "terraform_instance_3" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = aws_key_pair.ikocs-local.key_name
  vpc_security_group_ids = ["sg-08485754a5c463819"]
  tags = {
    Name    = "terraform_instance_3"
    Project = "terraform"
  }

  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod u+x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]
  }

  connection {
    user        = var.USER
    private_key = file("ikocs-local")
    host        = self.public_ip
  }
}

output "PublicIP" {
  value = aws_instance.terraform_instance_3.public_ip
}

output "PrivateIP" {
  value = aws_instance.terraform_instance_3.private_ip
}

