

# resource "azurerm_resource_group" "rgs" {
#   name     = "rg_name1"
#   location = "Westeurope"
# }
# #problem 1 -- hardcoded way and multiple rg creation with copy-paste


#for_each+ list 
# variable "rg_name" {
# }

# resource "azurerm_resource_group" "rgs" {
#     for_each = toset(var.rg_name) #  rg_name =["rg_name1", "rg_name2","rg_name3","rg_name4"]
#   name     = each.key
#   location = "Westeurope"
# }


# #problem 1 -- creation of multiple rg with same location if we wanat the different location
# we can't do with this --------for_each+ map come


#for_each + map
variable "rg_name" {}
resource "azurerm_resource_group" "rg_name" {
  for_each = var.rg_name
  name     = each.key
  location = each.value
}

# Now the problem is as there only 2 argument name and location so there only key and value therefore
# if want to created multiple storage account so there is 5 argument
# so for this we use for_Each + Nested map
