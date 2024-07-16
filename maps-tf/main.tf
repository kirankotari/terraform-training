locals {
  containers = {
    alpha = {
      internal = 80
      external = 9001
    }
    bravo = {
      internal = 80
      external = 9002
    }
    charlie = {
      internal = 80
      external = 9003
    }
  }
}

resource "null_resource" "dumm_vents" {
for_each = tomap(local.containers)
triggers = {
    name = each.key
    internal_port = each.value.internal
    external_port = each.value.external
  }
}

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = true
}
resource "docker_container" "nginx" {
  for_each = tomap(local.containers)
  image = docker_image.nginx.image_id # name
  name  = each.key # var.container_name
  ports {
    internal = each.value.internal
    external = each.value.external
  }
}
