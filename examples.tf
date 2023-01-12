/*
The most simple declaration of the module

module "example_app" {
  source         = "${ path/to/module | module_url }"
  label          = "Test App"
  secret_id      = "test-secret"
}
*/

/*
This declaration includes a couple more custom values
that would most likely be used in a production scenario

module "easy_bake_service" {
  source = "${ path/to/module | module_url }"
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
