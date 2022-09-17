
data "http" "ip_address" {
  url = "https://api.ipify.org"
  request_headers = {
    Accept = "text/plain"
  }
}


resource "azurerm_mssql_firewall_rule" "firewall" {
  name             = "FirewallRule1"
  server_id        = azurerm_mssql_server.sqlserver.id
  start_ip_address = "179.235.136.237"
  end_ip_address   = "179.235.136.237"

}
resource "azurerm_mssql_firewall_rule" "firewall_azservices" {
  name             = "AllowAzureServices"
  server_id        = azurerm_mssql_server.sqlserver.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}
