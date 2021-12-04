locals {
  members = setunion(flatten([
    for _id, team in var.teams : concat(team.members, team.maintainers)
  ]))

  team_members = flatten([
    for tf_id, team in var.teams : [
      for member in team.members : {
        tf_id    = tf_id
        team   = team.name
        member = member
      }
    ]
  ])

  team_maintainers = flatten([
    for tf_id, team in var.teams : [
      for maintainer in team.maintainers : {
        tf_id        = tf_id
        team       = team.name
        maintainer = maintainer
      }
    ]
  ])
}
