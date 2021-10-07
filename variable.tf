# variable "aws_ssm_parameter_name" {
#   default = "/devops/us-east-1/passwords/team3db-cluster"
# }
variable "instance_class" {
  type    = string
  default = "db.r4.large"
}
variable "cluster_identifier" {
  default = "dbname"
}
variable "engine" {
  default = "aurora"
  type    = string
}
variable "engine_version" {
  default = "5.6.10a"
}
variable "database_name" {
  default = "dbname"
}
variable "master_username" {
  default = "team3db"
}
variable "name" {
  type    = string
}
variable "vpc_id" {
  type    = string
}
variable "subnet_ids" {
  type    = list
}
variable "allowed_security_groups" {
  type    = list
}
variable "allowed_cidr_blocks" {
  type    = list
}
variable "region" {
  type    = string
}
variable "aws_route53_zone" {
  type    = string
}
# Team 3.
variable "master_password" {}
variable "aws_db_subnet_group_name" {}
variable "aws_db_subnet_group" {}
variable "vpc_security_group_id" {}
variable "aws_cluster_identifier" {}
