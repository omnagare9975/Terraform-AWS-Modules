resource "aws_db_instance" "default" {
  allocated_storage    = var.allocated_storage_rds
  db_name              = var.db_name
  engine               = var.database_engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  username             = var.rds_username
  password             = var.rds_password
  parameter_group_name = var.parameter_group_name
  skip_final_snapshot  = var.skip_final_snapshot
  publicly_accessible = var.publicly_accessible_or_not
}


