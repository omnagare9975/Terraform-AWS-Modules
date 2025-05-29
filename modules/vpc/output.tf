output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "subnet_01_id" {
  value = aws_subnet.sb1.id
}
output "subnet_02_id" {
  value = aws_subnet.sb2.id
}