locals {
  team_members = flatten([
    for tf_id, team in var.teams : [
      for member in team.members : {
        tf_id  = tf_id # Required to prevent deletion of teams when changing team names
        member = member
      }
    ]
  ])

  team_maintainers = flatten([
    for tf_id, team in var.teams : [
      for maintainer in team.maintainers : {
        tf_id      = tf_id # Required to prevent deletion of teams when changing team names
        maintainer = maintainer
      }
    ]
  ])
}

data "github_user" "all" {
  for_each = { for v in setunion(concat(var.members, var.admins)) : v => v }
  username = each.key
}
