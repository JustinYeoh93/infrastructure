locals {
  members = setunion(
    flatten(
      concat(
        var.admins, (
          [
            for v in var.teams : [
              concat(v.members, v.maintainers)
            ]
          ]
        )
      )
    )
  )

  team_members = flatten(
    [
      for tf_id, team in var.teams : [
        for member in team.members : {
          tf_id  = tf_id # Required to prevent deletion of teams when changing team names
          team   = team.name
          member = member
        }
      ]
    ]
  )

  team_maintainers = flatten([
    for tf_id, team in var.teams : [
      for maintainer in team.maintainers : {
        tf_id      = tf_id # Required to prevent deletion of teams when changing team names
        team       = team.name
        maintainer = maintainer
      }
    ]
  ])
}

data "github_user" "members" {
  for_each = { for v in local.members : v => v }
  username = each.key
}
