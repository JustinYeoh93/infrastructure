locals {
  memberships = flatten([
    concat([
      for v in var.members.admins : {
        username = v
        role     = "admin"
      }],
      [
        for v in var.members.members : {
          username = v
          role     = "member"
      }]
    )
  ])
  team_memberships = flatten([
    concat([
      for k, v in var.teams : [
        for maintainer in v.maintainers : {
          tf_id    = k
          username = maintainer
          role     = "maintainer"
        }
      ]], [
      for k, v in var.teams : [
        for member in v.members : {
          tf_id    = k
          username = member
          role     = "member"
        }
      ]]
    )
  ])
}

data "github_user" "all" {
  for_each = { for v in setunion(concat(var.members.members, var.members.admins)) : v => v }
  username = each.key
}
