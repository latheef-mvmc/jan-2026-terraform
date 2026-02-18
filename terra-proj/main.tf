module "vpc" {
    source = "./modules/vpc"
    vpc_cidr = var.vpc_cidr
    vpc_name = var.vpc_name
  
}

module "igw" {
  source = "./modules/igw"
  vpc_id = module.vpc.vpc_id
  igw_name = var.igw_name
}
module "subnets" {
  source = "./modules/subnets"
  vpc_id = module.vpc.vpc_id
  az1 = var.az1
  az2 = var.az2
    Public_subnet_cidr = var.Public_subnet_cidr
    Private_subnet_cidr = var.Private_subnet_cidr
    public_subnet_name = var.public_subnet_name
    private_subnet_name = var.private_subnet_name
}   

module "routetable" {
    source = "./modules/routetable"
    vpc_name = var.vpc_name
    vpc_id = module.vpc.vpc_id
    igw_id = module.igw.igw_id
    public_subnet_id = module.subnets.public_subnet_id
    private_subnet_id = module.subnets.private_subnet_id
}
module "sg" {
  source = "./modules/sg"
  vpc_id = module.vpc.vpc_id
  vpc_name = var.vpc_name
  icmp_from_port = var.icmp_from_port
  icmp_to_port = var.icmp_to_port
  protocol_name = var.protocol_name
  ssh_port = var.ssh_port
  protocol = var.protocol
  sg_cidr = var.sg_cidr
  from_port = var.from_port
  to_port = var.to_port
  egress_protocol = var.egress_protocol
  
}

module "ec2" {
  source = "./modules/ec2"
  ami_id = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name
  security_group_id = module.sg.pub_sg
  public_subnet_id = module.subnets.public_subnet_id
  vpc_name = var.vpc_name
}

module "pvt_ec2" {
  source = "./modules/pvt_ec2"
  ami_id = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name
 subnet_id = module.subnets.private_subnet_id
  vpc_name = var.vpc_name
security_group_id = module.pvt_sg.pvt_sg
}





module "pvt_sg" {
  source = "./modules/pvt_sg"
  vpc_id = module.vpc.vpc_id
  vpc_name = var.vpc_name
  icmp_from_port = var.icmp_from_port
  icmp_to_port = var.icmp_to_port
  protocol_name = var.protocol_name
  ssh_port = var.ssh_port
  protocol = var.protocol
  pvt_sg_cidr = var.pvt_sg_cidr
  from_port = var.from_port
  to_port = var.to_port
  egress_protocol = var.egress_protocol
  
}

# module "pvt_sg" {
#   source = "./modules/pvt_sg"
#   vpc_id = module.vpc.vpc_id
#   vpc_name = var.vpc_name
#   icmp_from_port = var.icmp_from_port
#   icmp_to_port = var.icmp_to_port
#   protocol_name = var.protocol_name
#   ssh_port = var.ssh_port
#   protocol = var.protocol
#   pvt_sg_cidr = var.pvt_sg_cidr
#   from_port = var.from_port
#   to_port = var.to_port
#   egress_protocol = var.egress_protocol
  
# }
