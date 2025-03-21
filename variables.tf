variable "aws_region" {
  default = "us-east-1"
}

variable "instance_type" {
  default = "t2.medium"
}

variable "ami_id" {
  default = "ami-0c55b159cbfafe1f0"  # Ubuntu 20.04 (Change based on region)
}
