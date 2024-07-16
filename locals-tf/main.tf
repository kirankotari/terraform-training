// mutable
// .tf environment verible -auto.tfvars .tfvars
variable "demo1" {
  default = "spider-man"
}

output "hello" {
  value = var.demo1
}

// immutiable, can't change on CLI
locals {
  demo2 = "deadpool"
  demo3 = "${upper(var.demo1)} IS AWESOME!!"
  ipv4regex = "\b(.*)\b"
}

output "antihero" {
 value = local.demo3
}
