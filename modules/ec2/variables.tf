variable "ec2_public_key_name" {
  
}

variable "amazon_machine_image" {
  
}

variable "ec2_subnet_id" {
   description = "subnet-id"
}


variable "ec2_security_group_name" {     
    description = "securitygroupname"
}


variable "ec2_instance_type" {
  description = "ec2InstanceType"
}

variable "ec2_volume_size" {
  description = "ec2_vol_size"
}

variable "ec2_volume_type" {
 
  description = "ec2_vol_type"
}

variable "ec2_vpc_id" {
    description = "ec2VPCID"
}

variable "ec2_instace_name" {
  description = "ec2-instance"
}

variable "availability_zone" {
  description = "az"
}
variable "ingress_rules" {
  description = "List of ingress rules"
  type = list(object({
    from_port = number
    to_port   = number
    cidr      = string
  }))

  default = [
    {
      from_port = 22
      to_port   = 22
      cidr      = "0.0.0.0/0"
    },
    {
      from_port = 80
      to_port   = 80
      cidr      = "0.0.0.0/0"
    }
  ]
}
