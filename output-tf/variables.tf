provider "random" {}

resource "random_pet" "container_count" {
  length = 3
  separator = "-"
}
# variable "container_name"{
#  # description = "this will be name of the container that gets made"
#  # default = "somethingelse"
#  # type  = string
#  # senative ()
# }

variable "external_port"{
  description = "container external port"
  default = 9100
  type = number
  # senative ()
}

variable "internal_port" {
  description = "container internal port"
  default = 80
  type = number
}

variable "alpha" {
  default = "break time please"
}

output "bravo" {
  value = var.alpha
}

#output "datipv4address" {
# value = docker_container.nginx.ip_address
#}

output "bhoo" {
 # value = "Chad it's ${var.alpha}"
  value = random_pet.container_count
}
