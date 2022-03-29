
# module "main-module" {
#     source          =   "../../modules/"
#     vpc_cidr        =   "192.18.0.0/16"
#     tenancy         =   "default"
#     env             =   var.env
#     cidr_pub_sub    =   var.cidr_pub_sub
#     cidr_priv_sub   =   var.cidr_priv_sub
#     subnet_azs      =   var.subnet_azs
#     ec2_ami         =   var.ec2_ami
#     ec2_inst_type   =   var.ec2_inst_type
#     ec2_az          =   var.ec2_az
# }
module "ssh-key" {
  source    = "../../modules/ssh-key"
  env       =   var.env
  key_name  = var.key_name
  
}
module "adserver-module" {
    source          =   "../../modules/ec2"
    
    env             =   var.env
    ec2_ami         =   var.ec2_ami
    ec2_inst_type   =   var.ec2_inst_type
    ec2_subnet      =   module.vpc-module.id_of_priv_subnet[0]
    vpc_sec_grp_id  =   module.sec-grp-module.id_of_ec2_sg
    ec2_az          =   var.ec2_az
    key_name        =   module.ssh-key.key_name
    tags = {
      Name = "ConceptOne-${var.env}-AD Server"
    }
}

module "shared-module" {
    source          =   "../../modules/ec2"
    env             =   var.env
    ec2_ami         =   var.ec2_ami
    ec2_inst_type   =   var.ec2_inst_type
    ec2_subnet      =   module.vpc-module.id_of_priv_subnet[0]
    vpc_sec_grp_id  =   module.sec-grp-module.id_of_ec2_sg
    ec2_az          =   var.ec2_az
    key_name        =   module.ssh-key.key_name
    tags = {
      Name = "ConceptOne-${var.env}-SharedServer"
    } 
}

module "openvpn-module" {
    source          =   "../../modules/ec2"
    env             =   var.env
    ec2_ami         =   var.ec2_ami
    ec2_inst_type   =   var.ec2_inst_type
    ec2_subnet      =   module.vpc-module.id_of_pub_subnet[0]
    vpc_sec_grp_id  =   module.sec-grp-module.id_of_ec2_sg
    ec2_az          =   var.ec2_az
    key_name        =   module.ssh-key.key_name
    tags = {
      Name = "ConceptOne-${var.env}-OpenVPN"
    } 
}