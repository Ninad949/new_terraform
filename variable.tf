variable "vpc_cidr" {
  default = "172.31.0.0/16"
}

variable "tenancy" {
  default = "dedicated"
}

variable "count_private_subnet" {
  default = "1"
}

variable "count_public_subnet" {
  default = "1"
}

variable "private_subnets" {
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "public_subnets" {
  default = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}

variable "availability_zone" {
  default = ["us-west-1a", "us-west-1b"]
}

