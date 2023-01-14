# terraform-okta-oauth-generator

Here is an example of how easy it is for developers to build oauth with Okta using Terraform

**Before implementation, audit this code for your own sanity.  Secrets will be stored in your tfstate file due to the nature of how Terraform handles them.  Make sure that you have a secure destination and understanding of your tfstate file prior to using this.  For example, using an S3 backend with server side encryption.**

Have you ever had to build out an oauth flow before?  It can be super overwhelming and cumbersome.  No longer!  This module makes use of Okta's authorization servers, scopes, access policies, rules, and oauth applications for developers to bring their own credentials along with their application/service's name, and with a very simple module declaration of terraform code, they can be up and running with access tokens as fast as your CICD pipeline can deploy!
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_okta"></a> [okta](#requirement\_okta) | 3.39.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_okta"></a> [okta](#provider\_okta) | 3.39.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [okta_app_oauth.client_side_app](https://registry.terraform.io/providers/okta/okta/3.39.0/docs/resources/app_oauth) | resource |
| [okta_app_oauth.server_side_app](https://registry.terraform.io/providers/okta/okta/3.39.0/docs/resources/app_oauth) | resource |
| [okta_auth_server_policy.app_policy](https://registry.terraform.io/providers/okta/okta/3.39.0/docs/resources/auth_server_policy) | resource |
| [okta_auth_server_policy_rule.app_policy_rule](https://registry.terraform.io/providers/okta/okta/3.39.0/docs/resources/auth_server_policy_rule) | resource |
| [okta_auth_server_scope.scopes](https://registry.terraform.io/providers/okta/okta/3.39.0/docs/resources/auth_server_scope) | resource |
| [okta_auth_server.default](https://registry.terraform.io/providers/okta/okta/3.39.0/docs/data-sources/auth_server) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_token_lifetime_minutes"></a> [access\_token\_lifetime\_minutes](#input\_access\_token\_lifetime\_minutes) | number of minutes your access token is valid for | `number` | `5` | no |
| <a name="input_client_credentials"></a> [client\_credentials](#input\_client\_credentials) | This object is sensitive, and contains the credentials you wish to use for your okta oauth clients.  Please make sure to use a secure way to load in your secrets. | <pre>object({<br>    client_client_id     = string,<br>    client_client_secret = string,<br>    server_client_id     = string,<br>    server_client_secret = string<br>  })</pre> | n/a | yes |
| <a name="input_label"></a> [label](#input\_label) | this is the name of your service | `string` | n/a | yes |
| <a name="input_oauth_config"></a> [oauth\_config](#input\_oauth\_config) | This holds the request and response parameters for your oauth applications | <pre>object({<br>    application_type = string,<br>    grant_types = list(string),<br>    response_types = list(string)<br>  })</pre> | <pre>{<br>  "application_type": "web",<br>  "grant_types": [<br>    "client_credentials",<br>    "authorization_code"<br>  ],<br>  "response_types": [<br>    "code"<br>  ]<br>}</pre> | no |
| <a name="input_policy_description"></a> [policy\_description](#input\_policy\_description) | this allows you to set the description for your apps access policy | `string` | `"This policy is made for the application it is constrained to"` | no |
| <a name="input_redirect_uris"></a> [redirect\_uris](#input\_redirect\_uris) | list of redirect URIs for a redirect-based flow | `list(string)` | <pre>[<br>  "https://google.com"<br>]</pre> | no |
| <a name="input_scopes"></a> [scopes](#input\_scopes) | list of scope objects that you'll need for your app | <pre>list(object({<br>    name        = string,<br>    description = string<br>  }))</pre> | <pre>[<br>  {<br>    "description": "admin permission for your services object",<br>    "name": "service.object.admin"<br>  },<br>  {<br>    "description": "read permission for your service's object",<br>    "name": "service.object.read"<br>  }<br>]</pre> | no |

## Outputs

No outputs.
