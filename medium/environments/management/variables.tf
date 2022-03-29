variable "cidr_pub_sub" {
  type        = list
  description = "The CIDR block for the public subnet"
  default     = ["192.21.0.0/24", "192.21.1.0/24"] //List of Public subnet cidr range
}

variable "cidr_priv_sub" {
  type        = list
  description = "The CIDR block for the private subnet"
  default     = ["192.21.3.0/24", "192.21.4.0/24"] //List of private subnet cidr range
}

variable "subnet_azs" {
  type        = list
  description = "Availability zones"
  default     = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d"]
}
variable "ec2_ami" {
  default = "ami-0f9a92942448ac56f"
}
variable "ec2_inst_type" {
  default = "t2.micro"
}
variable "ec2_az" {
  default = "us-east-1a"
}
variable "env" {
  description = "The project namespace to use for unique resource naming"
  default     = "MGMT"
  type        = string
}
variable "key_name" {
  description = "Unique key pair name"
  default     = "mgmt-med-key"
  type        = string
}