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
    us-east-2 = "ami-0ca2e925753ca2fb4"
  }
}
