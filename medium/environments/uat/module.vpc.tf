module "vpc-module" {
    source          =   "../../modules/vpc"
    vpc_cidr        =   "192.19.0.0/16"
    tenancy         =   "default"
    env             =   var.env
    cidr_pub_sub    =   var.cidr_pub_sub
    cidr_priv_sub   =   var.cidr_priv_sub
    subnet_azs      =   var.subnet_azs
}