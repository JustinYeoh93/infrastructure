# Organization Members
resource "github_membership" "memberships" {
  for_each = { for v in local.memberships : v.username => v }
  username = each.key
  role     = each.value.role
}

# Organization Team
resource "github_team" "teams" {
  for_each       = { for tf_id, team in var.teams : tf_id => team } # Not using name as key because there are the potential of team changes
  name           = each.value.name
  description    = each.value.description
  privacy        = each.value.privacy
  parent_team_id = each.value.parent_team_id
}

# Team memberships
resource "github_team_membership" "team_memberships" {
  for_each = { for v in local.team_memberships : format("%s__%s", v.tf_id, v.username) => v }
  team_id  = github_team.teams[each.value.tf_id].id
  username = data.github_user.all[each.value.username].login # Validate that the user exist before adding it into a team
  role     = each.value.role
}
