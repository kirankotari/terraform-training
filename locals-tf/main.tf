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
  image = docker_image.nginx.image_id
  name  = var.container_name # "tutorial"
  ports {
    internal = var.internal_port
    external = var.external_port
  }
}

locals {

}

variable "container_name"{
  description = "this will be name of the container that gets made"
  default = "somethingelse"
  type  = string
  # senative ()
}

variable "external_port"{
  description = "container external port"
  default = 2224
  type = number
  # senative ()
}

variable "internal_port" {
  description = "container internal port"
  default = 80
  type = number
}
