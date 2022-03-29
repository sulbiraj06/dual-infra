module "sec-grp-module" {
    source = "../../modules/securitygroups"
    env                   =   var.env
    security_group_vpc_id = module.vpc-module.id_of_vpc
}