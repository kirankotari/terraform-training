terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.22.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "new_nginx" {
  name         = "nginx:1.19.6"
  keep_locally = true // keep image after "destroy"
}

resource "docker_container" "new_nginx" {
  image = docker_image.new_nginx.image_id
  name  = "tutorial"
  ports {
    internal = 80
    external = 8000
  }
}
