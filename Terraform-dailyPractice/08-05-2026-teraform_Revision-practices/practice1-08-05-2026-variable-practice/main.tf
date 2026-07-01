# variable default cli
# variable "rgname1" {
#     #cli  input is given  each every  time and what happen when 
#     #if created this one so it does not sam the rg name or storage acc is created it froget
#     # only if have to memmorize the value for the multiple rg it fails

# }

# variable "rgname1" {
#   type = string
#   default = "rg_tested_rg1_default"
# }
# # in that what happen the rg has given the defaukt value whenerver if there is no value is pass
# # so it will take the default value 



# variable  -var -var-file 

# variable "rgname1" {
#   #in the terminal we run terraform plan -var "rgname1=rg_tested_rg1"
#   # what happen if want diretly give the value using it without changing in the code
# }

# variable "rgname1" {
#   # in terminal we pas terraform plan -var-file="koibhi.tfvars"    
#   # it same type of the tfvars file but we can customize the according to of terraform.tfvars
# }


# variable terrorm.tfvars .auto.tfvars

# variable "rgname1" {
#   #    terraform.tfvars  is directly assign the value iot that file 
#   #and it has highest proprity values 
   
# }

variable "rgname1" {
  #    terraform.tfvars  
  #if there is mulktple rg is there and readablity is not there so we individually create 
  # .auto.tfvars file with different rg names
   
}
variable "rgname2" {
  
}

resource "azurerm_resource_group" "rg-dev1" {
  name     = var.rgname1
  location = "West Europe"
}
resource "azurerm_resource_group" "rg-dev2" {
  name     = var.rgname2
  location = "West Europe"
}


# highetest proprities
# terraform.tfvars >>>>>>>> cli  >>>>> default 





