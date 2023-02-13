/*
The most simple declaration of the module

module "example_app" {
  source = "github.com/lukasindre/terraform-okta-oauth-generator.git?ref=v2.0.1"
  label  = "Test App"
  client_credentials = {
    client_client_id     = local.creds["client_client_id"]
    client_client_secret = local.creds["client_client_secret"]
    server_client_id     = local.creds["server_client_id"]
    server_client_secret = local.creds["server_client_secret"]
  }
}

data "aws_secretsmanager_secret_version" "creds" {
  secret_id = local.secret_id
}

locals {
  secret_id          = "my-secret-id"
  credentials_object = jsondecode(data.aws_secretsmanager_secret_version.creds.secret_string)
}
*/
