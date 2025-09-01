resource "azurerm_mssql_database" "sqldbase" {
  name         = var.sqldb_name
  server_id    = var.server_id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = var.max_sizegb
  sku_name     = "S0"
  enclave_type = "VBS"
  tags = var.tags

 
}