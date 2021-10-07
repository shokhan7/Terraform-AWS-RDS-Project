# resource "random_password" "password" {
#   length           = 30
#   special          = false
#   override_special = "_%@"
# }
# resource "aws_ssm_parameter" "team3db" {
#   name  = var.aws_ssm_parameter_name
#   type  = "SecureString"
#   value = random_password.password.result
# }
resource "aws_db_subnet_group" "db_team4" {
  name       = var.aws_db_subnet_group_name
  subnet_ids = var.aws_db_subnet_group
}
resource "aws_rds_cluster" "default" {
  cluster_identifier   = var.aws_cluster_identifier
  engine               = var.engine
  engine_version       = var.engine_version
  database_name        = var.database_name
  master_username      = var.master_username
  # master_password      = random_password.password.result
  master_password      = var.master_password
  db_subnet_group_name = aws_db_subnet_group.db_team4.name
  skip_final_snapshot  = true
  vpc_security_group_ids = [var.vpc_security_group_id]
}
resource "aws_rds_cluster_instance" "cluster_instances" {
  db_subnet_group_name = aws_db_subnet_group.db_team4.name
  identifier         = "aurora-cluster-demo"
  cluster_identifier = aws_rds_cluster.default.cluster_identifier
  instance_class     = var.instance_class
  engine_version     = aws_rds_cluster.default.engine_version
  engine             = aws_rds_cluster.default.engine
}
resource "aws_rds_cluster_instance" "cluster_instances-writer" {
  db_subnet_group_name = aws_db_subnet_group.db_team4.name
  identifier         = "aurora-cluster-demo-writer"
  cluster_identifier = aws_rds_cluster.default.cluster_identifier
  instance_class     = var.instance_class
  engine_version     = var.engine_version
  engine             = var.engine
}
resource "aws_rds_cluster_instance" "cluster_instances-reader1" {
  db_subnet_group_name = aws_db_subnet_group.db_team4.name
  identifier         = "aurora-cluster-demo-reader1"
  cluster_identifier = aws_rds_cluster.default.cluster_identifier
  instance_class     = var.instance_class
  engine_version     = var.engine_version
  engine             = var.engine
}
resource "aws_rds_cluster_instance" "cluster_instances-reader2" {
  db_subnet_group_name = aws_db_subnet_group.db_team4.name
  identifier         = "aurora-cluster-demo-reader2"
  cluster_identifier = aws_rds_cluster.default.cluster_identifier
  instance_class     = var.instance_class
  engine_version     = var.engine_version
  engine             = var.engine
}
output "reader_endpoint" {
  value = aws_rds_cluster.default.reader_endpoint
}
output "writer_endpoint" {
  value = aws_rds_cluster.default.endpoint
}