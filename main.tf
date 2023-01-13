resource "okta_app_oauth" "client_side_app" {
  label                      = "${var.label} - Client"
  type                       = var.client_type
  grant_types                = var.client_grant_types
  response_types             = var.client_response_types
  token_endpoint_auth_method = "client_secret_basic"
  client_id                  = local.creds["client_client_id"]
  client_basic_secret        = local.creds["client_client_secret"]
  omit_secret                = true
  redirect_uris              = var.redirect_uris
}

resource "okta_app_oauth" "server_side_app" {
  label                      = "${var.label} - Server"
  type                       = var.client_type
  grant_types                = var.client_grant_types
  response_types             = var.client_response_types
  token_endpoint_auth_method = "client_secret_basic"
  client_id                  = local.creds["server_client_id"]
  client_basic_secret        = local.creds["server_client_secret"]
  omit_secret                = true
  redirect_uris              = var.redirect_uris
}

resource "okta_auth_server_scope" "scopes" {
  for_each       = local.scope_resource_object
  name           = each.value["name"]
  description    = each.value["description"]
  auth_server_id = local.default_auth_server_id
}

resource "okta_auth_server_policy" "app_policy" {
  auth_server_id = local.default_auth_server_id
  name           = "${var.label} Policy"
  client_whitelist = [
    local.creds["client_client_id"]
  ]
  description = var.policy_description
  priority    = 1
  depends_on = [
    okta_app_oauth.client_side_app
  ]
}

resource "okta_auth_server_policy_rule" "app_policy_rule" {
  name           = "${var.label} Policy Rule"
  auth_server_id = local.default_auth_server_id
  policy_id      = okta_auth_server_policy.app_policy.id
  priority       = 1
  grant_type_whitelist = [
    "client_credentials"
  ]
  scope_whitelist               = local.scope_names
  access_token_lifetime_minutes = var.access_token_lifetime_minutes
}

data "aws_secretsmanager_secret_version" "creds" {
  secret_id = var.secret_id
}

data "okta_auth_server" "default" {
  name = "default"
}

locals {
  default_auth_server_id = data.okta_auth_server.default.id
  scope_names            = [for scope in var.scopes : scope["name"]]
  scope_resource_object  = { for scope in var.scopes : scope["name"] => scope }
  creds                  = jsondecode(data.aws_secretsmanager_secret_version.creds.secret_string)
}
