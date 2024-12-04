variable "region" {
  default = "us-west-1"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "db_instance_type" {
  default = "db.t3.micro"
}

variable "allowed_ips" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}
