#Create VPC
resource "aws_vpc" "tf_vpc" {
  cidr_block        = var.vpc_cidr
  instance_tenancy  = var.tenancy

  tags = {
      Name  =   "ConceptOne-${var.env}-VPC"
  }
}