# #Launch EC2 instances under Private and Public subnets
# resource "aws_instance" "tf_ec2-public-instance" {
#   ami                       = "ami-0a8b4cd432b1c3063"
#   instance_type             = "t2.micro"
#   subnet_id                 = var.pub_subnet
#   vpc_security_group_ids    = [var.vpc_sec_grp_id]
#   availability_zone         = "us-east-1a"
#   key_name                  = "sulbi-devops"  
# tags = {
#     Name = "public-instance"
#   }
# }

resource "aws_instance" "tf_ec2-private-instances" {
  ami                       = var.ec2_ami
  instance_type             = var.ec2_inst_type
  subnet_id                 = var.ec2_subnet
  #subnet_id                 = element(aws_subnet.tf_private_subnet.*.id, 0)
  vpc_security_group_ids    = [var.vpc_sec_grp_id]
  availability_zone         = var.ec2_az
  key_name                  = var.key_name
  #key_name                  = "sulbi-devops"
  tags                      = var.tags
  # tags = {
  #     Name = "ConceptOne-${var.env}-all-in-one"
  # }
}