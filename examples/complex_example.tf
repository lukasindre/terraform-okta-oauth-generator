/*
This declaration includes a couple more custom values
that would most likely be used in a production scenario

module "easy_bake_service" {
  source = "github.com/lukasindre/terraform-okta-oauth-generator.git?ref=v1.0.0"
  label  = "Easy Bake Oven"
  scopes = [
    {
      "name": "dough.cookie.mix",
      "description": "grant permission to mix cookie dough"
    },
    {
      "name": "dough.cookie.bake",
      "description": "grant permission to bake the cookie dough"
    },
    {
      "name": "cupcake.batter.mix",
      "description": "grant permission to mix cupcake batter"
    }
  ]
  access_token_lifetime_minutes = 60
  secret_id                     = "my_easy_bake_oven_credentials"
  policy_description            = "This policy restricts what the OAuth app is allowed to do with the easy bake oven service."
}
*/
