provider "aws" {
  region     = "${var.region}"
}

variable "cidr_vpc" {}
variable "cidr_subnets" {
  default = []
}
variable "az_subnets" {
  default = []
}
variable "region" {}
variable "cluster-name" {}
