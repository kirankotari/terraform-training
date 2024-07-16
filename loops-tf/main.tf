
locals {
  heros = ["deadpool", "batman", "hellboy"]
  heros_new = {
                "deadpool" = "wade wilson"
                "batman" = "bruce wayne"
                "hellboy" = "anung un rama"
              }
}

// SCENARIO: we want to make infra. XYZ for each hero in the tuple above
// each.key
// each.value

resource "null_resource" "emptything" {
  for_each = toset(local.heros)
  triggers = {
    heroname = each.value
  }
}
resource "null_resource" "second_empty" {
  for_each = tomap(local.heros_new)
  triggers = {
    heroname = each.key
    realname = each.value
  }
}
