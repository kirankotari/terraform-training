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
  name         = "nginx:1.23.2" # "nginx:latest"
  keep_locally = true
}

variable "docker_containers" {
  default = {
                "one": 9001
                "two": 9002
                "three": 9003
                "four": 9004
            }
}
resource "docker_container" "nginx" {
  for_each = tomap(var.docker_containers)
  image = docker_image.nginx.image_id # name
  name  = each.key # var.container_name
  ports {
    internal = 80
    external = each.value
  }
}
variable "container_name" {
  description = "Name of the Docker container"
  default = "nginx_demo"
}
#output "container_id" {
#  description = "ID of the Docker container"
#  value       = docker_container.nginx.id
#}

output "image_id" {
  description = "ID of the Docker image"
  value       = docker_image.nginx.id
}
