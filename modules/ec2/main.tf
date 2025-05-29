resource "aws_security_group" "sg-1" {
  name        = var.ec2_security_group_name
  vpc_id      = var.ec2_vpc_id
}

resource "aws_security_group_rule" "ingress" {
  count             = length(var.ingress_rules)
  type              = "ingress"
  from_port         = var.ingress_rules[count.index].from_port
  to_port           = var.ingress_rules[count.index].to_port
  protocol          = "tcp"
  cidr_blocks       = [var.ingress_rules[count.index].cidr]
  security_group_id = aws_security_group.sg-1.id
}

resource "aws_security_group_rule" "egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg-1.id
}


resource "aws_instance" "ec2" {
   key_name = var.ec2_public_key_name
   ami = var.amazon_machine_image
   vpc_security_group_ids = [ aws_security_group.sg-1.id ]
   subnet_id = var.ec2_subnet_id
   instance_type = var.ec2_instance_type
   user_data = file("/modules/ec2/nginxinstall.sh")
   availability_zone = var.availability_zone

   root_block_device {
      volume_size = var.ec2_volume_size
      volume_type = var.ec2_volume_type
   }

   tags = {
     Name = var.ec2_instace_name
   }
}