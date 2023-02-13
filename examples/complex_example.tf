/*
This declaration includes a couple more custom values
that would most likely be used in a production scenario

module "easy_bake_service" {
  source = "github.com/lukasindre/terraform-okta-oauth-generator.git?ref=v2.0.1"
  label  = "Easy Bake Oven"
  scopes = [
    {
      "name" : "dough.cookie.mix",
      "description" : "grant permission to mix cookie dough"
    },
    {
      "name" : "dough.cookie.bake",
      "description" : "grant permission to bake the cookie dough"
    },
    {
      "name" : "cupcake.batter.mix",
      "description" : "grant permission to mix cupcake batter"
    }
  ]
  access_token_lifetime_minutes = 60
  client_credentials = {
    client_client_id     = local.creds["client_client_id"]
    client_client_secret = local.creds["client_client_secret"]
    server_client_id     = local.creds["server_client_id"]
    server_client_secret = local.creds["server_client_secret"]
  }
  policy_description = "This policy restricts what the OAuth app is allowed to do with the easy bake oven service."
}

data "aws_secretsmanager_secret_version" "creds" {
  secret_id = local.secret_id
}

locals {
  secret_id          = "my-secret-id"
  credentials_object = jsondecode(data.aws_secretsmanager_secret_version.creds.secret_string)
}
*/
