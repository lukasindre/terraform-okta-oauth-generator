# okta_server_to_server_auth
Example of self service developer authentication using okta and terraform

Here is an example of how easy it is for developers to build oauth with Okta using Terraform

**Before implementation, audit this code for your own sanity.  Secrets will be stored in your tfstate file due to the nature of how Terraform handles them.  Make sure that you have a secure destination and understanding of your tfstate file prior to using this.  For example, using an S3 backend with server side encryption.**

Have you ever had to build out an oauth flow before?  It can be super overwhelming and cumbersome.  No longer (if you have Okta and AWS at your fingertips).  This module makes use of Okta's authorization servers, scopes, access policies, rules, and oauth applications, as well as a secret store (AWS secrets manager) for developers to bring their own credentials along with their application/service's name, and with 5 simple lines of terraform code, they can be up and running with tokens!
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.49.0 |
| <a name="requirement_okta"></a> [okta](#requirement\_okta) | 3.39.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.49.0 |
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
| [aws_secretsmanager_secret_version.creds](https://registry.terraform.io/providers/hashicorp/aws/4.49.0/docs/data-sources/secretsmanager_secret_version) | data source |
| [okta_auth_server.default](https://registry.terraform.io/providers/okta/okta/3.39.0/docs/data-sources/auth_server) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_token_lifetime_minutes"></a> [access\_token\_lifetime\_minutes](#input\_access\_token\_lifetime\_minutes) | number of minutes your access token is valid for | `number` | `5` | no |
| <a name="input_client_grant_types"></a> [client\_grant\_types](#input\_client\_grant\_types) | grant type for your application | `list(string)` | <pre>[<br>  "client_credentials",<br>  "authorization_code",<br>  "implicit"<br>]</pre> | no |
| <a name="input_client_response_types"></a> [client\_response\_types](#input\_client\_response\_types) | type of response from auth server | `list(string)` | <pre>[<br>  "token",<br>  "code"<br>]</pre> | no |
| <a name="input_client_type"></a> [client\_type](#input\_client\_type) | the type of application this is (web) | `string` | `"web"` | no |
| <a name="input_label"></a> [label](#input\_label) | this is the name of your service | `string` | n/a | yes |
| <a name="input_policy_description"></a> [policy\_description](#input\_policy\_description) | this allows you to set the description for your apps access policy | `string` | `"This policy is made for the application it is constrained to"` | no |
| <a name="input_redirect_uris"></a> [redirect\_uris](#input\_redirect\_uris) | list of redirect URIs for a redirect-based flow | `list(string)` | <pre>[<br>  "https://google.com"<br>]</pre> | no |
| <a name="input_scopes"></a> [scopes](#input\_scopes) | list of scope objects that you'll need for your app | <pre>list(object({<br>    name        = string,<br>    description = string<br>  }))</pre> | <pre>[<br>  {<br>    "description": "admin permission for your services object",<br>    "name": "service.object.admin"<br>  },<br>  {<br>    "description": "read permission for your service's object",<br>    "name": "service.object.read"<br>  }<br>]</pre> | no |
| <a name="input_secret_id"></a> [secret\_id](#input\_secret\_id) | This ID is the value for your secret in AWS that contains client IDs and secrets for your client/server side apps.  The secret should be JSON, and have the keys `[client_client_id, client_client_secret, server_client_id, server_client_secret]` | `string` | n/a | yes |

## Outputs

No outputs.
