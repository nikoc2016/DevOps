variable "REGION" {
  default = "us-east-2"
}

variable "ZONE1" {
  default = "us-east-2a"
}

variable "AMIS" {
  type = map(any)
  default = {
    us-east-1 = "ami-04b70fa74e45c3917"
    us-east-2 = "ami-09040d770ffe2224f"
  }
}

variable "USER" {
  default = "ubuntu"
}

