module "alb-module" {
  source            =   "../../modules/alb"
  env               =   var.env
  subnets           =   [module.vpc-module.id_of_pub_subnet[0], module.vpc-module.id_of_pub_subnet[1]]
  security_groups   =   module.sec-grp-module.id_of_alb_sg
  vpc_id            =   module.vpc-module.id_of_vpc
  target_id         =   module.ec2-module.id_of_ec2_instances
}