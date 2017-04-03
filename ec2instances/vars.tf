variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}

variable "REGION" {
  default = "us-east-1"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "inspectortestkey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "inspectortestkey.pub"
}

variable "INSTANCE_USERNAME" {
  default = "ec2-user"
}
