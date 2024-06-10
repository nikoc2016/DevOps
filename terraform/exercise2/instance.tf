resource "aws_instance" "terraform_inst" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = "ikocs-ohio"
  vpc_security_group_ids = ["sg-08485754a5c463819"]
  tags = {
    Name    = "terraform_inst"
    Project = "terraform"
  }
}
