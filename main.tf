provider "azurerm" { 
 tenant_id   = var.tenant_id
 subscription_id = var.subscription_id
 # Prevents automatic registration of resource providers
 resource_provider_registrations = "none"
 features {} 
} 

# Create Storage Account 
resource "azurerm_storage_account" "sg1" { 
 name      =  "csestoragelogobapt" #add your name to make it unique. Can only consist of lowercase letters and numbers, and must be between 3 and 24 characters long.
 resource_group_name   =  var.rg_name
 location     =  var.location
 # Performance tier: Standard (HDD-backed)
 account_tier    =  "Standard" 
  # Replication strategy:
  # LRS = Locally Redundant Storage
 account_replication_type =  "LRS" 
 # Allows public access to blobs/containers
 allow_nested_items_to_be_public = true 
} 
# Create a Blob inside the Storage Account
resource "azurerm_storage_container" "newcontainer1" { 
 name     =  "container-logo" 
 storage_account_id =  azurerm_storage_account.sg1.id
 # Access level: "blob"    = anonymous read access to blobs only
 container_access_type =  "blob" 
} 

# Create Storage Account 
resource "azurerm_storage_account" "sg2" { 
 name      =  "cselogsteam15" #add your team name to make it unique. Can only consist of lowercase letters and numbers, and must be between 3 and 24 characters long.
 resource_group_name   =  var.rg_name
 location     =  var.location
 # Performance tier: Standard (HDD-backed)
 account_tier    =  "Standard" 
  # Replication strategy:
  # LRS = Locally Redundant Storage
 account_replication_type =  "LRS" 
 # Allows public access to blobs/containers
 allow_nested_items_to_be_public = true 
} 
# Create a Blob inside the Storage Account
resource "azurerm_storage_container" "newcontainer2" { 
 name     =  "container-logs" 
 storage_account_id =  azurerm_storage_account.sg2.id
 # Access level: "blob"    = anonymous read access to blobs only
 container_access_type =  "blob" 
} 

