module "rg" {
  source   = "../../child_module/resource_group"
  rg_name  = "rg-dev-env"
  location = "Central India"

}

module "vnet" {
  depends_on = [module.rg]
  source     = "../../child_module/virtual_network"
  vnet_name  = "vnet-dev-env"
  rg_name    = "rg-dev-env"
  location   = "Central India"



}

module "subnet" {
  depends_on  = [module.rg, module.vnet]
  source      = "../../child_module/subnet"
  subnet_name = "subnet-dev-env"
  rg_name     = "rg-dev-env"
  vnet_name   = "vnet-dev-env"

}
module "nic1" {
  depends_on      = [module.rg, module.subnet, module.vnet, module.backend_pool]
  source          = "../../child_module/nic"
  nic_name        = "nic-dev-env01"
  rg_name         = "rg-dev-env"
  location        = "Central India"
  subnet_id       = module.subnet.subnet_id
  backend_pool_id = module.backend_pool.backend_pool_id


}

module "nic2" {
  depends_on      = [module.rg, module.subnet, module.vnet, module.backend_pool]
  source          = "../../child_module/nic"
  nic_name        = "nic-dev-env02"
  rg_name         = "rg-dev-env"
  location        = "Central India"
  subnet_id       = module.subnet.subnet_id
  backend_pool_id = module.backend_pool.backend_pool_id


}


module "nsg" {
  depends_on = [module.rg, module.nic1, module.nic2]
  source     = "../../child_module/nsg"
  nsg_name   = "nsg-dev-env"
  rg_name    = "rg-dev-env"
  location   = "Central India"

  nic_ids = {
    nic1 = module.nic1.nic_id
    nic2 = module.nic2.nic_id
  } # 👈 passing NICs
}


module "vm1" {
  depends_on = [module.nic1, module.nsg, module.rg, module.subnet, module.vnet]
  source     = "../../child_module/VM"
  vm_name    = "vm-dev-env01" # unique
  rg_name    = "rg-dev-env"
  location   = "Central India"
  nic_ids    = [module.nic1.nic_id]
}

module "vm2" {
  depends_on = [module.nic2, module.nsg, module.rg, module.subnet, module.vnet]
  source     = "../../child_module/VM"
  vm_name    = "vm-dev-env02" # unique
  rg_name    = "rg-dev-env"
  location   = "Central India"
  nic_ids    = [module.nic2.nic_id]
}

module "pip" {
  depends_on = [module.rg]
  source     = "../../child_module/pip"
  rg_name    = "rg-dev-env"
  location   = "Central India"
  pip_name   = "public_ip"

}
module "lb" {
  depends_on = [module.rg, module.pip]
  source     = "../../child_module/lb"
  rg_name    = "rg-dev-env"
  location   = "Central India"
  lb_name    = "loadbalancer"
  pip_id     = module.pip.pip_id

}

module "backend_pool" {
  depends_on        = [module.lb]
  source            = "../../child_module/backend_pool"
  backend_pool_name = "frontend_backend_pool"
  lb_id             = module.lb.lb_id

}
module "health_probe" {
  depends_on       = [module.lb]
  source           = "../../child_module/health_probe"
  health_probe_name = "health_probe"
  lb_id            = module.lb.lb_id

}
module "lb_rule" {
  depends_on = [ module.backend_pool,module.health_probe,module.lb ]
  source = "../../child_module/lb_rule"
  lb_rule_name = "lb_rule"
   lb_id            = module.lb.lb_id
   health_probe_id = module.health_probe.health_probe_id

   backend_pool_id = module.backend_pool.backend_pool_id
  
}




module "bastion_pip" {
  depends_on = [module.rg]
  source     = "../../child_module/bastion_pip"
  rg_name    = "rg-dev-env"
  location   = "Central India"

}
module "bastion_subnet" {
  depends_on = [module.rg,module.vnet]
  source     = "../../child_module/bastion_subnet"
  rg_name    = "rg-dev-env"
  location   = "Central India"
  vnet_name  = "vnet-dev-env"

}

module "bastion_host_pip" {

depends_on = [ module.rg,module.bastion_subnet,module.bastion_pip ]

  source            = "../../child_module/bastion_host_pip"
  rg_name           = "rg-dev-env"
  location          = "Central India"
  bastion_subnet_id = module.bastion_subnet.bastion_subnet_id
  bastion_pip_id    = module.bastion_pip.bastion_pip_id
}
