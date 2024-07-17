// https://swapi.dev/api/people/1

terraform {
 required_providers {
  http = {
    source = "hashicorp/http"
    version = "3.0.1"
  }
 }
}

provider "http" {}

data "http" "example" {
  url = "https://swapi.dev/api/people/1"

  # Optional request headers
  request_headers = {
    Accept = "application/json"
  }
}

locals {
  character = jsondecode(data.http.example.response_body).name
}

output "starwars" {
  value = local.character
}
