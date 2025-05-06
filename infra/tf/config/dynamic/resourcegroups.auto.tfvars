resource_groups = {
  resource_group_1 = {
    name     = "#{resourceGroupPrefix}#-#{env}#"
    location = "#{location}#"
    tags = {
      created_by  = "#{ownerName}#"
      contact_dl  = "#{ownerEmail}#"
      Application = "Terraform Test"
    }
  }
}
