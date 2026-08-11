subnets = {
  subnet1 = {
    name = "frontend-subnet"
    vn   = "nayan-vnet12"
    rgn  = "nayanrg12"
    ap   = ["10.0.0.0/24"]
  }
  subnet2 = {
    name = "backend-subnet"
    vn   = "nayan-vnet12"
    rgn  = "nayanrg12"
    ap   = ["10.0.1.0/24"]
  }

}