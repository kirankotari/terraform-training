terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.22.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx:1.19.6"
  keep_locally = true       // keep image after "destroy"
}

resource "docker_container" "nginx" {
  count = 3
  image = docker_image.nginx.image_id
  # name  = var.container_name # "tutorial"
  name  = "${random_pet.container_count.id}-${count.index}"
  ports {
    internal = var.internal_port
    external = var.external_port + count.index
  }
}

