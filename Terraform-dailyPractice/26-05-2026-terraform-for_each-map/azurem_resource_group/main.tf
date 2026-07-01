# resource "azurerm_resource_group" "rg1" {
#   name = "nayanrg2.0"
#   location = "east us"
# }
# #PROBLEMS ----
# # 1---COPY PASTE 
# #2 --- MULPTILE RG

# FOR_EACH+ LIST ----- multiple rg same location 

# resource "azurerm_resource_group" "rg2" {
#   for_each = toset(["nayan-rg123", "varsha123", "praveen13", "nayan-rg123"])
#   name     = each.value
#   location = "eastus"
# }

#variable 
# type1 ---default
# variable "rg_name" {
#   type = string
#   default = "nayan-rg"
# }

# resource "azurerm_resource_group" "rg2" {
  
#   name     = var.rg_name
#   location = "eastus"
# }

# type2 =--cli

# variable "rg2" {
  
# }

# resource "azurerm_resource_group" "rg2" {
#   for_each = toset(var.rg2)
#   name     = each.value
#   location = "eastus"
# }
# promblrm--- multipe rg , hardcoded location

# type3 --foreach +map {}

# variable "rg2" {
  
# }

# resource "azurerm_resource_group" "rg2" {
#   for_each = var.rg2
#   name     = each.key
#   location = each.value
# }
# problem --= name ,location, managed_by 

# for_each+nested  {key {key=value}}


variable "rg2" {
  
}

resource "azurerm_resource_group" "rg2" {
  for_each = var.rg2
  name     = each.value.name
  location = each.value.location
  managed_by = each.value.mb
}

#variable
# string  - "acha123" 
# number - 1231, -23, 2.0
# bool - true/false
# foreach +list ---  []  === value ={"apple" , "mango", "apple" }  
# toset()------function  - duplicate remove 

# foreach +map === {}  === key-value pair 

# [persons1 = "nayan"]