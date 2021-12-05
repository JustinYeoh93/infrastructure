# Organization Admins
resource "github_membership" "admins" {
  for_each = { for admin in var.admins : admin => admin }
  username = each.key
  role     = "admin"
}

# Organization Members
resource "github_membership" "members" {
  for_each = { for member in var.members : member => member }
  username = each.key
  role     = "member"
}

# Organization Team
resource "github_team" "teams" {
  for_each       = { for tf_id, team in var.teams : tf_id => team } # Not using name as key because there are the potential of team changes
  name           = each.value.name
  description    = each.value.description
  privacy        = each.value.privacy
  parent_team_id = each.value.parent_team_id
}

# Team maintainers
resource "github_team_membership" "team_maintainers" {
  for_each = { for v in local.team_maintainers : format("%s__%s", v.tf_id, v.maintainer) => v }
  team_id  = github_team.teams[each.value.tf_id].id
  username = data.github_user.all[each.value.maintainer].login # Validate that the user exist before adding it into a team
  role     = "maintainer"
}

# Team members
resource "github_team_membership" "team_members" {
  for_each = { for v in local.team_members : format("%s__%s", v.tf_id, v.member) => v }
  team_id  = github_team.teams[each.value.tf_id].id
  username = data.github_user.all[each.value.member].login # Validate that the user exist before adding it into a team
  role     = "member"
}
