// VPC SETTINGS
variable "subnet_2_cidr" {
  description = "cidr value of subnet"
}

variable "subnet_1_cidr" {
  description = "cidr of  subnet 1"
}

variable "vpc_cidr_range" {
  description = "vpc cidr range"
}

variable "vpc_name" {
  description = "vpc name"
}

variable "subnet_01_name" {
  description = "subnet_01"
}

variable "subnet_02_name" {
  description = "subnet_02"
}

variable "igw-route-cidr" {
  description = "igw-route"
}

variable "subnet_availability_zone" {
 description = "az1" 
}

variable "vpc-igw-name" {
  description = "igw-name"
}

// S3 Backend Settings

variable "s3_backend_storage_bucket_name" {
  description = "s3_bucket_storage_name"
}

variable "s3_bucket_key_name" {
  description = "bucket Key name"

}

variable "s3_backend_region" {
  description = "s3 backend region"
}

variable "availability_zone" {
  description = "az"
}

// ec2
variable "ec2_instace_name" {
  description = "ec2-intace-name"
}


variable "amazon_machine_image" {
  description = "amazon machine image id"
}


variable "ec2_security_group_name" {
  description = "ec2-security-groupid"
}

variable "ec2_instance_type" {
  description = "ec2-instance-type"
}

variable "ec2_public_key_name" {
  description = "public key on aws"
}



variable "ec2_vol_size" {
  description = "ec2-size"
}

variable "ec2_vol_type" {
  description = "ec2-type"
}