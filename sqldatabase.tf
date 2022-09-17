provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-sqldatabase"
  location = "brazilsouth"
}


resource "azurerm_mssql_server" "sqlserver" {
  name                         = "mssqlserverdev"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  version                      = "12.0"
  administrator_login          = "bdadmin"
  administrator_login_password = "thisIsDog11"

  tags = {
    environment = "dev"
  }
}

resource "azurerm_mssql_database" "sqldbdev" {
  name         = "db_terraform_dev01"
  server_id    = azurerm_mssql_server.sqlserver.id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  sku_name     = "Basic"

  tags = {
    environment = "dev"
  }
}

resource "azurerm_mssql_database" "sqldbprod" {
  name         = "db_terraform_prod01"
  server_id    = azurerm_mssql_server.sqlserver.id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  sku_name     = "Basic"

  tags = {
    environment = "prod"
  }
}

resource "azurerm_mssql_database" "sqldbhomo" {
  name         = "db_terraform_homolog01"
  server_id    = azurerm_mssql_server.sqlserver.id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  sku_name     = "Basic"

  tags = {
    environment = "homolog"
  }
}