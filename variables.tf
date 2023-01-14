variable "label" {
  type        = string
  nullable    = false
  description = "this is the name of your service"
}

variable "client_type" {
  type        = string
  nullable    = false
  default     = "web"
  description = "the type of application this is (web)"
}

variable "client_grant_types" {
  type     = list(string)
  nullable = false
  default = [
    "client_credentials",
    "authorization_code",
    "implicit"
  ]
  description = "grant type for your application"
}

variable "client_response_types" {
  type        = list(string)
  nullable    = false
  default     = ["token", "code"]
  description = "type of response from auth server"
}

variable "scopes" {
  type = list(object({
    name        = string,
    description = string
  }))
  nullable    = false
  description = "list of scope objects that you'll need for your app"
  default = [{
    "name" : "service.object.admin",
    "description" : "admin permission for your services object"
    },
    {
      "name" : "service.object.read",
  "description" : "read permission for your service's object" }]
}

variable "access_token_lifetime_minutes" {
  type        = number
  nullable    = false
  default     = 5
  description = "number of minutes your access token is valid for"
}

variable "client_credentials" {
  type = object({
    client_client_id     = string,
    client_client_secret = string,
    server_client_id     = string,
    server_client_secret = string
  })
  nullable    = false
  description = "This object is sensitive, and contains the credentials you wish to use for your okta oauth clients.  Please make sure to use a secure way to load in your secrets."
  sensitive   = true
}

variable "redirect_uris" {
  type        = list(string)
  nullable    = false
  default     = ["https://google.com"]
  description = "list of redirect URIs for a redirect-based flow"
}

variable "policy_description" {
  type        = string
  default     = "This policy is made for the application it is constrained to"
  description = "this allows you to set the description for your apps access policy"
}

