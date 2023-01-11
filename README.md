# okta_server_to_server_auth
Example of self service developer authentication using okta and terraform

Here is an example of how easy it is for developers to build oauth with Okta using Terraform

**Before implementation, audit this code for your own sanity.  Secrets will be stored in your tfstate file due to the nature of how Terraform handles them.  Make sure that you have a secure destination and understanding of your tfstate file prior to using this.  For example, using an S3 backend with server side encryption.**

Have you ever had to build out an oauth flow before?  It can be super overwhelming and cumbersome.  No longer (if you have Okta and AWS at your fingertips).  This module makes use of Okta's authorization servers, scopes, access policies, rules, and oauth applications, as well as a secret store (AWS secrets manager) for developers to bring their own credentials along with their application/service's name, and with 5 simple lines of terraform code, they can be up and running with tokens!
