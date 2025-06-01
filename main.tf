
// VPC Module

# module "aws_vpc" {
#   source         = "./modules/vpc"
#   vpc_cidr_range = var.vpc_cidr_range
#   subnet_1_cidr  = var.subnet_1_cidr
#   subnet_2_cidr  = var.subnet_2_cidr
#   vpc_name       = var.vpc_name
#   subnet_01_name = var.subnet_01_name
#   subnet_02_name = var.subnet_02_name
#   vpc-igw-name   = var.vpc-igw-name
#   igw-route-cidr = var.igw-route-cidr
#   subnet_availability_zone = var.subnet_availability_zone
# }


# module "aws_ec2_instance" {
#   source                  = "./modules/ec2"
#   ec2_public_key_name     = var.ec2_public_key_name
#   ec2_instace_name        = var.ec2_instace_name
#   ec2_instance_type       = var.ec2_instance_type
#   ec2_security_group_name = var.ec2_security_group_name
#   ec2_subnet_id           = module.aws_vpc.subnet_01_id
#   ec2_vpc_id              = module.aws_vpc.vpc_id
#   amazon_machine_image    = var.amazon_machine_image
#   ec2_volume_size         = var.ec2_vol_size
#   ec2_volume_type         = var.ec2_vol_type
#   availability_zone = var.availability_zone

# }



# // s3

# module "s3_bucket" {
#   source = "./modules/s3"
#   s3_bucket_name = var.s3_bucket_name
#   s3_block_public_acls = var.s3_block_public_acls
#   s3_block_public_policy = var.s3_block_public_policy
#   s3_ignore_public_acls = var.s3_ignore_public_acls
#   s3_object_content_type = var.s3_object_content_type
#   s3_object_key = var.s3_object_key
#   s3_object_source = var.s3_object_source
#   s3_object_suffix = var.s3_object_suffix
#   s3_restrict_public_buckets = var.s3_restrict_public_buckets

# }


/// 


module "aws_rds" {
  source = "./modules/rds"
  instance_class = var.instance_class
  engine_version = var.engine_version
  db_name = var.db_name
  database_engine = var.database_engine
  rds_password = var.rds_password
  rds_username = var.rds_username
  allocated_storage_rds = var.allocated_storage_rds
  skip_final_snapshot = var.skip_final_snapshot
  publicly_accessible_or_not = var.publicly_accessible_or_not
  parameter_group_name = var.parameter_group_name
  
}



module "eksCluster" {
  source = "./modules/eks"
  clusterName = var.clusterName
}