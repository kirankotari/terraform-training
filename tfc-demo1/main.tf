terraform {
  cloud {
    organization = "kirankotari"

    workspaces {
      name = "dev"
    }
  }
  required_providers {
    null = {
      source = "hashicorp/null"
      version = "3.1.1"
    }
  }
}

provider "null" {}

locals {
  fellowships = ["frodo", "gandalf", "strider"]
}

resource "null_resource" "fellowship" {
for_each = toset(local.fellowships)
triggers = {
  name = each.value
}
}
