locals{
    common_tags={
        "managedBy"="terraform"
        "owner"="todoAppTeam"
        "environment"="dev"
     }
}

module "rg"{
    source="../../module/azurerm_resource_group"
    rg_name = "rg-todoapp"
    location = "centralIndia"
    tags=local.common_tags
}

 module "sta"{
    source="../../module/azurerm_storage_account"
    rg_name = module.rg.rg_name_output
    location = module.rg.location_output
    sa_name = "satodoaapp"
    tags=local.common_tags
 }

 module "acr"{
    source="../../module/azurerm_container_registry"
    acr_name = "acrtodopp"
    rg_name = module.rg.rg_name_output
    location = module.rg.location_output
    tags=local.common_tags
 }

 module "sqlserver"{
    source="../../module/azurerm_sql_server"
    sql_server_name = "sql-dev-todoapp"
    rg_name = module.rg.rg_name_output
    location = module.rg.location_output
    username="azureuser"
    password="azureuser@123"
    tags=local.common_tags
 }

 module "sqldb"{
   depends_on = [ module.sqlserver ]
    source="../../module/azurerm_sql_database"
    sqldb_name="sql-todoapp"
    server_id=module.sqlserver.sqldbserver_id_output
    max_sizegb ="2"
    tags=local.common_tags
 }

 module "akc"{
    source="../../module/azurerm_kubernets_cluster"
    akc_name = "akc-todoapp" 
    rg_name = module.rg.rg_name_output
    location = module.rg.location_output
    dns_prefix = "akc-todoapp"
    tags=local.common_tags
  

 }

 




