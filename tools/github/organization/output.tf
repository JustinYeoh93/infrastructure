output "teams" {
  value       = github_team.teams
  description = "description"
}

output "members_id" {
  value = {
    for k, v in data.github_user.all : k => v.id
  }
}