
subnets = {
  subnet1 = {
    name = "public-subnet"
    rgn  = "rg-nayan-devops"
    vnet = "vnet-nayan-devops"
    ap   = ["10.0.1.0/24"]
  }
  subnet2 = {
    name = "private-subnets"
    rgn  = "rg-nayan-devops"
    vnet = "vnet-nayan-devops"
    ap   = ["10.0.2.0/24"]
  }
  subnet3 = {
    name = "private1-subnets"
    rgn  = "rg-nayan-devops1"
    vnet = "vnet-nayan-devops1"
    ap   = ["10.1.0.0/24"]
  }
}
